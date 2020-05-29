//
//  CVBMat.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-25.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBMat.h"
#import "NSImage+CVBMat.h"

@implementation CVBMat


#pragma mark - Initialization

- (instancetype)init
{
    cv::Mat cvMat = cv::Mat();
    return [self initWithCVMat:cvMat];
}

- (instancetype)initWithNSImage:(NSImage *)anImage
{
    cv::Mat cvMat = [anImage cvMat];
    return [self initWithCVMat:cvMat];
}

- (CGImageRef)imageRef
{
    NSData *data = [NSData dataWithBytes:self.source->mat.data
                                  length:self.source->mat.elemSize() * self.source->mat.total()];
    
    bool isMono = self.source->mat.elemSize() == 1;
    CGColorSpaceRef colorSpace = isMono ? CGColorSpaceCreateDeviceGray() : CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = isMono ? (kCGImageAlphaNone | kCGBitmapByteOrderDefault) : (kCGImageAlphaLast | kCGBitmapByteOrderDefault);
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    CGImageRef imageRef = CGImageCreate(self.source->mat.cols,
                                        self.source->mat.rows,
                                        8,
                                        8 * self.source->mat.elemSize(),
                                        self.source->mat.step[0],
                                        colorSpace,
                                        bitmapInfo,
                                        provider,
                                        NULL,
                                        false,
                                        kCGRenderingIntentDefault);
    
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return imageRef;
}

@end
