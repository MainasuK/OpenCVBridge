//
//  CVBDescriptorMatcherType.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#ifndef CVBDescriptorMatcherType_h
#define CVBDescriptorMatcherType_h

typedef NS_ENUM(int, CVBDescriptorMatcherType) {
    FLANNBASED            = 1,
    BRUTEFORCE            = 2,
    BRUTEFORCE_L1         = 3,
    BRUTEFORCE_HAMMING    = 4,
    BRUTEFORCE_HAMMINGLUT = 5,
    BRUTEFORCE_SL2        = 6
};


#endif /* CVBDescriptorMatcherType_h */
