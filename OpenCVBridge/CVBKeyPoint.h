//
//  CVBKeyPoint.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CVBKeyPoint : NSObject

@property CGPoint pt;
@property CGFloat size;
@property CGFloat angle;
@property CGFloat response;
@property CGFloat octave;
@property int classID;

- (instancetype)initWithPoint:(CGPoint)pt size:(CGFloat)size angle:(CGFloat)angle response:(CGFloat)response octave:(CGFloat)octave classID:(int)classID;

@end

NS_ASSUME_NONNULL_END
