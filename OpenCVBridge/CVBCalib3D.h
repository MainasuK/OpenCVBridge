//
//  CVBCalib3D.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBMat.h"

typedef NS_ENUM(int, Carlib3DFindHomographyMethodType) {
    ZERO = 0,
    LMEDS = 4,
    RANSAC = 8,
    RHO = 16
};

NS_ASSUME_NONNULL_BEGIN

@interface CVBCalib3D : NSObject

+ (CVBMat *)findHomography2f:(NSArray<NSValue *> *)src dst:(NSArray<NSValue *> *)dst method:(Carlib3DFindHomographyMethodType)method;

@end

NS_ASSUME_NONNULL_END
