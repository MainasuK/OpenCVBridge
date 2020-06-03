//
//  CVBMat.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-25.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBMatSource.h"
#import "CVBColorConversionCodes.h"

typedef NS_ENUM(int, CVBType) {
    CV8U = 0,
    CV8S = 1,
    CV16U = 2,
    CV16S = 3,
    CV32S = 4,
    CV32F = 5,
    CV64F = 6,
    CV16F = 7,
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBMat : CVBMatSource

#pragma mark - Initialization

+ (instancetype)ones:(int)rows cols:(int)cols type:(CVBType)type;
- (instancetype)initWithNSImage:(NSImage *)anImage;
- (int)rows;
- (int)cols;
- (bool)empty;
- (CVBMat *)multiply:(CVBMat *)aMat;
- (CVBMat *)divideDouble:(double)value;
- (double)getDoubleAtIndex:(int)index;
- (void)setDouble:(double)value at:(int)index;
- (void)setDouble:(double)value atRow:(int)row atCol:(int)col;

- (CGImageRef)imageRef;

@end

NS_ASSUME_NONNULL_END
