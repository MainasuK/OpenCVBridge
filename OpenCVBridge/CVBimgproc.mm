//
//  CVBimgproc.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-26.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/imgproc.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBimgproc.h"

@implementation CVBimgproc
+ (void)cvtColor:(CVBMat *)src to:(CVBMat *)dst code:(ColorConversionCodes)code dstCn:(int)dstCn
{
    cv::cvtColor(src.source->mat, dst.source->mat, code, dstCn);
}

+ (void)circle:(CVBMat *)img center:(CGPoint)center radius:(int)radius color:(NSColor *)color thickness:(int)thickness lineType:(int)lineType shift:(int)shift
{
    cv::circle(img.source->mat, cv::Point(center.x, center.y), radius, cv::Scalar(color.blueComponent * 255, color.greenComponent * 255, color.redComponent * 255, color.alphaComponent * 255), thickness, lineType, shift);
}

+ (void)cornerHarris:(CVBMat *)src to:(CVBMat *)dst blockSize:(int)blockSize ksize:(int)ksize k:(double)k borderType:(BorderTypes)borderType
{
    cv::cornerHarris(src.source->mat, dst.source->mat, blockSize, ksize, k, borderType);
}

+ (NSArray<NSValue *> *)goodFeaturesToTrack:(CVBMat *)img maxCorners:(int)maxCorners qualityLevel:(double)qualityLevel minDistance:(double)minDistance
{
    std::vector<cv::Point2f> corners;
    cv::goodFeaturesToTrack(img.source->mat, corners, maxCorners, qualityLevel, minDistance);
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for( size_t i = 0; i < corners.size(); i++ ) {
        cv::Point2f corner = corners[i];
        CGPoint point = CGPointMake(corner.x, corner.y);
        NSValue *value = [NSValue value:&point withObjCType:@encode(CGPoint)];
        
        [points addObject:value];
    }

    return points;
}

+ (NSArray<NSValue *> *)cornerSubPix:(CVBMat *)img corners:(NSArray<NSValue *> *)corners winSize:(CGSize)winSize zerZone:(CGSize)zeroZone termCriteria:(CVBTermCriteria *)termCriteria
{
    std::vector<cv::Point2f> cvCorners;

    for (size_t i = 0; i < corners.count; i++) {
        CGPoint point = [corners[i] pointValue];
        cvCorners.push_back(cv::Point2f(point.x, point.y));
    }
    
    cv::Size cvWinSize = cv::Size(winSize.width, winSize.height);
    cv::Size cvZerZone = cv::Size(zeroZone.width, zeroZone.height);
    cv::TermCriteria cvTermCriteria = cv::TermCriteria(termCriteria.type, termCriteria.maxCount, termCriteria.epsilon);
    
    cv::cornerSubPix(img.source->mat, cvCorners, cvWinSize, cvZerZone, cvTermCriteria);
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for( size_t i = 0; i < cvCorners.size(); i++ ) {
        cv::Point2f corner = cvCorners[i];
        CGPoint point = CGPointMake(corner.x, corner.y);
        NSValue *value = [NSValue value:&point withObjCType:@encode(CGPoint)];
        
        [points addObject:value];
    }
    
    return points;
}
@end
