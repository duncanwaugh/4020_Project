{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "MeshFiltering": "3.0",
            "Texturing": "6.0",
            "StructureFromMotion": "3.3",
            "Meshing": "7.0",
            "DepthMap": "5.0",
            "ImageMatching": "2.0",
            "PrepareDenseScene": "3.1",
            "FeatureMatching": "2.0",
            "DepthMapFilter": "4.0",
            "CameraInit": "9.0",
            "FeatureExtraction": "1.3"
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
                "0": "d606f843f85cf2f3185e06e25c9a54c79697e3ee"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 8192,
                "downscale": 1,
                "outputMeshFileType": "obj",
                "colorMapping": {
                    "enable": true,
                    "colorMappingFileType": "jpg"
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
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.jpg"
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
                "0": "da99241046ace81fda27f2a7ad7ce21cac914231"
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
                "size": 45,
                "split": 2
            },
            "uids": {
                "0": "2d93f853947158a95772b20936b75d9f02d1703a"
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
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "c5e2cbf471afaca39e181e6dbb74e87a7e73e9ad"
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
                200,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 45,
                "split": 2
            },
            "uids": {
                "0": "dc5d922d6e0530ffc035b570afd945aecb2b15f8"
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
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "a34f6c04b31330c3743f73a804db7fef9528d8b2"
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
                "size": 45,
                "split": 2
            },
            "uids": {
                "0": "c6b41b3a4683d536980fa53b04a2229bf616c0c2"
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
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "78c284eb6658ce424e061c529156b9f88e2bd4f0"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 733223,
                        "poseId": 733223,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0241.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 39314407,
                        "poseId": 39314407,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0246.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 56583412,
                        "poseId": 56583412,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0278.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:20\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.226146\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:20\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:20\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"714\", \"Exif:SubsecTimeOriginal\": \"714\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.1\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"23.1169\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.9094\", \"GPS:ImgDirection\": \"23.1169\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.27\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 18.26\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 147544899,
                        "poseId": 147544899,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0258.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:54\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.540099\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:54\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:54\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"451\", \"Exif:SubsecTimeOriginal\": \"451\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.066\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"162.413\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8882\", \"GPS:ImgDirection\": \"162.413\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.22\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.22\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 51.24\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 261077394,
                        "poseId": 261077394,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0255.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:49\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.752532\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:49\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:49\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"4.90682\", \"Exif:SubsecTimeDigitized\": \"917\", \"Exif:SubsecTimeOriginal\": \"917\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0333333\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.109\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"204.547\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8856\", \"GPS:ImgDirection\": \"204.547\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.36\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 44.62\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 273043319,
                        "poseId": 273043319,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0256.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:51\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.638545\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:51\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:51\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"4.90682\", \"Exif:SubsecTimeDigitized\": \"667\", \"Exif:SubsecTimeOriginal\": \"667\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0333333\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.066\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"190.191\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8882\", \"GPS:ImgDirection\": \"190.191\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.22\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.22\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 51.24\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 306855887,
                        "poseId": 306855887,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0257.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:52\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.596492\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:52\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:52\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"4.90682\", \"Exif:SubsecTimeDigitized\": \"991\", \"Exif:SubsecTimeOriginal\": \"991\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0333333\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.066\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"182.506\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8882\", \"GPS:ImgDirection\": \"182.506\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.22\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.22\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 51.24\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 327992049,
                        "poseId": 327992049,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0248.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 359284993,
                        "poseId": 359284993,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0275.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:17\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.226098\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:17\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:17\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"267\", \"Exif:SubsecTimeOriginal\": \"267\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.085\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"36.9249\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.836\", \"GPS:ImgDirection\": \"36.9249\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.08\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 11.4\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 589783144,
                        "poseId": 589783144,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0253.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 658622703,
                        "poseId": 658622703,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0244.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 718320291,
                        "poseId": 718320291,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0260.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:57\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.549032\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:57\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:57\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"283\", \"Exif:SubsecTimeOriginal\": \"283\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.066\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"151.124\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8882\", \"GPS:ImgDirection\": \"151.124\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.22\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.22\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 51.24\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 811133906,
                        "poseId": 811133906,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0279.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:22\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.217926\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:22\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:22\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"014\", \"Exif:SubsecTimeOriginal\": \"014\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.1\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"20.9107\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.9094\", \"GPS:ImgDirection\": \"20.9107\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.27\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 18.26\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 811324912,
                        "poseId": 811324912,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0234.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 836873544,
                        "poseId": 836873544,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0271.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:11\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.191196\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:11\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:11\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"703\", \"Exif:SubsecTimeOriginal\": \"703\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.027\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"63.5318\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"92.8856\", \"GPS:ImgDirection\": \"63.5318\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.29\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.03\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 10.47\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 867679882,
                        "poseId": 867679882,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0269.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:09\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.186337\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:09\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:09\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"992\", \"Exif:SubsecTimeOriginal\": \"992\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"254.285\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"73.539\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"196.66\", \"GPS:ImgDirection\": \"73.539\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.38\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 7.77\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 922692519,
                        "poseId": 922692519,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0249.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 950474392,
                        "poseId": 950474392,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0251.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 973054710,
                        "poseId": 973054710,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0266.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:06\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.293653\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:06\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:06\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"327\", \"Exif:SubsecTimeOriginal\": \"327\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.027\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"89.9768\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8862\", \"GPS:ImgDirection\": \"89.9768\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.25\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 4.45\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 997819904,
                        "poseId": 997819904,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0270.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:11\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.191196\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:11\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:11\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"299\", \"Exif:SubsecTimeOriginal\": \"299\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.027\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"65.3\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"92.8856\", \"GPS:ImgDirection\": \"65.3\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.29\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.03\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 10.47\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1155380424,
                        "poseId": 1155380424,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0261.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:58\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.558021\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:58\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:58\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"710\", \"Exif:SubsecTimeOriginal\": \"710\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.009\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"139.142\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.8955\", \"GPS:ImgDirection\": \"139.142\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.14\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.28\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 57.84\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1267031831,
                        "poseId": 1267031831,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0267.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:07\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.355429\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:07\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:07\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"488\", \"Exif:SubsecTimeOriginal\": \"488\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.027\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"84.6768\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8862\", \"GPS:ImgDirection\": \"84.6768\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.25\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 4.45\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1268185133,
                        "poseId": 1268185133,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0237.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1309077612,
                        "poseId": 1309077612,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0236.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1315679910,
                        "poseId": 1315679910,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0235.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1323044249,
                        "poseId": 1323044249,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0274.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:15\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.220385\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:15\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:15\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"982\", \"Exif:SubsecTimeOriginal\": \"982\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.085\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"47.1754\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.836\", \"GPS:ImgDirection\": \"47.1754\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.08\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 11.4\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1339066601,
                        "poseId": 1339066601,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0245.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1385379794,
                        "poseId": 1385379794,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0243.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1429877320,
                        "poseId": 1429877320,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0238.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1513098795,
                        "poseId": 1513098795,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0259.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:51:55\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.549032\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:51:55\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:51:55\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"988\", \"Exif:SubsecTimeOriginal\": \"988\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.066\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"156.039\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8882\", \"GPS:ImgDirection\": \"156.039\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.22\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.22\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 51.24\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1529909514,
                        "poseId": 1529909514,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0265.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:05\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.355902\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:05\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:05\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"187\", \"Exif:SubsecTimeOriginal\": \"187\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.027\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"98.6903\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.8862\", \"GPS:ImgDirection\": \"98.6903\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.25\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 4.45\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1530057707,
                        "poseId": 1530057707,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0240.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1561592610,
                        "poseId": 1561592610,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0272.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:13\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.174123\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:13\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:13\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"454\", \"Exif:SubsecTimeOriginal\": \"454\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.085\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"56.9184\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.836\", \"GPS:ImgDirection\": \"56.9184\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.08\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 11.4\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1590175205,
                        "poseId": 1590175205,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0268.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:08\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.267967\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:08\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:08\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"724\", \"Exif:SubsecTimeOriginal\": \"724\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"254.285\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"75.9907\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"196.66\", \"GPS:ImgDirection\": \"75.9907\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.38\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 7.77\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1595603338,
                        "poseId": 1595603338,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0263.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:02\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.385239\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:02\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:02\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"168\", \"Exif:SubsecTimeOriginal\": \"168\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.009\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"116.777\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.8955\", \"GPS:ImgDirection\": \"116.777\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.14\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.28\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 57.84\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1626131986,
                        "poseId": 1626131986,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0277.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:19\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.267967\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:19\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:19\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"626\", \"Exif:SubsecTimeOriginal\": \"626\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.1\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"30.785\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"32.9094\", \"GPS:ImgDirection\": \"30.785\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.27\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.2\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 18.26\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1664403214,
                        "poseId": 1664403214,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0239.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1705342259,
                        "poseId": 1705342259,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0247.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1769781275,
                        "poseId": 1769781275,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0276.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:18\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.242972\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:18\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:18\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"402\", \"Exif:SubsecTimeOriginal\": \"402\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.085\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"36.1035\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"95.689\", \"GPS:ImgDirection\": \"36.1035\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.26\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.03\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 17.41\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1820738795,
                        "poseId": 1820738795,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0250.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1843374527,
                        "poseId": 1843374527,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0242.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1961540834,
                        "poseId": 1961540834,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0264.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:03\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.391547\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:03\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:03\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"427\", \"Exif:SubsecTimeOriginal\": \"427\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.009\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"107.125\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.8955\", \"GPS:ImgDirection\": \"107.125\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.14\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.28\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 57.84\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1987353809,
                        "poseId": 1987353809,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0252.jpg",
                        "intrinsicId": 2323271706,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1989593487,
                        "poseId": 1989593487,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0273.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:14\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.217191\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:14\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:14\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"500\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"806\", \"Exif:SubsecTimeOriginal\": \"806\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.085\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"55.1133\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.836\", \"GPS:ImgDirection\": \"55.1133\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.08\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.31\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 52, 11.4\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2086488597,
                        "poseId": 2086488597,
                        "path": "D:/Western/4020/Test photos/JPG/IMG_0262.jpg",
                        "intrinsicId": 3875602573,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"5.691224\", \"DateTime\": \"2025:02:05 16:52:00\", \"Exif:ApertureValue\": \"1.16992\", \"Exif:BrightnessValue\": \"-0.53122\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:02:05 16:52:00\", \"Exif:DateTimeOriginal\": \"2025:02:05 16:52:00\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.7\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 14 back dual wide camera 5.7mm f/1.5\", \"Exif:LensSpecification\": \"1.54, 5.7, 1.5, 2.4\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-05:00\", \"Exif:OffsetTimeDigitized\": \"-05:00\", \"Exif:OffsetTimeOriginal\": \"-05:00\", \"Exif:PhotographicSensitivity\": \"640\", \"Exif:PixelXDimension\": \"4032\", \"Exif:PixelYDimension\": \"3024\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.32175\", \"Exif:SubsecTimeDigitized\": \"494\", \"Exif:SubsecTimeOriginal\": \"494\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.025\", \"FNumber\": \"1.5\", \"GPS:Altitude\": \"255.009\", \"GPS:AltitudeRef\": \"0\", \"GPS:DateStamp\": \"2025:02:05\", \"GPS:DestBearing\": \"128.298\", \"GPS:DestBearingRef\": \"T\", \"GPS:HPositioningError\": \"31.8955\", \"GPS:ImgDirection\": \"128.298\", \"GPS:ImgDirectionRef\": \"T\", \"GPS:Latitude\": \"43, 0, 16.14\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"81, 16, 35.28\", \"GPS:LongitudeRef\": \"W\", \"GPS:Speed\": \"0\", \"GPS:SpeedRef\": \"K\", \"GPS:TimeStamp\": \"21, 51, 57.84\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 14\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.1.1\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 2323271706,
                        "initialFocalLength": -1.0,
                        "focalLength": 57.94112549695428,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 3024,
                        "height": 4032,
                        "sensorWidth": 36.0,
                        "sensorHeight": 24.0,
                        "serialNumber": "D:/Western/4020/Test photos/JPG",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "unknown",
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
                    },
                    {
                        "intrinsicId": 3875602573,
                        "initialFocalLength": 7.6000000000000005,
                        "focalLength": 7.6000000000000005,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 3024,
                        "height": 4032,
                        "sensorWidth": 5.691224013270851,
                        "sensorHeight": 4.268418009953138,
                        "serialNumber": "D:/Western/4020/Test photos/JPG_Apple_iPhone 14",
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
                "size": 45,
                "split": 4
            },
            "uids": {
                "0": "a23f4485f7b91f392717c2c0a2868c688dfb476e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 2,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "tiling": {
                    "tileBufferWidth": 1024,
                    "tileBufferHeight": 1024,
                    "tilePadding": 64,
                    "autoAdjustSmallImage": true
                },
                "chooseTCamsPerTile": true,
                "maxTCams": 10,
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
                "0": "d13a9ae0920cf40c5e05d6055db40c616093f293"
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
                "size": 45,
                "split": 3
            },
            "uids": {
                "0": "313a2a2fb6a8031a4530dd9002d82e7a71c4a39f"
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