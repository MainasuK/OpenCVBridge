//
//  CVBSURF.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/xfeatures2d.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBSURFSource+OpenCV.h"
#import "CVBSURF.h"

@implementation CVBSURF

- (instancetype)init
{
    cv::Ptr<cv::xfeatures2d::SURF> surf = cv::xfeatures2d::SURF::create();
    return [self initWithCVSURF:surf];
}

- (instancetype)initWithHessianThreshold:(double)hessianThreshold
{
    cv::Ptr<cv::xfeatures2d::SURF> surf = cv::xfeatures2d::SURF::create(hessianThreshold);
    return [self initWithCVSURF:surf];
}

- (NSArray<CVBKeyPoint *> *)detect:(CVBMat *)img
{
    std::vector<cv::KeyPoint> keypoints;
    self.source->surf->detect(img.source->mat, keypoints);
    
    NSMutableArray *points = [[NSMutableArray alloc] init];
    for( size_t i = 0; i < keypoints.size(); i++ ) {
        cv::KeyPoint keypoint = keypoints[i];
        CVBKeyPoint *cvbKeypoint = [[CVBKeyPoint alloc] initWithPoint:CGPointMake(keypoint.pt.x, keypoint.pt.y)
                                                                 size:keypoint.size
                                                                angle:keypoint.angle
                                                             response:keypoint.response
                                                               octave:keypoint.octave
                                                              classID:keypoint.class_id];
        [points addObject:cvbKeypoint];
    }
    
    return points;
}

@end
