//
//  main.swift
//  Detecting Corners Location in Subpixels
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Detecting Corners Location in Subpixels")
print("Find easy tracking points")

let img: CVBMat = {
    let image = Unsplash.samples[2]
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(img, to: img, code: .COLOR_BGR2RGB, dstCn: 0)

let gray = CVBMat()
CVBimgproc.cvtColor(img, to: gray, code: .COLOR_BGR2GRAY, dstCn: 0)

let maxCorners = 10

let values = CVBimgproc.goodFeatures(toTrack: gray, maxCorners: Int32(maxCorners), qualityLevel: 0.01, minDistance: 10)
let points = values.map { $0.pointValue }

for point in points {
    CVBimgproc.circle(img, center: point, radius: 5, color: .red, thickness: 5, lineType: 8, shift: 0)
}

let betterValues = CVBimgproc.cornerSubPix(gray, corners: values, win: CGSize(width: 5, height: 5), zerZone: CGSize(width: -1, height: -1), termCriteria: CVBTermCriteria(type: CVBTermCriteriaType.EPS.rawValue + CVBTermCriteriaType.COUNT.rawValue, maxCount: 40, epsilon: 0.001))
let betterPoints = betterValues.map { $0.pointValue }

for point in betterPoints {
    CVBimgproc.circle(img, center: point, radius: 5, color: .blue, thickness: 5, lineType: 8, shift: 0)
}

CVBhighgui.imshow("image", mat: img)
CVBhighgui.waitKey(0)
