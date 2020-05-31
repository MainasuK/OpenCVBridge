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
#import "CVBDMatch.h"

#import "CVBFeatures2D.h"

@implementation CVBFeatures2D

+ (void)drawKeypoints:(CVBMat *)img keypoints:(NSArray<CVBKeyPoint *> *)cvbKeypoints outImage:(CVBMat *)outImage
{
    std::vector<cv::KeyPoint> keypoints = [CVBFeatures2D keypointsFrom:cvbKeypoints];
    
    cv::drawKeypoints(img.source->mat, keypoints, outImage.source->mat);
}

+ (void)drawMatches:(CVBMat *)img1 keypoints1:(NSArray<CVBKeyPoint *> *)cvbKeypoints1 img2:(CVBMat *)img2 keypoints2:(NSArray<CVBKeyPoint *> *)cvbKeypoints2 matches:(NSArray<CVBDMatch *> *)cvbMatches outImg:(CVBMat *)outImg
{
    std::vector<cv::KeyPoint> keypoints1 = [CVBFeatures2D keypointsFrom:cvbKeypoints1];
    std::vector<cv::KeyPoint> keypoints2 = [CVBFeatures2D keypointsFrom:cvbKeypoints2];
    
    std::vector<cv::DMatch> matches = [CVBFeatures2D matchesFrom:cvbMatches];

    cv::drawMatches(img1.source->mat, keypoints1, img2.source->mat, keypoints2, matches, outImg.source->mat);
}

#pragma mark - private
+ (std::vector<cv::KeyPoint>)keypointsFrom:(NSArray<CVBKeyPoint *> *)cvbKeypoints
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
    
    return keypoints;
}

+ (std::vector<cv::DMatch>)matchesFrom:(NSArray<CVBDMatch *> *)cvbMatches
{
    std::vector<cv::DMatch> matches;
    for ( int i = 0; i < cvbMatches.count; i++) {
        CVBDMatch *cvbMatch = cvbMatches[i];
        cv::DMatch match = cv::DMatch(cvbMatch.queryIdx, cvbMatch.trainIdx, cvbMatch.imgIdx, cvbMatch.distance);
        matches.push_back(match);
    }
    
    return matches;
}

+ (NSArray<CVBDMatch *> *)cvbMatchesFrom:(std::vector<cv::DMatch>)matches
{
    NSMutableArray *cvbMatches = [[NSMutableArray alloc] init];
    for ( int i = 0; i < matches.size(); i++) {
        cv::DMatch match = matches[i];
        CVBDMatch *cvbMatch = [[CVBDMatch alloc] initWithQueryIdx:match.queryIdx
                                                         trainIdx:match.trainIdx
                                                           imgIdx:match.imgIdx
                                                         distance:match.distance];
        [cvbMatches addObject:cvbMatch];
    }
    
    return cvbMatches;
}

@end
