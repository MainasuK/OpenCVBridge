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
#import "CVBDMatch.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBFeatures2D : NSObject

+ (void)drawKeypoints:(CVBMat *)img keypoints:(NSArray<CVBKeyPoint *> *)keypoints outImage:(CVBMat *)outImage;
+ (void)drawMatches:(CVBMat *)img1 keypoints1:(NSArray<CVBKeyPoint *> *)keypoints1 img2:(CVBMat *)img2 keypoints2:(NSArray<CVBKeyPoint *> *)keypoints2 matches:(NSArray<CVBDMatch *> *)matches outImg:(CVBMat *)outImg;

@end

NS_ASSUME_NONNULL_END
