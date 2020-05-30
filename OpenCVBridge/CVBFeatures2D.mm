//
//  CVBFeatures2D.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/features2d.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBKeyPoint.h"
#import "CVBFeatures2D.h"

@implementation CVBFeatures2D

+ (void)drawKeypoints:(CVBMat *)img keypoints:(NSArray<CVBKeyPoint *> *)cvbKeypoints outImage:(CVBMat *)outImage
{
    std::vector<cv::KeyPoint> keypoints;
    for ( int i = 0; i < cvbKeypoints.count; i++) {
        CVBKeyPoint *cvbKeypoint = cvbKeypoints[i];
        cv::KeyPoint keypoint = cv::KeyPoint(cv::Point2f(cvbKeypoint.pt.x, cvbKeypoint.pt.y),
                                             cvbKeypoint.size,
                                             cvbKeypoint.angle,
                                             cvbKeypoint.response,
                                             cvbKeypoint.octave,
                                             cvbKeypoint.classID);
        keypoints.push_back(keypoint);
    }
    
    cv::drawKeypoints(img.source->mat, keypoints, outImage.source->mat);
}

@end
