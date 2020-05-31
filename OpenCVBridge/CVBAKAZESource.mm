//
//  CVBAKAZESource.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#pragma clang diagnostic pop

#import "CVBAKAZESource+OpenCV.h"
#import "CVBAKAZESource.h"

@interface CVBAKAZESource () {
    struct AKAZESource *source;
}

@end

@implementation CVBAKAZESource

- (AKAZESource *)source {
    return source;
}

- (instancetype)initWithCVAKaze:(cv::Ptr<cv::AKAZE>)anAkaze
{
    self = [super init];
    
    if (self) {
        AKAZESource *source = new AKAZESource;
        source->akaze = anAkaze;
        self->source = source;
    }
    
    return self;
}

- (void)dealloc
{
    source->akaze.release();
    delete source;
}

@end
