//
//  CVBSURFSource+OpenCV.h
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

#import "CVBSURFSource.h"

struct SURFSource {
    cv::Ptr<cv::xfeatures2d::SURF> surf;
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBSURFSource (OpenCV)

@property struct SURFSource *source;

- (instancetype)initWithCVSURF:(cv::Ptr<cv::xfeatures2d::SURF>)aSURF;

@end

NS_ASSUME_NONNULL_END
