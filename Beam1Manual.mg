{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "MeshFiltering": "3.0",
            "ImageMatching": "2.0",
            "Texturing": "6.0",
            "Meshing": "7.0",
            "FeatureMatching": "2.0",
            "StructureFromMotion": "3.3",
            "CameraInit": "9.0",
            "FeatureExtraction": "1.3",
            "DepthMap": "5.0",
            "DepthMapFilter": "4.0",
            "PrepareDenseScene": "3.1"
        }
    },
    "graph": {
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                2000,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "cc5426b7721ffadd22ecbaac1f4b1cf8fed1f588"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 2,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "exr"
                },
                "bumpMapping": {
                    "enable": true,
                    "bumpType": "Normal",
                    "normalFileType": "exr",
                    "heightFileType": "exr"
                },
                "displacementMapping": {
                    "enable": true,
                    "displacementMappingFileType": "exr"
                },
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "useScore": true,
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "workingColorSpace": "sRGB",
                "outputColorSpace": "AUTO",
                "correctEV": true,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "subdivisionTargetRatio": 0.8,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.{outputMeshFileTypeValue}",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.exr"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "9eb0a9f652c115e968e147fba8dc32e4dae5f6a0"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.output}",
                "outputMeshFileType": "obj",
                "useBoundingBox": false,
                "boundingBox": {
                    "bboxTranslation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxRotation": {
                        "x": 0.0,
                        "y": 0.0,
                        "z": 0.0
                    },
                    "bboxScale": {
                        "x": 1.0,
                        "y": 1.0,
                        "z": 1.0
                    }
                },
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10.0,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "minVis": 2,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "helperPointsGridSize": 10,
                "densify": false,
                "densifyNbFront": 1,
                "densifyNbBack": 1,
                "densifyScale": 20.0,
                "nPixelSizeBehind": 4.0,
                "fullWeight": 1.0,
                "voteFilteringForWeaklySupportedSurfaces": true,
                "addLandmarksToTheDensePointCloud": false,
                "invertTetrahedronBasedOnNeighborsNbIterations": 10,
                "minSolidAngleRatio": 0.2,
                "nbSolidAngleFilteringIterations": 2,
                "colorizeOutput": false,
                "addMaskHelperPoints": false,
                "maskHelperPointsWeight": 1.0,
                "maskBorderSize": 4,
                "maxNbConnectedHelperPoints": 50,
                "saveRawDensePointCloud": false,
                "exportDebugTetrahedralization": false,
                "seed": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1400,
                0
            ],
            "parallelization": {
                "blockSize": 24,
                "size": 33,
                "split": 2
            },
            "uids": {
                "0": "c6367969b71b763adb1a06bfd47426af732e45ec"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixToleranceFactor": 2.0,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "459c44dc2ebb614f884816d398161e74b374a40b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "SequentialAndVocabularyTree",
                "tree": "${ALICEVISION_VOCTREE}",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 40,
                "nbNeighbors": 5,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                195,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "f20872f37b48e6ae578a558de68f45bee430374f"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "masksFolder": "",
                "maskExtension": "png",
                "maskInvert": false,
                "describerTypes": [
                    "dspsift"
                ],
                "describerPreset": "normal",
                "maxNbFeatures": 0,
                "describerQuality": "normal",
                "contrastFiltering": "GridSort",
                "relativePeakThreshold": 0.01,
                "gridFiltering": true,
                "workingColorSpace": "sRGB",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "4f65bf92888a8b060a27ecdb5b8adc80e39046fb"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": "{FeatureMatching_1.describerTypes}",
                "localizerEstimator": "acransac",
                "observationConstraint": "Scale",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "nbFirstUnstableCameras": 30,
                "maxImagesPerGroup": 30,
                "bundleAdjustmentMaxOutliers": 50,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "rigMinNbCamerasForCalibration": 20,
                "lockAllIntrinsics": false,
                "minNbCamerasToRefinePrincipalPoint": 3,
                "filterTrackForks": false,
                "computeStructureColor": true,
                "useAutoTransform": true,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "logIntermediateSteps": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                1000,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "0e388f57afec541063f42b5b4804cdc544b316ee"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "masksFolders": [],
                "maskExtension": "png",
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "undistorted": "{cache}/{nodeType}/{uid0}/<VIEW_ID>.{outputFileTypeValue}"
            }
        },
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 33,
                "split": 1
            },
            "uids": {
                "0": "0928cc5a09596d5b7e8b5fad5da846b1daaef7c0"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 110918,
                        "poseId": 110918,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7093.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:28\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.7396\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:28\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:28\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37938\", \"Exif:SubsecTimeDigitized\": \"995\", \"Exif:SubsecTimeOriginal\": \"995\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.786\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"220.438\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"220.438\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.13\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.76\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 26\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 16555462,
                        "poseId": 16555462,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7117.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:01\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.36713\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:01\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:01\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"934\", \"Exif:SubsecTimeOriginal\": \"934\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.797\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"147.379\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"147.379\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.05\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.57\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 59\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 16640011,
                        "poseId": 16640011,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7111.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:53\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.17574\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:53\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:53\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38564\", \"Exif:SubsecTimeDigitized\": \"951\", \"Exif:SubsecTimeOriginal\": \"951\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.791\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"66.51\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"66.51\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.09\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.84\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 53\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 92226878,
                        "poseId": 92226878,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7103.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:44\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.00963\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:44\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:44\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"173\", \"Exif:SubsecTimeOriginal\": \"173\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"322.2\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"322.2\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 206029990,
                        "poseId": 206029990,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7102.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:42\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.00963\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:42\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:42\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"937\", \"Exif:SubsecTimeOriginal\": \"937\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"315.905\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"315.905\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 388079327,
                        "poseId": 388079327,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7114.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:57\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.85812\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:57\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:57\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3804\", \"Exif:SubsecTimeDigitized\": \"662\", \"Exif:SubsecTimeOriginal\": \"662\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.791\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"108.282\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"108.282\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.09\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.84\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 53\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 405679312,
                        "poseId": 405679312,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7110.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:52\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.92408\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:52\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:52\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38251\", \"Exif:SubsecTimeDigitized\": \"169\", \"Exif:SubsecTimeOriginal\": \"169\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.793\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"44.9612\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"44.9612\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.94\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 46\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 408017421,
                        "poseId": 408017421,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7097.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:35\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.14228\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:35\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:35\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"646\", \"Exif:SubsecTimeOriginal\": \"646\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.828\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"291.929\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"291.929\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.99\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 33\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 416255208,
                        "poseId": 416255208,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7119.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:03\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.32356\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:03\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:03\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"658\", \"Exif:SubsecTimeOriginal\": \"658\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.8\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"149.644\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"149.644\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 1\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 504865062,
                        "poseId": 504865062,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7100.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:40\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.98887\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:40\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:40\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"543\", \"Exif:SubsecTimeOriginal\": \"543\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"304.04\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"304.04\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 552531133,
                        "poseId": 552531133,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7104.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:45\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.05321\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:45\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:45\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"359\", \"Exif:SubsecTimeOriginal\": \"359\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"329.661\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"329.661\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 573359641,
                        "poseId": 573359641,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7108.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:49\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.97677\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:49\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:49\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37986\", \"Exif:SubsecTimeDigitized\": \"746\", \"Exif:SubsecTimeOriginal\": \"746\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.793\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"13.4277\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"13.4277\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.94\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 46\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 700880780,
                        "poseId": 700880780,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7095.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:32\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.15373\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:32\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:32\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37938\", \"Exif:SubsecTimeDigitized\": \"144\", \"Exif:SubsecTimeOriginal\": \"144\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.794\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"263.341\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"263.341\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.87\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 30\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 713055767,
                        "poseId": 713055767,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7096.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:33\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.06587\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:33\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:33\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"575\", \"Exif:SubsecTimeOriginal\": \"575\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.816\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"279.947\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"279.947\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.98\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.73\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 32\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 779127864,
                        "poseId": 779127864,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7101.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:41\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.03685\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:41\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:41\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"645\", \"Exif:SubsecTimeOriginal\": \"645\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"304.334\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"304.334\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 863783586,
                        "poseId": 863783586,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7115.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:59\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.79343\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:59\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:59\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"370\", \"Exif:SubsecTimeOriginal\": \"370\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.791\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"129.792\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"129.792\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.09\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.84\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 53\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1001781294,
                        "poseId": 1001781294,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7120.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:05\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.5098\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:05\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:05\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"197\", \"Exif:SubsecTimeOriginal\": \"197\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.8\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"153.101\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"153.101\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 1\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1096379691,
                        "poseId": 1096379691,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7121.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:05\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.51963\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:05\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:05\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"963\", \"Exif:SubsecTimeOriginal\": \"963\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.8\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"153.872\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"153.872\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 1\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1197179119,
                        "poseId": 1197179119,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7099.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:38\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.04831\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:38\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:38\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"940\", \"Exif:SubsecTimeOriginal\": \"940\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.826\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"306.824\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"36\", \"GPS:ImgDirection\": \"306.824\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 38\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1270084116,
                        "poseId": 1270084116,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7124.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:09\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.10151\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:09\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:09\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38142\", \"Exif:SubsecTimeDigitized\": \"918\", \"Exif:SubsecTimeOriginal\": \"918\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.805\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"188.013\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"39.1544\", \"GPS:ImgDirection\": \"188.013\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 9\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1277581517,
                        "poseId": 1277581517,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7122.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:07\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.84196\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:07\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:07\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38142\", \"Exif:SubsecTimeDigitized\": \"800\", \"Exif:SubsecTimeOriginal\": \"800\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.8\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"168.345\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"168.345\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 1\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1336061934,
                        "poseId": 1336061934,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7109.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:50\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.9516\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:50\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:50\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37986\", \"Exif:SubsecTimeDigitized\": \"668\", \"Exif:SubsecTimeOriginal\": \"668\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.793\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"21.6971\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"21.6971\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.94\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 46\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1351693343,
                        "poseId": 1351693343,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7113.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:56\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.90915\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:56\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:56\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38094\", \"Exif:SubsecTimeDigitized\": \"789\", \"Exif:SubsecTimeOriginal\": \"789\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.791\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"102.703\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"102.703\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.09\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.84\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 53\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1412435337,
                        "poseId": 1412435337,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7123.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:08\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.98594\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:08\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:08\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38142\", \"Exif:SubsecTimeDigitized\": \"746\", \"Exif:SubsecTimeOriginal\": \"746\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.805\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"176.052\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"176.052\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.89\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.76\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 7\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1510118286,
                        "poseId": 1510118286,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7098.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:37\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.07579\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:37\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:37\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"431\", \"Exif:SubsecTimeOriginal\": \"431\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.818\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"298.575\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"298.575\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.11\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.87\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 35\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1516273623,
                        "poseId": 1516273623,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7107.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:48\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.06168\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:48\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:48\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37986\", \"Exif:SubsecTimeDigitized\": \"608\", \"Exif:SubsecTimeOriginal\": \"608\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.793\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"2.24014\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"2.24014\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.94\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 46\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1523957872,
                        "poseId": 1523957872,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7112.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:54\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.08872\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:54\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:54\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.38564\", \"Exif:SubsecTimeDigitized\": \"880\", \"Exif:SubsecTimeOriginal\": \"880\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.791\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"74.7919\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"74.7919\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.09\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.84\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 53\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1570603299,
                        "poseId": 1570603299,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7094.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:31\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.1055\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:31\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:31\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37938\", \"Exif:SubsecTimeDigitized\": \"048\", \"Exif:SubsecTimeOriginal\": \"048\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.794\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"251.161\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"251.161\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.87\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 30\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1743777867,
                        "poseId": 1743777867,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7116.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:00\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.67733\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:00\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:00\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"288\", \"Exif:SubsecTimeOriginal\": \"288\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.797\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"135.838\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"135.838\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.05\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.57\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 59\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1748011782,
                        "poseId": 1748011782,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7118.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:41:02\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.33197\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:41:02\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:41:02\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37884\", \"Exif:SubsecTimeDigitized\": \"782\", \"Exif:SubsecTimeOriginal\": \"782\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.8\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"150.023\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"150.023\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.03\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.51\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 41, 1\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1873381443,
                        "poseId": 1873381443,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7092.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:28\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"1.72968\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:28\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:28\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"160\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.37986\", \"Exif:SubsecTimeDigitized\": \"176\", \"Exif:SubsecTimeOriginal\": \"176\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.786\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"209.799\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"209.799\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 18.13\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 34.76\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 26\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2025360471,
                        "poseId": 2025360471,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7105.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:46\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.13788\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:46\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:46\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"596\", \"Exif:SubsecTimeOriginal\": \"596\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.802\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"339.712\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"339.712\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.99\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 45\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2067130641,
                        "poseId": 2067130641,
                        "path": "D:/Western/4020/Beam Pics Manual/IMG_7106.JPG",
                        "intrinsicId": 1097124704,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"6.789530\", \"DateTime\": \"2025:03:21 15:40:47\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.12685\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:21 15:40:47\", \"Exif:DateTimeOriginal\": \"2025:03:21 15:40:47\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"5.1\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 13 back dual wide camera 5.1mm f/1.6\", \"Exif:LensSpecification\": \"1.54, 5.1, 1.6, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"125\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.3783\", \"Exif:SubsecTimeDigitized\": \"521\", \"Exif:SubsecTimeOriginal\": \"521\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.0238095\", \"FNumber\": \"1.6\", \"GPS:Altitude\": \"255.793\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:03:21\", \"GPS:DestBearing\": \"349.234\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"35\", \"GPS:ImgDirection\": \"349.234\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 17.94\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.09\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"19, 40, 46\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 13\", \"Orientation\": \"6\", \"ResolutionUnit\": \"in\", \"Software\": \"17.6.1\", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1097124704,
                        "initialFocalLength": 5.1000000000000005,
                        "focalLength": 5.1000000000000005,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 4032,
                        "height": 3024,
                        "sensorWidth": 6.789530401796805,
                        "sensorHeight": 5.092147801347604,
                        "serialNumber": "D:/Western/4020/Beam Pics Manual_Apple_iPhone 13",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                1200,
                0
            ],
            "parallelization": {
                "blockSize": 12,
                "size": 33,
                "split": 3
            },
            "uids": {
                "0": "d0eaf2e3c9970dc2b09122d52981deb27f56f9f4"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 4,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 5,
                "sgm": {
                    "sgmScale": 2,
                    "sgmStepXY": 2,
                    "sgmStepZ": -1,
                    "sgmMaxTCamsPerTile": 4,
                    "sgmWSH": 4,
                    "sgmUseSfmSeeds": true,
                    "sgmSeedsRangeInflate": 0.2,
                    "sgmDepthThicknessInflate": 0.0,
                    "sgmMaxSimilarity": 1.0,
                    "sgmGammaC": 5.5,
                    "sgmGammaP": 8.0,
                    "sgmP1": 10.0,
                    "sgmP2Weighting": 100.0,
                    "sgmMaxDepths": 1500,
                    "sgmFilteringAxes": "YX",
                    "sgmDepthListPerTile": true,
                    "sgmUseConsistentScale": false
                },
                "refine": {
                    "refineEnabled": true,
                    "refineScale": 1,
                    "refineStepXY": 1,
                    "refineMaxTCamsPerTile": 4,
                    "refineSubsampling": 10,
                    "refineHalfNbDepths": 15,
                    "refineWSH": 3,
                    "refineSigma": 15.0,
                    "refineGammaC": 15.5,
                    "refineGammaP": 8.0,
                    "refineInterpolateMiddleDepth": false,
                    "refineUseConsistentScale": false
                },
                "colorOptimization": {
                    "colorOptimizationEnabled": true,
                    "colorOptimizationNbIterations": 100
                },
                "customPatchPattern": {
                    "sgmUseCustomPatchPattern": false,
                    "refineUseCustomPatchPattern": false,
                    "customPatchPatternSubparts": [],
                    "customPatchPatternGroupSubpartsPerLevel": false
                },
                "intermediateResults": {
                    "exportIntermediateDepthSimMaps": false,
                    "exportIntermediateNormalMaps": false,
                    "exportIntermediateVolumes": false,
                    "exportIntermediateCrossVolumes": false,
                    "exportIntermediateTopographicCutVolumes": false,
                    "exportIntermediateVolume9pCsv": false,
                    "exportTilePattern": false
                },
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "depth": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap.exr",
                "sim": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_simMap.exr",
                "tilePattern": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_tilePattern.obj",
                "depthSgm": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgm.exr",
                "depthSgmUpscaled": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_sgmUpscaled.exr",
                "depthRefined": "{cache}/{nodeType}/{uid0}/<VIEW_ID>_depthMap_refinedFused.exr"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1800,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "7d8d8e7234f10f0f30dd867fd44f0a38d979387a"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "outputMeshFileType": "obj",
                "keepLargestMeshOnly": false,
                "smoothingSubset": "all",
                "smoothingBoundariesNeighbours": 0,
                "smoothingIterations": 5,
                "smoothingLambda": 1.0,
                "filteringSubset": "all",
                "filteringIterations": 1,
                "filterLargeTrianglesFactor": 60.0,
                "filterTrianglesRatio": 0.0,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.{outputMeshFileTypeValue}"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 33,
                "split": 2
            },
            "uids": {
                "0": "4fdc36a5899158c949018db866e56e1d5b54c96c"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": "{FeatureExtraction_1.describerTypes}",
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "knownPosesGeometricErrorMax": 5.0,
                "minRequired2DMotion": -1.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "crossMatching": false,
                "guidedMatching": false,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        }
    }
}