//
//  StandardImage.swift
//  OpenCVPlaygroundResources
//
//  Created by Cirno MainasuK on 2020-5-29.
//  Copyright © 2020 MainasuK. All rights reserved.
//

import Cocoa

public class StandardImage {
    public static var checkerboard: NSImage = {
        let bundle = Bundle(for: StandardImage.self)
        let url = bundle.url(forResource: "1200px-Checkerboard_pattern", withExtension: "png")!
        return NSImage(contentsOf: url)!
    }()
    
    public static var book: NSImage = {
        let bundle = Bundle(for: StandardImage.self)
        let url = bundle.url(forResource: "book", withExtension: "jpg")!
        return NSImage(contentsOf: url)!
    }()
    
    public static var books: NSImage = {
        let bundle = Bundle(for: StandardImage.self)
        let url = bundle.url(forResource: "books", withExtension: "jpg")!
        return NSImage(contentsOf: url)!
    }()
}
