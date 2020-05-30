//
//  CVBFeatures2D.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CVBMat.h"
#import "CVBKeyPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBFeatures2D : NSObject

+ (void)drawKeypoints:(CVBMat *)img keypoints:(NSArray<CVBKeyPoint *> *)keypoints outImage:(CVBMat *)outImage;

@end

NS_ASSUME_NONNULL_END
