//
//  CVBTermCriteriaType.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-30.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#ifndef CVBTermCriteriaType_h
#define CVBTermCriteriaType_h

typedef NS_ENUM(int, CVBTermCriteriaType) {
    COUNT=1, //!< the maximum number of iterations or elements to compute
    MAX_ITER=COUNT, //!< ditto
    EPS=2 //!< the desired accuracy or change in parameters at which the iterative algorithm stops
};

#endif /* CVBTermCriteriaType_h */
