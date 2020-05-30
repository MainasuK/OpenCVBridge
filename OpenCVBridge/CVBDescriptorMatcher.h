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
@end

NS_ASSUME_NONNULL_END
