{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "FeatureMatching": "2.0",
            "PrepareDenseScene": "3.1",
            "ImageMatching": "2.0",
            "FeatureExtraction": "1.3",
            "CameraInit": "9.0",
            "DepthMapFilter": "4.0",
            "StructureFromMotion": "3.3",
            "DepthMap": "5.0",
            "MeshFiltering": "3.0",
            "Meshing": "7.0",
            "Texturing": "6.0"
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
                "0": "3e694f926a6f708b0d822b37db9a788da5a81c49"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshFiltering_1.outputMesh}",
                "inputRefMesh": "",
                "textureSide": 2048,
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
                "0": "b6318b5ce391aef56ec82ed1b452ce9216e8eedf"
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
                "size": 39,
                "split": 2
            },
            "uids": {
                "0": "5ffe9043be35fd15de216627812004455065dbcf"
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
                "size": 39,
                "split": 1
            },
            "uids": {
                "0": "104c2add16378371e99f6b6bf3936b0014da0984"
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
                "size": 39,
                "split": 1
            },
            "uids": {
                "0": "2f3e6e2f9c1bfcaac351c297eb3a57cdb1407ba3"
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
                "size": 39,
                "split": 1
            },
            "uids": {
                "0": "52301dbd6cdae774437bfb3ef14d3528ef3af223"
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
                "size": 39,
                "split": 1
            },
            "uids": {
                "0": "1aafd493d241ce31cd7573377d1bc769861f9daa"
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
                "size": 39,
                "split": 1
            },
            "uids": {
                "0": "ef6e81d66c7e023f84ca265667e5f9ffa702f2ad"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 38556732,
                        "poseId": 38556732,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8333.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:56\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.96801\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:56\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:56\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"842\", \"Exif:SubsecTimeOriginal\": \"842\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 54888633,
                        "poseId": 54888633,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8324.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:23\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.08763\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:23\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:23\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"276\", \"Exif:SubsecTimeOriginal\": \"276\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 98856490,
                        "poseId": 98856490,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8317.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:17\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.15483\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:17\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:17\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"844\", \"Exif:SubsecTimeOriginal\": \"844\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 124140175,
                        "poseId": 124140175,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8344.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:07\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.94336\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:07\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:07\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"566\", \"Exif:SubsecTimeOriginal\": \"566\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 281099276,
                        "poseId": 281099276,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8347.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:10\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.97244\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:10\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:10\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"280\", \"Exif:SubsecTimeOriginal\": \"280\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 397290274,
                        "poseId": 397290274,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8314.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:15\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.04116\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:15\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:15\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"829\", \"Exif:SubsecTimeOriginal\": \"829\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 398596824,
                        "poseId": 398596824,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8336.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:59\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.9609\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:59\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:59\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"815\", \"Exif:SubsecTimeOriginal\": \"815\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 500397686,
                        "poseId": 500397686,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8349.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:11\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.00425\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:11\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:11\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"559\", \"Exif:SubsecTimeOriginal\": \"559\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 521432244,
                        "poseId": 521432244,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8338.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:01\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.00415\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:01\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:01\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"837\", \"Exif:SubsecTimeOriginal\": \"837\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 550985115,
                        "poseId": 550985115,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8346.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:09\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.93554\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:09\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:09\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"299\", \"Exif:SubsecTimeOriginal\": \"299\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 590130181,
                        "poseId": 590130181,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8348.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:10\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.99828\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:10\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:10\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"902\", \"Exif:SubsecTimeOriginal\": \"902\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 603770567,
                        "poseId": 603770567,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8342.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:06\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.96436\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:06\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:06\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"012\", \"Exif:SubsecTimeOriginal\": \"012\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 603951865,
                        "poseId": 603951865,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8323.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:22\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.10405\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:22\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:22\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"554\", \"Exif:SubsecTimeOriginal\": \"554\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 696033270,
                        "poseId": 696033270,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8320.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:20\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.10726\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:20\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:20\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"089\", \"Exif:SubsecTimeOriginal\": \"089\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 764508895,
                        "poseId": 764508895,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8325.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:23\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.08763\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:23\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:23\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"972\", \"Exif:SubsecTimeOriginal\": \"972\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 768312601,
                        "poseId": 768312601,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8352.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:13\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.99615\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:13\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:13\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"972\", \"Exif:SubsecTimeOriginal\": \"972\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 895922744,
                        "poseId": 895922744,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8335.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:58\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.95148\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:58\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:58\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"908\", \"Exif:SubsecTimeOriginal\": \"908\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 925937700,
                        "poseId": 925937700,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8326.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:24\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.10393\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:24\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:24\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"693\", \"Exif:SubsecTimeOriginal\": \"693\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 942361786,
                        "poseId": 942361786,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8315.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:16\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.0422\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:16\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:16\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"315\", \"Exif:SubsecTimeOriginal\": \"315\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1087432414,
                        "poseId": 1087432414,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8351.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:13\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.0929\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:13\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:13\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"028\", \"Exif:SubsecTimeOriginal\": \"028\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1122568215,
                        "poseId": 1122568215,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8318.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:18\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.14789\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:18\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:18\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"629\", \"Exif:SubsecTimeOriginal\": \"629\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1144832849,
                        "poseId": 1144832849,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8334.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:57\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.94291\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:57\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:57\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"723\", \"Exif:SubsecTimeOriginal\": \"723\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1164255141,
                        "poseId": 1164255141,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8341.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:05\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.9747\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:05\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:05\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"159\", \"Exif:SubsecTimeOriginal\": \"159\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1286707502,
                        "poseId": 1286707502,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8319.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:19\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.14024\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:19\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:19\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"397\", \"Exif:SubsecTimeOriginal\": \"397\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1297229633,
                        "poseId": 1297229633,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8322.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:21\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.09308\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:21\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:21\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"867\", \"Exif:SubsecTimeOriginal\": \"867\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1306782363,
                        "poseId": 1306782363,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8337.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:00\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.99047\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:00\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:00\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"863\", \"Exif:SubsecTimeOriginal\": \"863\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1307676216,
                        "poseId": 1307676216,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8329.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:26\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.09583\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:26\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:26\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"870\", \"Exif:SubsecTimeOriginal\": \"870\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1504025647,
                        "poseId": 1504025647,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8345.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:08\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.95913\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:08\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:08\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"404\", \"Exif:SubsecTimeOriginal\": \"404\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1509271400,
                        "poseId": 1509271400,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8350.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:12\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.01527\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:12\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:12\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"262\", \"Exif:SubsecTimeOriginal\": \"262\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1674415535,
                        "poseId": 1674415535,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8340.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:04\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.9704\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:04\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:04\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"265\", \"Exif:SubsecTimeOriginal\": \"265\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1741701088,
                        "poseId": 1741701088,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8331.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:28\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.178\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:28\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:28\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"454\", \"Exif:SubsecTimeOriginal\": \"454\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1744273328,
                        "poseId": 1744273328,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8321.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:21\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.09871\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:21\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:21\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"027\", \"Exif:SubsecTimeOriginal\": \"027\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1807630829,
                        "poseId": 1807630829,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8343.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:06\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.94855\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:06\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:06\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"839\", \"Exif:SubsecTimeOriginal\": \"839\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1807696968,
                        "poseId": 1807696968,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8330.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:27\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.14753\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:27\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:27\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"619\", \"Exif:SubsecTimeOriginal\": \"619\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1877341324,
                        "poseId": 1877341324,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8332.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:52\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.949\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:52\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:52\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"6.90712\", \"Exif:SubsecTimeDigitized\": \"153\", \"Exif:SubsecTimeOriginal\": \"153\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.00833333\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1882031311,
                        "poseId": 1882031311,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8328.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:26\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.10689\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:26\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:26\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"265\", \"Exif:SubsecTimeOriginal\": \"265\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1981985055,
                        "poseId": 1981985055,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8327.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:25\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.12294\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:25\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:25\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"386\", \"Exif:SubsecTimeOriginal\": \"386\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1995068087,
                        "poseId": 1995068087,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8339.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:59:02\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"2.99917\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:59:02\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:59:02\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"807\", \"Exif:SubsecTimeOriginal\": \"807\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2021993190,
                        "poseId": 2021993190,
                        "path": "D:/Western/4020/canoe/jpg/IMG_8316.jpg",
                        "intrinsicId": 1439697778,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidthEstimation\": \"7.934432\", \"DateTime\": \"2025:03:19 18:58:17\", \"Exif:ApertureValue\": \"1.35614\", \"Exif:BrightnessValue\": \"3.12196\", \"Exif:ColorSpace\": \"65535\", \"Exif:DateTimeDigitized\": \"2025:03:19 18:58:17\", \"Exif:DateTimeOriginal\": \"2025:03:19 18:58:17\", \"Exif:ExifVersion\": \"0232\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"16\", \"Exif:FocalLength\": \"5.96\", \"Exif:FocalLengthIn35mmFilm\": \"26\", \"Exif:LensMake\": \"Apple\", \"Exif:LensModel\": \"iPhone 16 back dual wide camera 5.96mm f/1.6\", \"Exif:LensSpecification\": \"2.22, 5.96, 1.6, 2.2\", \"Exif:MeteringMode\": \"5\", \"Exif:OffsetTime\": \"-04:00\", \"Exif:OffsetTimeDigitized\": \"-04:00\", \"Exif:OffsetTimeOriginal\": \"-04:00\", \"Exif:PhotographicSensitivity\": \"80\", \"Exif:PixelXDimension\": \"5712\", \"Exif:PixelYDimension\": \"4284\", \"Exif:SensingMethod\": \"2\", \"Exif:ShutterSpeedValue\": \"5.90677\", \"Exif:SubsecTimeDigitized\": \"026\", \"Exif:SubsecTimeOriginal\": \"026\", \"Exif:WhiteBalance\": \"0\", \"ExposureTime\": \"0.0166667\", \"FNumber\": \"1.6\", \"ICCProfile\": \"0, 0, 2, 24, 97, 112, 112, 108, 4, 0, 0, 0, 109, 110, 116, 114, 82, 71, 66, 32, 88, 89, 90, 32, 7, 230, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 97, 99, 115, 112, 65, 80, 80, 76, 0, 0, 0, 0, 65, 80, 80, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ... [536 x uint8]\", \"ICCProfile:attributes\": \"Reflective, Glossy, Positive, Color\", \"ICCProfile:cmm_type\": \"1634758764\", \"ICCProfile:color_space\": \"RGB\", \"ICCProfile:copyright\": \"Copyright Apple Inc., 2022\", \"ICCProfile:creation_date\": \"2022:01:01 00:00:00\", \"ICCProfile:creator_signature\": \"6170706c\", \"ICCProfile:device_class\": \"Display device profile\", \"ICCProfile:flags\": \"Not Embedded, Independent\", \"ICCProfile:manufacturer\": \"4150504c\", \"ICCProfile:model\": \"0\", \"ICCProfile:platform_signature\": \"Apple Computer, Inc.\", \"ICCProfile:profile_connection_space\": \"XYZ\", \"ICCProfile:profile_description\": \"Display P3\", \"ICCProfile:profile_size\": \"536\", \"ICCProfile:profile_version\": \"4.0.0\", \"ICCProfile:rendering_intent\": \"Perceptual\", \"Make\": \"Apple\", \"Model\": \"iPhone 16\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"18.3.2\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:4:4\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1439697778,
                        "initialFocalLength": 5.959999999999999,
                        "focalLength": 5.959999999999999,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 5712,
                        "height": 4284,
                        "sensorWidth": 7.934431606805678,
                        "sensorHeight": 5.950823705104258,
                        "serialNumber": "D:/Western/4020/canoe/jpg_Apple_iPhone 16",
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
                "size": 39,
                "split": 4
            },
            "uids": {
                "0": "3bca804e9f4a0aa84355970aca7b7c343b1ce953"
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
                "0": "af049536f92b967e341bff16c4bdad5625cbbbb7"
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
                "size": 39,
                "split": 2
            },
            "uids": {
                "0": "671c79a1b560d210d694ab992b040e749c3964fe"
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