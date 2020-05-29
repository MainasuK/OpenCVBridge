//
//  CVBBorderTypes.h
//  OpenCVBridge
//
//  Created by Cirno MainasuK on 2020-5-28.
//  Copyright © 2020 MainasuK. All rights reserved.
//

#ifndef CVBBorderTypes_h
#define CVBBorderTypes_h

//! Various border types, image boundaries are denoted with `|`
//! @see borderInterpolate, copyMakeBorder
typedef NS_ENUM(int, BorderTypes) {
    BORDER_CONSTANT    = 0, //!< `iiiiii|abcdefgh|iiiiiii`  with some specified `i`
    BORDER_REPLICATE   = 1, //!< `aaaaaa|abcdefgh|hhhhhhh`
    BORDER_REFLECT     = 2, //!< `fedcba|abcdefgh|hgfedcb`
    BORDER_WRAP        = 3, //!< `cdefgh|abcdefgh|abcdefg`
    BORDER_REFLECT_101 = 4, //!< `gfedcb|abcdefgh|gfedcba`
    BORDER_TRANSPARENT = 5, //!< `uvwxyz|abcdefgh|ijklmno`
    
    BORDER_REFLECT101  = BORDER_REFLECT_101, //!< same as BORDER_REFLECT_101
    BORDER_DEFAULT     = BORDER_REFLECT_101, //!< same as BORDER_REFLECT_101
    BORDER_ISOLATED    = 16 //!< do not look outside of ROI
};


#endif /* CVBBorderTypes_h */
