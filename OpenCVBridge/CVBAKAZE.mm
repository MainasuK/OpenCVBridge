//
//  CVBAKAZE.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/features2d.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBAKAZESource+OpenCV.h"
#import "CVBAKAZE.h"

@implementation CVBAKAZE

- (instancetype)init
{
    return [self initWithCVAKAZE];
}

- (instancetype)initWithCVAKAZE
{
    cv::Ptr<cv::AKAZE> akaze = cv::AKAZE::create();
    return [super initWithCVAKAZE:akaze];
}

- (NSArray<CVBKeyPoint *> *)detectAndCompute:(CVBMat *)img mask:(CVBMat * _Nullable)mask descriptors:(CVBMat *)descriptors
{
    std::vector<cv::KeyPoint> keypoints;
    cv::InputArray cvMask = mask == NULL ? cv::noArray() : mask.source->mat;

    self.source->akaze->detectAndCompute(img.source->mat, cvMask, keypoints, descriptors.source->mat);
    
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
