//
//  CVBKeyPoint.m
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import "CVBKeyPoint.h"

@implementation CVBKeyPoint

- (instancetype)initWithPoint:(CGPoint)pt size:(CGFloat)size angle:(CGFloat)angle response:(CGFloat)response octave:(CGFloat)octave classID:(int)classID
{
    self = [super init];
    
    if (self) {
        self.pt = pt;
        self.size = size;
        self.angle = angle;
        self.response = response;
        self.octave = octave;
        self.classID = classID;
    }
    
    return self;
}

@end
