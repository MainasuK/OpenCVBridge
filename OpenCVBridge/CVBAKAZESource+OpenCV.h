//
//  CVBAKAZESource+OpenCV.h
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

#import "CVBAKAZESource.h"

struct AKAZESource {
    cv::Ptr<cv::AKAZE> akaze;
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBAKAZESource (OpenCV)

@property struct AKAZESource *source;

- (instancetype)initWithCVAKAZE:(cv::Ptr<cv::AKAZE>)anAKAZE;

@end

NS_ASSUME_NONNULL_END
