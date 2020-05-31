//
//  CVBDescriptorMatcher.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <OpenCVBridge/OpenCVBridge.h>
#import "CVBMat.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBDescriptorMatcher : CVBDescriptorMatcherSource

- (instancetype)initWithDescriptorMatcherType:(CVBDescriptorMatcherType)type;
- (NSArray<CVBDMatch *> *)match:(CVBMat *)descriptors1 descriptors2:(CVBMat *)descriptors2;
- (NSArray<NSArray<CVBDMatch *> *> *)knnMatch:(CVBMat *)descriptors1 descriptor2:(CVBMat *)descriptor2 k:(int)k;

@end

NS_ASSUME_NONNULL_END
