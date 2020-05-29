//
//  CVBhighgui.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-26.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CVBMat.h"

NS_ASSUME_NONNULL_BEGIN

@interface CVBhighgui : NSObject
+ (void)imshow:(NSString *)winname mat:(CVBMat *)aMat;
+ (int)waitKey:(int)delay;
@end

NS_ASSUME_NONNULL_END
