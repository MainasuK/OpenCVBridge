//
//  CVBSURFSource.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import "CVBSURFSource.h"
#import "CVBSURFSource+OpenCV.h"

@interface CVBSURFSource () {
    struct SURFSource *source;
}
    
@end

@implementation CVBSURFSource

- (SURFSource *)source
{
    return source;
}

- (instancetype)initWithCVSURF:(cv::Ptr<cv::xfeatures2d::SURF>)aSURF
{
    self = [super init];
    
    if (self) {
        SURFSource *surfSource = new SURFSource;
        surfSource->surf = aSURF;
        self->source = surfSource;
    }
    
    return self;
}

- (void)dealloc
{
    source->surf.release();
    delete source;
}

@end
