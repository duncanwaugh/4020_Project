import cv2
import numpy as np
import time
from djitellopy import Tello

# Global variable to track the drone's assumed current yaw (in degrees)
current_yaw = 0

def set_yaw(tello, target_yaw):
    """
    Rotates the drone from the current yaw to the target_yaw using the shortest rotation.
    Updates the global current_yaw.
    """
    global current_yaw
    diff = (target_yaw - current_yaw + 360) % 360
    if diff > 180:
        diff -= 360  # rotate counter-clockwise
    if diff > 0:
        tello.rotate_clockwise(diff)
    elif diff < 0:
        tello.rotate_counter_clockwise(-diff)
    current_yaw = target_yaw

def load_yolo():
    """
    Loads the YOLO model using the provided file paths.
    """
    weights_path = r"C:\Users\dunca\OneDrive\School(2024-2025)\4020_Project\drone\yolov4.weights"
    config_path  = r"C:\Users\dunca\OneDrive\School(2024-2025)\4020_Project\drone\yolov4.cfg"
    names_path   = r"C:\Users\dunca\OneDrive\School(2024-2025)\4020_Project\drone\coco.names"
    
    net = cv2.dnn.readNet(weights_path, config_path)
    with open(names_path, "r") as f:
        classes = [line.strip() for line in f.readlines()]
    
    # Get the output layer names (convert to 0-based indexing)
    layer_names = net.getLayerNames()
    output_layers = [layer_names[i - 1] for i in net.getUnconnectedOutLayers()]
    
    return net, classes, output_layers

