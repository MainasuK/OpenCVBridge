//
//  CVBAKAZE.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CVBAKAZESource.h"
#import "CVBMat.h"
#import "CVBKeyPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBAKAZE : CVBAKAZESource

- (NSArray<CVBKeyPoint *> *)detectAndCompute:(CVBMat *)img mask:(CVBMat * _Nullable)mask descriptors:(CVBMat *)descriptors;

@end

NS_ASSUME_NONNULL_END
