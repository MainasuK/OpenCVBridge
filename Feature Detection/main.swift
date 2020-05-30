//
//  main.swift
//  Feature Detection
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import OpenCVBridge
import OpenCVPlaygroundResources

print("Feature Detection")
print("SURF feature point detection")

let img: CVBMat = {
    let image = StandardImage.books
    return CVBMat(nsImage: image)
}()
CVBimgproc.cvtColor(img, to: img, code: .COLOR_BGR2RGB, dstCn: 0)

let minHessian = 400.0
let detector = CVBSURF(hessianThreshold: minHessian)
let keypoints = detector.detect(img)

let imgKeypoints = CVBMat()
CVBFeatures2D.drawKeypoints(img, keypoints: keypoints, outImage: imgKeypoints)


CVBhighgui.imshow("image", mat: imgKeypoints)
CVBhighgui.waitKey(0)
