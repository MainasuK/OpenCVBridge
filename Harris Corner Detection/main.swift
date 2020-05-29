//
//  main.swift
//  Harris Corner Detection
//
//  Created by Cirno MainasuK on 2020-5-28.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Foundation
import CoreGraphics
import AppKit

import OpenCVBridge
import OpenCVPlaygroundResources

print("Harris Corner Detection")
print("Add red dot to corner")

let img: CVBMat = {
    let image = StandardImage.checkerboard
    return CVBMat(nsImage: image)
}()

let gray = CVBMat()
CVBimgproc.cvtColor(img, to: gray, code: .COLOR_BGR2GRAY, dstCn: 0)

let dst = CVBMat()
CVBimgproc.cornerHarris(gray, to: dst, blockSize: 2, ksize: 3, k: 0.04, borderType: .BORDER_DEFAULT)

let cgImage = dst.imageRef().takeRetainedValue()
let bitmapImageRep = NSBitmapImageRep(cgImage: cgImage)

let threshold = 50  // it's depends on input image
var pixel: Int = 0

// low performance way
for row in 0..<cgImage.height {
    for col in 0..<cgImage.width {
        bitmapImageRep.getPixel(&pixel, atX: col, y: row)
        // print("\(pixel)")
        guard pixel > threshold else { continue }
        CVBimgproc.circle(img, center: CGPoint(x: col, y: row), radius: 2, color: .red, thickness: 5, lineType: 8, shift: 0)
    }
}

CVBhighgui.imshow("window", mat: img)
CVBhighgui.waitKey(0)
