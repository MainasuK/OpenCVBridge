//
//  CVBDMatch.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-31.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CVBDMatch : NSObject

@property int queryIdx;
@property int trainIdx;
@property int imgIdx;

@property float distance;

- (instancetype)initWithQueryIdx:(int)queryIdx trainIdx:(int)trainIdx imgIdx:(int)imgIdx distance:(float)distance;

@end

NS_ASSUME_NONNULL_END
