//
//  main.swift
//  Shi-Tomasi Corner Detector
//
//  Created by Cirno MainasuK on 2020-5-29.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Shi-Tomasi Corner Detector")
print("Find easy tracking points")

let img: CVBMat = {
    let image = Unsplash.samples[2]
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(img, to: img, code: .COLOR_BGR2RGB, dstCn: 0)

let gray = CVBMat()
CVBimgproc.cvtColor(img, to: gray, code: .COLOR_BGR2GRAY, dstCn: 0)

let maxCorners = 30
let points = CVBimgproc.goodFeatures(toTrack: gray, maxCorners: Int32(maxCorners), qualityLevel: 0.01, minDistance: 10)
    .map { $0.pointValue }

for point in points {
    CVBimgproc.circle(img, center: point, radius: 5, color: .red, thickness: 5, lineType: 8, shift: 0)
}

CVBhighgui.imshow("image", mat: img)
CVBhighgui.waitKey(0)
