//
//  CVBAKAZESource.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import "CVBAKAZESource.h"
#import "CVBAKAZESource+OpenCV.h"

@interface CVBAKAZESource () {
    struct AKAZESource *source;
}

@end

@implementation CVBAKAZESource

- (AKAZESource *)source {
    return source;
}

- (instancetype)initWithCVAKAZE:(cv::Ptr<cv::AKAZE>)aAKAZE
{
    self = [super init];
    
    if (self) {
        AKAZESource *source = new AKAZESource;
        source->akaze = aAKAZE;
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
