//
//  CVBSURF.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBMat.h"
#import "CVBKeyPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBSURF : CVBSURFSource

- (instancetype)initWithHessianThreshold:(double)hessianThreshold;
- (NSArray<CVBKeyPoint *> *)detect:(CVBMat *)img;
@end

NS_ASSUME_NONNULL_END
