//
//  CVBCore.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBCore.h"

@implementation CVBCore

+ (NSArray<NSValue *> *)perspectiveTransform2f:(NSArray<NSValue *> *)src m:(CVBMat *)transform
{
    std::vector<cv::Point2f> srcArray;
    for (int i = 0; i < src.count; i++) {
        CGPoint point = src[i].pointValue;
        srcArray.push_back(cv::Point2f(point.x, point.y));
    }

    std::vector<cv::Point2f> dstArray;
    cv::perspectiveTransform(srcArray, dstArray, transform.source->mat);
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for (int i = 0; i < dstArray.size(); i++) {
        cv::Point2f cvPoint = dstArray[i];
        CGPoint point = CGPointMake(cvPoint.x, cvPoint.y);
        NSValue *value = [NSValue value:&point withObjCType:@encode(CGPoint)];

        [points addObject:value];
    }
    
    return points;
}

+ (double)determinant:(CVBMat *)mat
{
    return cv::determinant(mat.source->mat);
}

@end
