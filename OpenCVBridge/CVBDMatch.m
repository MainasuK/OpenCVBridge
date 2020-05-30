//
//  CVBDMatch.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import "CVBDMatch.h"

@implementation CVBDMatch

- (instancetype)initWithQueryIdx:(int)queryIdx trainIdx:(int)trainIdx imgIdx:(int)imgIdx distance:(float)distance
{
    self = [super init];
    
    if (self) {
        self.queryIdx = queryIdx;
        self.trainIdx = trainIdx;
        self.imgIdx = imgIdx;
        self.distance = distance;
    }
    
    return self;
}

@end