def obstacle_detected_yolo(net, output_layers, classes, frame,
                           conf_threshold=0.5, roi_fraction=0.1, area_fraction_threshold=0.5):
    """
    Uses YOLO to detect objects in the frame.
    
    A central ROI is defined (using roi_fraction). For any detection with confidence > conf_threshold
    and the detected class is "person", if the center of its bounding box falls within the ROI and
    its area exceeds area_fraction_threshold of the ROI, an obstacle is considered detected.
    """
    h, w, _ = frame.shape
    roi_top = int(h * (0.5 - roi_fraction / 2))
    roi_bottom = int(h * (0.5 + roi_fraction / 2))
    roi_left = int(w * (0.5 - roi_fraction / 2))
    roi_right = int(w * (0.5 + roi_fraction / 2))
    roi_area = (roi_bottom - roi_top) * (roi_right - roi_left)
    
    blob = cv2.dnn.blobFromImage(frame, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
    net.setInput(blob)
    detections = net.forward(output_layers)
    
    for out in detections:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            # Only consider detections labeled "person"
            if confidence > conf_threshold and classes[class_id].lower() == "person":
                center_x = int(detection[0] * w)
                center_y = int(detection[1] * h)
                box_width = int(detection[2] * w)
                box_height = int(detection[3] * h)
                # Check if the detection's center is within the ROI.
                if roi_left <= center_x <= roi_right and roi_top <= center_y <= roi_bottom:
                    box_area = box_width * box_height
                    if box_area / roi_area > area_fraction_threshold:
                        return True
    return False

def check_for_obstacle_fused(tello, net, output_layers, classes, num_checks=5, detection_threshold=3, tof_threshold=150):
    """
    Implements temporal filtering and sensor fusion.
    
    - Checks for obstacles over 'num_checks' frames, counting how many times a person is detected.
    - Reads the ToF sensor.
    - Returns True only if at least 'detection_threshold' detections occur AND the ToF sensor reading
      is below 'tof_threshold' (cm).
    """
    detection_count = 0
    for _ in range(num_checks):
        frame = tello.get_frame_read().frame
        if frame is not None:
            if obstacle_detected_yolo(net, output_layers, classes, frame,
                                      conf_threshold=0.5, roi_fraction=0.1, area_fraction_threshold=0.5):
                detection_count += 1
        time.sleep(0.1)
    tof_distance = tello.get_distance_tof()
    print(f"Fused sensor check: detection_count={detection_count}, ToF={tof_distance} cm")
    if detection_count >= detection_threshold and (tof_distance != 0 and tof_distance < tof_threshold):
        return True
    else:
        return False

def avoid_object(tello):
    """
    Executes an avoidance maneuver.
    (This is a preset maneuver; you might want to refine it.)
    """
    print("Obstacle confirmed! Executing avoidance maneuver.")
    tello.send_rc_control(0, 0, 0, 0)
    time.sleep(0.5)
    try:
        # Example maneuver: move right, forward, then left.
        tello.move_right(75)
        time.sleep(0.5)
        tello.move_forward(100)
        time.sleep(0.5)
        tello.move_left(75)
        time.sleep(0.5)
    except Exception as e:
        print("Error during avoidance maneuver:", e)
    print("Avoidance maneuver complete.")

def fly_segment(tello, net, output_layers, classes,
                distance, check_yaw, flight_yaw,
                forward_speed=20, check_interval=0.1, photo_interval=1.0):
    """
    Flies one segment of the path.
    
    Steps:
      1. Stop and rotate to the obstacle-check yaw (direction along the segment).
      2. Check for obstacles using temporal filtering & sensor fusion.
      3. If clear, rotate to the flight yaw (so that the camera points inside).
      4. Fly the segment using a leftward velocity command (which moves the drone along the edge).
      5. Simulate taking photos at fixed intervals.
    """
    # Step 1: Rotate to check direction.
    tello.send_rc_control(0, 0, 0, 0)
    time.sleep(0.5)
    print(f"Rotating to check direction: {check_yaw}°")
    set_yaw(tello, check_yaw)
    time.sleep(1)
    
    # Step 2: Check for obstacles with temporal filtering & sensor fusion.
    print("Checking path for obstacles (fused sensor and temporal filtering)...")
    if check_for_obstacle_fused(tello, net, output_layers, classes,
                                num_checks=5, detection_threshold=3, tof_threshold=150):
        avoid_object(tello)
        # Optionally, you might loop here until the path is clear.
    
    # Step 3: Rotate to flight yaw (inward-facing).
    print(f"Rotating to flight (inside) direction: {flight_yaw}°")
    set_yaw(tello, flight_yaw)
    time.sleep(0.5)
    
    # Step 4: Fly the segment.
    desired_time = distance / forward_speed
    start_time = time.time()
    last_photo_time = 0.0
    print(f"Flying segment: {distance} cm at {forward_speed} cm/s (~{desired_time:.1f} s).")
    while time.time() - start_time < desired_time:
        # Command leftward velocity (which, given the yaw, moves the drone along the edge)
        tello.send_rc_control(20, 0, 0, 0)
        time.sleep(check_interval)
        # Simulate photo capture at fixed intervals.
        if time.time() - start_time - last_photo_time >= photo_interval:
            print("Photo taken.")
            last_photo_time = time.time() - start_time
    tello.send_rc_control(0, 0, 0, 0)
    print("Segment complete.\n")

def fly_square_path(tello, net, output_layers, classes):

    # Segment 1
    fly_segment(tello, net, output_layers, classes,
                distance=200, check_yaw=90, flight_yaw=0,
                forward_speed=20, check_interval=0.1, photo_interval=1.0)
    # Segment 2
    fly_segment(tello, net, output_layers, classes,
                distance=100, check_yaw=0, flight_yaw=270,
                forward_speed=20, check_interval=0.1, photo_interval=1.0)
    # Segment 3
    fly_segment(tello, net, output_layers, classes,
                distance=200, check_yaw=270, flight_yaw=180,
                forward_speed=20, check_interval=0.1, photo_interval=1.0)
    # Segment 4
    fly_segment(tello, net, output_layers, classes,
                distance=100, check_yaw=90, flight_yaw=90,
                forward_speed=20, check_interval=0.1, photo_interval=1.0)

def main():
    # Initialize the Tello drone.
    tello = Tello()
    print("Connecting to Tello...")
    tello.connect()
    battery = tello.get_battery()
    print(f"Battery: {battery}%")
    
    # Load YOLO.
    net, classes, output_layers = load_yolo()
    
    # Start video stream.
    tello.streamon()
    time.sleep(2)
    
    try:
        print("Taking off...")
        tello.takeoff()
        time.sleep(1)
        
        # Fly the 2x2 square path.
        fly_square_path(tello, net, output_layers, classes)
        
        print("Landing...")
        tello.land()
    except Exception as e:
        print("An error occurred:", e)
        try:
            tello.land()
        except Exception as e_land:
            print("Error during landing:", e_land)
    finally:
        tello.end()

if __name__ == "__main__":
    main()
