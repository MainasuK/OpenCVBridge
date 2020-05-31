//
//  CVBFeatures2D+OpenCV.h
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

#import <OpenCVBridge/OpenCVBridge.h>

#import "CVBMatSource+OpenCV.h"
#import "CVBKeyPoint.h"
#import "CVBDMatch.h"

#import "CVBFeatures2D.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBFeatures2D (OpenCV)

+ (std::vector<cv::KeyPoint>)keypointsFrom:(NSArray<CVBKeyPoint *> *)cvbKeypoints;
+ (std::vector<cv::DMatch>)matchesFrom:(NSArray<CVBDMatch *> *)cvbMatches;
+ (NSArray<CVBDMatch *> *)cvbMatchesFrom:(std::vector<cv::DMatch>)matches;

@end

NS_ASSUME_NONNULL_END
