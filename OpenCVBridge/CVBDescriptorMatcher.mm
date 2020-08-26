//
//  CVBDescriptorMatcher.m
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

#import "CVBMat.h"
#import "CVBMatSource+OpenCV.h"
#import "CVBDescriptorMatcher.h"
#import "CVBDescriptorMatcherSource+OpenCV.h"
#import "CVBFeatures2D+OpenCV.h"

@implementation CVBDescriptorMatcher

- (instancetype)initWithDescriptorMatcherType:(CVBDescriptorMatcherType)type
{
    cv::DescriptorMatcher::MatcherType matcherType = (cv::DescriptorMatcher::MatcherType)type;
    cv::Ptr<cv::DescriptorMatcher> descriptorMatcher = cv::DescriptorMatcher::create(matcherType);
    return [self initWithCVDescriptorMatcher:descriptorMatcher];
}

- (NSArray<CVBDMatch *> *)match:(CVBMat *)descriptors1 descriptors2:(CVBMat *)descriptors2
{
    std::vector<cv::DMatch> matches;
    self.source->descriptorMatcher->match(descriptors1.source->mat, descriptors2.source->mat, matches);
    
    NSMutableArray *cvbMatches = [[NSMutableArray alloc] init];
    for( size_t i = 0; i < matches.size(); i++ ) {
        cv::DMatch match = matches[i];
        CVBDMatch *cvbMatch = [[CVBDMatch alloc] initWithQueryIdx:match.queryIdx
                                                         trainIdx:match.trainIdx
                                                           imgIdx:match.imgIdx
                                                         distance:match.distance];
        [cvbMatches addObject:cvbMatch];
    }
    
    return cvbMatches;
}

- (NSArray<NSArray<CVBDMatch *> *> *)knnMatch:(CVBMat *)descriptors1 descriptor2:(CVBMat *)descriptor2 k:(int)k
{
    std::vector<std::vector<cv::DMatch>> knnMatches;
    
    if (descriptors1.source->mat.empty() || descriptor2.source->mat.empty()) {
        NSMutableArray *cvbKnnMatches = [[NSMutableArray alloc] init];
        return cvbKnnMatches;
    }
    
    self.source->descriptorMatcher->knnMatch(descriptors1.source->mat,
                                             descriptor2.source->mat,
                                             knnMatches,
                                             k);
    NSMutableArray *cvbKnnMatches = [[NSMutableArray alloc] init];
    for ( size_t i = 0; i < knnMatches.size(); i++ ) {
        NSArray<CVBDMatch *> *cvbMatches = [CVBFeatures2D cvbMatchesFrom:knnMatches[i]];
        [cvbKnnMatches addObject:cvbMatches];
    }

    return cvbKnnMatches;
}

@end
