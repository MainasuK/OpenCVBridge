//
//  main.swift
//  Features2D + Homography to Find a Known Object
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Features2D + Homography to Find a Known Object")
print("Matching feature point and find homography to maching object")

let minHessian = 25600.0
// let minHessian = 400.0

let whole: CVBMat = {
    let image = StandardImage.books
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/screen2.png")!
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(whole, to: whole, code: .COLOR_BGR2GRAY, dstCn: 0)

let part: CVBMat = {
    let image = StandardImage.book
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/button.png")!
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(part, to: part, code: .COLOR_BGR2GRAY, dstCn: 0)

let detector = CVBSURF(hessianThreshold: minHessian)

let bookKeypointsDescriptor = CVBMat()
let bookKeypoints = detector.detectAndCompute(part, mask: nil, descriptors: bookKeypointsDescriptor)

let booksKeypointsDescriptor = CVBMat()
let booksKeypoints = detector.detectAndCompute(whole, mask: nil, descriptors: booksKeypointsDescriptor)

// Matching descriptor vectors with the FLANN
let matcher = CVBDescriptorMatcher(descriptorMatcherType: .FLANNBASED)
let knnMatches = matcher.knnMatch(bookKeypointsDescriptor, descriptor2: booksKeypointsDescriptor, k: 2)

// Filter matches using the Lowe's ratio test
let ratioThresh = 0.9
var goodMatches: [CVBDMatch] = []
for i in knnMatches.indices {
    if knnMatches[i][0].distance < Float(ratioThresh) * knnMatches[i][1].distance {
        goodMatches.append(knnMatches[i][0])
    }
}

// Draw match line
let outputImg = CVBMat()
CVBFeatures2D.drawMatches(part, keypoints1: bookKeypoints, img2: whole, keypoints2: booksKeypoints, matches: goodMatches, outImg: outputImg)

// Localize the object
var partPoints: [CGPoint] = []
var wholePoints: [CGPoint] = []
for i in goodMatches.indices {
    partPoints.append(bookKeypoints[Int(goodMatches[i].queryIdx)].pt)
    wholePoints.append(booksKeypoints[Int(goodMatches[i].trainIdx)].pt)
}
let H = CVBCalib3D.findHomography2f(partPoints.map { NSValue(point: $0) },
                                   dst: wholePoints.map { NSValue(point: $0) },
                                   method: .RANSAC)
let determinant = CVBCore.determinant(H)
print("Determinant of H: \(determinant)")

var rectPart: [CGPoint] = [
    CGPoint.zero,
    CGPoint(x: Int(part.cols()), y: 0),
    CGPoint(x: Int(part.cols()), y: Int(part.rows())),
    CGPoint(x: 0, y: Int(part.rows())),
]
var rectPartValue = rectPart.map { NSValue(point: $0) }
var rectPartInWhole: [CGPoint] = CVBCore.perspectiveTransform2f(rectPartValue, m: H).map { $0.pointValue }
var rectPartInOutput: [CGPoint] = rectPartInWhole.map { CGPoint(x: $0.x + CGFloat(part.cols()), y: $0.y) }

CVBimgproc.line(outputImg, pt1: rectPartInOutput[0], pt2: rectPartInOutput[1], color: .green, thickness: 4)
CVBimgproc.line(outputImg, pt1: rectPartInOutput[1], pt2: rectPartInOutput[2], color: .green, thickness: 4)
CVBimgproc.line(outputImg, pt1: rectPartInOutput[2], pt2: rectPartInOutput[3], color: .green, thickness: 4)
CVBimgproc.line(outputImg, pt1: rectPartInOutput[3], pt2: rectPartInOutput[0], color: .green, thickness: 4)

CVBhighgui.imshow("image", mat: outputImg)
CVBhighgui.waitKey(0)
