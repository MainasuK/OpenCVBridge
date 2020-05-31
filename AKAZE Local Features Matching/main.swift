//
//  main.swift
//  AKAZE Local Features Matching
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("AKAZE Local Features Matching")
print("Matching feature point and find homography to maching object")

let inlierThreshold = 100.0       // Distance threshold to identify inliers with homography check

let whole: CVBMat = {
    let image = StandardImage.graf3
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(whole, to: whole, code: .COLOR_BGR2GRAY, dstCn: 0)

let part: CVBMat = {
    let image = StandardImage.graf1
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(part, to: part, code: .COLOR_BGR2GRAY, dstCn: 0)


let detector = CVBAKAZE()

let partKeypointsDescriptor = CVBMat()
let partKeypoints = detector.detectAndCompute(part, mask: nil, descriptors: partKeypointsDescriptor)

let wholeKeypointsDescriptor = CVBMat()
let wholeKeypoints = detector.detectAndCompute(whole, mask: nil, descriptors: wholeKeypointsDescriptor)

// Matching descriptor vectors with a brute force matcher
// Since SURF is a floating-point descriptor NORM_L2 is used
let matcher = CVBDescriptorMatcher(descriptorMatcherType: .BRUTEFORCE_HAMMING)
let knnMatches = matcher.knnMatch(partKeypointsDescriptor, descriptor2: wholeKeypointsDescriptor, k: 2)

// Filter matches using the Lowe's ratio test
let ratioThresh = 0.8
var machedBookKeypoints: [CVBKeyPoint] = []
var machedBooksKeypoints: [CVBKeyPoint] = []
for i in knnMatches.indices {
    if knnMatches[i][0].distance < Float(ratioThresh) * knnMatches[i][1].distance {
        machedBookKeypoints.append(partKeypoints[Int(knnMatches[i][0].queryIdx)])
        machedBooksKeypoints.append(wholeKeypoints[Int(knnMatches[i][0].trainIdx)])
    }
}

let homography = CVBMat.ones(3, cols: 3, type: .CV64F)
homography.setDouble( 7.6285898e-01, atRow: 0, atCol: 0)
homography.setDouble(-2.9922929e-01, atRow: 0, atCol: 1)
homography.setDouble( 2.2567123e+02, atRow: 0, atCol: 2)
homography.setDouble( 3.3443473e-01, atRow: 1, atCol: 0)
homography.setDouble( 1.0143901e+00, atRow: 1, atCol: 1)
homography.setDouble(-7.6999973e+01, atRow: 1, atCol: 2)
homography.setDouble( 3.4663091e-04, atRow: 2, atCol: 0)
homography.setDouble(-1.4364524e-05, atRow: 2, atCol: 1)
homography.setDouble( 1.0000000e+00, atRow: 2, atCol: 2)

var goodMatches: [CVBDMatch] = []
var inliers1: [CVBKeyPoint] = []
var inliers2: [CVBKeyPoint] = []
for i in machedBookKeypoints.indices {
    var col = CVBMat.ones(3, cols: 1, type: .CV64F)
    col.setDouble(Double(machedBookKeypoints[i].pt.x), at: 0)
    col.setDouble(Double(machedBookKeypoints[i].pt.y), at: 1)
    
    col = homography.multiply(col)
    col = col.divide(col.getDoubleAt(2))
    
    let dist: Double = sqrt(
        pow(col.getDoubleAt(0) - Double(wholeKeypoints[i].pt.x), 2) +
        pow(col.getDoubleAt(1) - Double(wholeKeypoints[i].pt.y), 2)
    )
    
    if dist < inlierThreshold {
        let newIndex = inliers1.count
        inliers1.append(partKeypoints[i])
        inliers2.append(wholeKeypoints[i])
        goodMatches.append(CVBDMatch(queryIdx: Int32(newIndex), trainIdx: Int32(newIndex), imgIdx: 0, distance: 0))
    }
}

// Draw match line
let outputImg = CVBMat()
CVBFeatures2D.drawMatches(part, keypoints1: inliers1, img2: whole, keypoints2: inliers2, matches: goodMatches, outImg: outputImg)

CVBhighgui.imshow("image", mat: outputImg)
CVBhighgui.waitKey(0)
