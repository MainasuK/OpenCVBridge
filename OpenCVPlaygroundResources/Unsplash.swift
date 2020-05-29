//
//  Unsplash.swift
//  OpenCVPlaygroundResources
//
//  Created by Cirno MainasuK on 2020-5-27.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Cocoa

public class Unsplash {
    public static var samples: [NSImage] = {
        let bundle = Bundle(for: Unsplash.self)
        let filenames: [String] = [
            "matt-hardy-GGrB_0GT0OE-unsplash", // Photo by Matt Hardy on Unsplash
            "jusdevoyage-JHwKPOMPhwE-unsplash", // Photo by Jusdevoyage on Unsplash
            "mat-reding-j-SWZ_zBqWI-unsplash", // Photo by Mat Reding on Unsplash
        ]
        return filenames.compactMap { filename in
            bundle.url(forResource: filename, withExtension: "jpg")
                .flatMap { NSImage(contentsOf: $0) }
        }
    }()
}
