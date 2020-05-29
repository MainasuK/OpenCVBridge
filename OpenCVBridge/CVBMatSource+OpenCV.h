//
//  CVBMatSource+OpenCV.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-27.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource.h"

struct MatSource {
    cv::Mat mat;
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBMatSource (OpenCV)

@property struct MatSource *source;

- (instancetype)initWithCVMat:(cv::Mat)aMat;

@end

NS_ASSUME_NONNULL_END
