//
//  CVBCalib3D.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/calib3d.hpp>
#pragma clang diagnostic pop

#import "CVBCalib3D.h"
#import "CVBMatSource+OpenCV.h"

@implementation CVBCalib3D

+ (CVBMat *)findHomography2f:(NSArray<NSValue *> *)src dst:(NSArray<NSValue *> *)dst method:(Carlib3DFindHomographyMethodType)method
{
    std::vector<cv::Point2f> srcArray;
    for (int i = 0; i < src.count; i++) {
        CGPoint point = src[i].pointValue;
        srcArray.push_back(cv::Point2f(point.x, point.y));
    }
    
    std::vector<cv::Point2f> dstArray;
    for (int i = 0; i < dst.count; i++) {
        CGPoint point = dst[i].pointValue;
        dstArray.push_back(cv::Point2f(point.x, point.y));
    }
    
    cv::Mat mat = cv::findHomography(srcArray, dstArray, method);
    return [[CVBMat alloc] initWithCVMat:mat];
}

@end
