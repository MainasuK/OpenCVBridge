//
//  CVBDescriptorMatcherSource+OpenCV.h
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

#import "CVBDescriptorMatcherSource.h"

struct DescriptorMatcherSource {
    cv::Ptr<cv::DescriptorMatcher> descriptorMatcher;
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBDescriptorMatcherSource (OpenCV)

@property struct DescriptorMatcherSource *source;

- (instancetype)initWithCVDescriptorMatcher:(cv::Ptr<cv::DescriptorMatcher>)aDescriptorMatcher;

@end

NS_ASSUME_NONNULL_END
