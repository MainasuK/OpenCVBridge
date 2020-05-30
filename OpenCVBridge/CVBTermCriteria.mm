//
//  CVBTermCriteria.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"
#import <opencv2/core.hpp>
#import <opencv2/imgproc.hpp>
#pragma clang diagnostic pop

#import "CVBTermCriteria.h"

@implementation CVBTermCriteria

- (instancetype)initWithType:(int)type maxCount:(int)maxCount epsilon:(double)epsilon
{
    self = [super init];
    
    if (self) {
        self.type = type;
        self.maxCount = maxCount;
        self.epsilon = epsilon;
    }
    
    return self;
}

@end
