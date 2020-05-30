//
//  CVBTermCriteria.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBTermCriteriaType.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBTermCriteria : NSObject

@property int type;
@property int maxCount;
@property double epsilon;

#pragma mark - Initialization

- (instancetype)initWithType:(int)type maxCount:(int)maxCount epsilon:(double)epsilon;

@end

NS_ASSUME_NONNULL_END
