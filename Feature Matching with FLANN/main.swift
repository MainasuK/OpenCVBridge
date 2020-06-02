//
//  main.swift
//  Feature Matching with FLANN
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Feature Matching with FLANN")
print("FLANN matching and filting")

let minHessian = 25600.0

let whole: CVBMat = {
    let image = StandardImage.books
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/72F28FD915EDFB4007BD7A6E6C42FFA4.jpg")!
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(whole, to: whole, code: .COLOR_BGR2GRAY, dstCn: 0)

let part: CVBMat = {
    let image = StandardImage.book
    // let image = NSImage(contentsOfFile: "/Users/mainasuk/Downloads/72F28FD915EDFB4007BD7A6E6C42FFA4-local.jpg")!
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
let ratioThresh = 0.7
var goodMatches: [CVBDMatch] = []
for i in knnMatches.indices {
    if knnMatches[i][0].distance < Float(ratioThresh) * knnMatches[i][1].distance {
        goodMatches.append(knnMatches[i][0])
    }
}

// Draw match line
let outputImg = CVBMat()
CVBFeatures2D.drawMatches(part, keypoints1: bookKeypoints, img2: whole, keypoints2: booksKeypoints, matches: goodMatches, outImg: outputImg)

CVBhighgui.imshow("image", mat: outputImg)
CVBhighgui.waitKey(0)
