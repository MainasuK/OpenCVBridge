//
//  CVBhighgui.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-26.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/highgui.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBhighgui.h"

@implementation CVBhighgui
+ (void)imshow:(NSString *)winname mat:(CVBMat *)aMat {
    std::string std_winname = std::string([winname UTF8String]);
    cv::imshow(std_winname, aMat.source->mat);
}

+ (int)waitKey:(int)delay {
    return cv::waitKey(delay);
}
@end
