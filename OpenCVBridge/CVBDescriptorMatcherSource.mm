//
//  CVBDescriptorMatcherSource.m
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

#import "CVBDescriptorMatcherSource+OpenCV.h"
#import "CVBDescriptorMatcherSource.h"

@interface CVBDescriptorMatcherSource () {
    struct DescriptorMatcherSource *source;
}

@end

@implementation CVBDescriptorMatcherSource

- (DescriptorMatcherSource *)source
{
    return source;
}

- (instancetype)initWithCVDescriptorMatcher:(cv::Ptr<cv::DescriptorMatcher>)aDescriptorMatcher
{
    self = [super init];
    
    if (self) {
        DescriptorMatcherSource *source = new DescriptorMatcherSource;
        source->descriptorMatcher = aDescriptorMatcher;
        self->source = source;
    }
    
    return self;
}

- (void)dealloc
{
    source->descriptorMatcher.release();
    delete source;
}

@end
