//
//  CVBMatSource.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-28.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#pragma clang diagnostic pop

#import "CVBMatSource+OpenCV.h"
#import "CVBMatSource.h"

@interface CVBMatSource () {
    struct MatSource *source;
}

@end

@implementation CVBMatSource

- (MatSource *)source
{
    return source;
}


- (instancetype)initWithCVMat:(cv::Mat)aMat
{
    self = [super init];

    if (self) {
        MatSource *matSource = new MatSource;
        matSource->mat = aMat;
        self->source = matSource;
    }
    
    return self;
}

- (void)dealloc
{
    source->mat.release();
    delete source;
}

@end
