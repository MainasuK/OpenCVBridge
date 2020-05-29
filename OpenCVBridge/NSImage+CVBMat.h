//
//  NSImage+CVBMat.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-26.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CVBMat.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSImage (CVBMat)

- (CGImageRef)CGImage;
- (cv::Mat)cvMat;

@end



NS_ASSUME_NONNULL_END
