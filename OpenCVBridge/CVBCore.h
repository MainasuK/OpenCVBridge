//
//  CVBCore.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "CVBMat.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBCore : NSObject

+ (NSArray<NSValue *> *)perspectiveTransform2f:(NSArray<NSValue *> *)src m:(CVBMat *)transform;

@end

NS_ASSUME_NONNULL_END
