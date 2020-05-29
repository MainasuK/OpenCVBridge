//
//  main.swift
//  OpenCVPlayground
//
//  Created by Cirno MainasuK on 2020-5-26.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Cocoa
import OpenCVBridge
import OpenCVPlaygroundResources

print("Hello, World!")

//let image = NSImage(contentsOf: URL(fileURLWithPath: "/Users/mainasuk/Downloads/EYvfYzhU4AAKd-e.jpeg"))!

func showImage() {
    let mat: CVBMat = {
        let image = Unsplash.samples[0]
        return CVBMat(nsImage: image)
    }()
    CVBimgproc.cvtColor(mat, to: mat, code: Int32(COLOR_BGR2RGB.rawValue), with: 0)
    CVBhighgui.imshow("window", mat: mat)
    CVBhighgui.waitKey(0)
}

// showImage()


func testLeaking() {
    let image = Unsplash.samples[0]
    _ = CVBMat(nsImage: image)
}

// for _ in 0..<1000 {
//     autoreleasepool {
//         testLeaking()
//         print("We are safe")
//     }
// }

