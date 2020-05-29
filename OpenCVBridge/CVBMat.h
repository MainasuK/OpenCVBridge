//
//  CVBMat.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-25.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBMatSource.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBMat : CVBMatSource

#pragma mark - Initialization

- (instancetype)initWithNSImage:(NSImage *)anImage;
- (CGImageRef)imageRef;

@end

NS_ASSUME_NONNULL_END
