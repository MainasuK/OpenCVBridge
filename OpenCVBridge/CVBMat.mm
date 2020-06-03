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

+ (instancetype)ones:(int)rows cols:(int)cols type:(CVBType)type
{
    cv::Mat mat = cv::Mat::ones(rows, cols, type);
    return [[CVBMat alloc] initWithCVMat:mat];
}

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


- (int)rows
{
    return self.source->mat.rows;
}

- (int)cols
{
    return self.source->mat.cols;
}

- (bool)empty
{
    return self.source->mat.empty();
}

- (CVBMat *)multiply:(CVBMat *)aMat
{
    cv::Mat result = self.source->mat * aMat.source->mat;
    return [[CVBMat alloc] initWithCVMat:result];
}

- (CVBMat *)divideDouble:(double)value
{
    cv::Mat result = self.source->mat / value;
    return [[CVBMat alloc] initWithCVMat:result];
}

- (double)getDoubleAtIndex:(int)index
{
    return self.source->mat.at<double>(index);
}

- (void)setDouble:(double)value at:(int)index
{
    self.source->mat.at<double>(index) = value;
}

- (void)setDouble:(double)value atRow:(int)row atCol:(int)col
{
    self.source->mat.at<double>(row, col) = value;
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
