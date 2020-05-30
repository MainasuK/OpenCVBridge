//
//  main.swift
//  Feature Description
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Feature Description")
print("Matching SURF feature point")


// let minHessian = 500.0
let minHessian = 25600.0

let whole: CVBMat = {
    let image = StandardImage.books
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/72F28FD915EDFB4007BD7A6E6C42FFA4.jpg")!
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(whole, to: whole, code: .COLOR_BGR2RGB, dstCn: 0)

let part: CVBMat = {
    let image = StandardImage.book
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/72F28FD915EDFB4007BD7A6E6C42FFA4-local.jpg")!
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(part, to: part, code: .COLOR_BGR2RGB, dstCn: 0)

let detector = CVBSURF(hessianThreshold: minHessian)

let booksKeypointsDescriptor = CVBMat()
let booksKeypoints = detector.detectAndCompute(part, mask: nil, descriptors: booksKeypointsDescriptor)

let bookKeypointsDescriptor = CVBMat()
let bookKeypoints = detector.detectAndCompute(whole, mask: nil, descriptors: bookKeypointsDescriptor)

// Matching descriptor vectors with a brute force matcher
// Since SURF is a floating-point descriptor NORM_L2 is used
let matcher = CVBDescriptorMatcher(descriptorMatcherType: .BRUTEFORCE)
let matches = matcher.match(bookKeypointsDescriptor, descriptors2: booksKeypointsDescriptor)

// Draw match line
let outputImg = CVBMat()
CVBFeatures2D.drawMatches(whole, keypoints1: bookKeypoints, img2: part, keypoints2: booksKeypoints, matches: matches, outImg: outputImg)

CVBhighgui.imshow("image", mat: outputImg)
CVBhighgui.waitKey(0)
