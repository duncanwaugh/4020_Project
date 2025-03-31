{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "ImageMatching": "2.0",
            "MeshFiltering": "3.0",
            "Meshing": "7.0",
            "DepthMapFilter": "4.0",
            "FeatureMatching": "2.0",
            "Texturing": "6.0",
            "CameraInit": "9.0",
            "FeatureExtraction": "1.3",
            "StructureFromMotion": "3.3",
            "PrepareDenseScene": "3.1",
            "DepthMap": "5.0"
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
                "0": "0db1c651fea2fdb804e64912816a701f6cde23d5"
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
                "0": "5ac87377254f95646800c55a1cd390457f405a9d"
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
                "size": 99,
                "split": 5
            },
            "uids": {
                "0": "6bd7aead9314823f1815f7c813da2ad4b46c27d6"
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
                "size": 99,
                "split": 1
            },
            "uids": {
                "0": "689bb1e22e952915149c5c9325966dda23c09e68"
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
                "size": 99,
                "split": 3
            },
            "uids": {
                "0": "deb8f820e301414932e27c15a25f0d5094ef246e"
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
                "size": 99,
                "split": 1
            },
            "uids": {
                "0": "f7cfa5f844372b423a756f7e137ab3aee8a7c59c"
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
                "size": 99,
                "split": 3
            },
            "uids": {
                "0": "1f179f86141263043e275d647c3b12971e4f0b23"
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
                "size": 99,
                "split": 1
            },
            "uids": {
                "0": "15271aabb6f9fa6dea34bc82579790efafb8a420"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 2611187,
                        "poseId": 2611187,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178408817.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 56314614,
                        "poseId": 56314614,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178413986.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 67448223,
                        "poseId": 67448223,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178423820.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 166757101,
                        "poseId": 166757101,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178406752.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 174023398,
                        "poseId": 174023398,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178433676.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 251642331,
                        "poseId": 251642331,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178439422.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 253951453,
                        "poseId": 253951453,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178415025.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 277808556,
                        "poseId": 277808556,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178399976.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 290561101,
                        "poseId": 290561101,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178402560.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 304540038,
                        "poseId": 304540038,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178419177.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 310904999,
                        "poseId": 310904999,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178434736.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 332662912,
                        "poseId": 332662912,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178401521.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 339750857,
                        "poseId": 339750857,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178402041.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 366319424,
                        "poseId": 366319424,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178422275.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 381750795,
                        "poseId": 381750795,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178396862.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 409405520,
                        "poseId": 409405520,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178418650.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 409789394,
                        "poseId": 409789394,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178435776.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 420113014,
                        "poseId": 420113014,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178438396.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 433960108,
                        "poseId": 433960108,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178424859.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 456785827,
                        "poseId": 456785827,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178426417.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 457279281,
                        "poseId": 457279281,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178415540.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 460332390,
                        "poseId": 460332390,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178409855.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 492816463,
                        "poseId": 492816463,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178432649.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 497260572,
                        "poseId": 497260572,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178427467.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 547844885,
                        "poseId": 547844885,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178430592.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 565532024,
                        "poseId": 565532024,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178411909.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 575883820,
                        "poseId": 575883820,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178394796.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 596375181,
                        "poseId": 596375181,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178436823.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 611772437,
                        "poseId": 611772437,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178410889.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 622318376,
                        "poseId": 622318376,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178392709.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 656137807,
                        "poseId": 656137807,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178407264.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 696463539,
                        "poseId": 696463539,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178401009.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 781419122,
                        "poseId": 781419122,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178425376.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 784193679,
                        "poseId": 784193679,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178405694.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 796210201,
                        "poseId": 796210201,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178429554.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 809575003,
                        "poseId": 809575003,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178392197.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 901255670,
                        "poseId": 901255670,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178414507.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 902568801,
                        "poseId": 902568801,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178395317.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 905857755,
                        "poseId": 905857755,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178404117.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 910047095,
                        "poseId": 910047095,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178436301.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 918955149,
                        "poseId": 918955149,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178416051.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 938311221,
                        "poseId": 938311221,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178390152.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 970436487,
                        "poseId": 970436487,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178433160.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 979622709,
                        "poseId": 979622709,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178405176.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 984234163,
                        "poseId": 984234163,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178394274.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 986003558,
                        "poseId": 986003558,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178437876.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1066444477,
                        "poseId": 1066444477,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178420738.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1089631726,
                        "poseId": 1089631726,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178419705.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1118025723,
                        "poseId": 1118025723,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178400494.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1123634177,
                        "poseId": 1123634177,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178421250.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1124126156,
                        "poseId": 1124126156,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178411399.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1131542862,
                        "poseId": 1131542862,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178421759.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1148388244,
                        "poseId": 1148388244,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178437343.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1177024875,
                        "poseId": 1177024875,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178403595.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1211644710,
                        "poseId": 1211644710,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178412951.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1228036014,
                        "poseId": 1228036014,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178431623.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1247545335,
                        "poseId": 1247545335,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178391181.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1352039124,
                        "poseId": 1352039124,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178404659.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1362149212,
                        "poseId": 1362149212,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178403082.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1377092546,
                        "poseId": 1377092546,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178389133.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1389225660,
                        "poseId": 1389225660,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178417617.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1500096424,
                        "poseId": 1500096424,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178393231.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1504298119,
                        "poseId": 1504298119,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178423298.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1504727609,
                        "poseId": 1504727609,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178396345.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1510288053,
                        "poseId": 1510288053,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178397372.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1515372341,
                        "poseId": 1515372341,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178420220.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1562880347,
                        "poseId": 1562880347,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178409330.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1580393860,
                        "poseId": 1580393860,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178424350.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1604990022,
                        "poseId": 1604990022,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178410371.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1633026317,
                        "poseId": 1633026317,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178399454.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1671049820,
                        "poseId": 1671049820,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178416569.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1672903824,
                        "poseId": 1672903824,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178432139.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1673333048,
                        "poseId": 1673333048,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178438908.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1675060540,
                        "poseId": 1675060540,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178391686.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1686269754,
                        "poseId": 1686269754,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178431105.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1709962475,
                        "poseId": 1709962475,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178417094.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1716672741,
                        "poseId": 1716672741,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178430072.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1727658069,
                        "poseId": 1727658069,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178422785.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1739577018,
                        "poseId": 1739577018,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178439932.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1759758784,
                        "poseId": 1759758784,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178426942.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1784379244,
                        "poseId": 1784379244,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178398931.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1795256470,
                        "poseId": 1795256470,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178397891.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1802508682,
                        "poseId": 1802508682,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178427980.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1826264111,
                        "poseId": 1826264111,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178407782.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1833892660,
                        "poseId": 1833892660,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178429028.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1843136443,
                        "poseId": 1843136443,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178406230.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1876492403,
                        "poseId": 1876492403,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178390667.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1912945592,
                        "poseId": 1912945592,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178435267.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1943662503,
                        "poseId": 1943662503,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178393752.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 1951803677,
                        "poseId": 1951803677,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178398408.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2004737285,
                        "poseId": 2004737285,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178413471.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2021361987,
                        "poseId": 2021361987,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178408300.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2023021246,
                        "poseId": 2023021246,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178434206.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2033888945,
                        "poseId": 2033888945,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178428505.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2079851533,
                        "poseId": 2079851533,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178412425.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2093543623,
                        "poseId": 2093543623,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178418134.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2124983665,
                        "poseId": 2124983665,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178395832.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2125597392,
                        "poseId": 2125597392,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178425891.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2140223994,
                        "poseId": 2140223994,
                        "path": "D:/Western/4020/drone_photos_column/drone_photos_column/photo_1743178389644.jpg",
                        "intrinsicId": 75601465,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 75601465,
                        "initialFocalLength": -1.0,
                        "focalLength": 43.45584412271571,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 960,
                        "height": 720,
                        "sensorWidth": 36.0,
                        "sensorHeight": 24.0,
                        "serialNumber": "D:/Western/4020/drone_photos_column/drone_photos_column",
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
                "size": 99,
                "split": 9
            },
            "uids": {
                "0": "e6c17a86578880402d6d51822dea56f830ff3ed7"
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
                "0": "55c45681ee72e2a95942158046ad6b68900f768b"
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
                "size": 99,
                "split": 5
            },
            "uids": {
                "0": "4982c2181cd92c525e41f2b9b7b9df28329fde02"
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