//
//  IFTTTEasingFunction.m
//  JazzHands
//
//  Created by Felix Jendrusch on 1/9/15.
//
//

// Copied from Robert Böhnke's RBBAnimation, original available here:
// <https://github.com/robb/RBBAnimation/blob/a29cafe2fa91e62573cc9967990b0ad2a6b17a76/RBBAnimation/RBBEasingFunction.m>

#import "IFTTTEasingFunction.h"

CG_INLINE CGFLOAT_TYPE IFTTTJazzHandsPow(CGFLOAT_TYPE aFloat, CGFLOAT_TYPE aPower) {
#if CGFLOAT_IS_DOUBLE
    return pow(aFloat, aPower);
#else
    return powf(aFloat, aPower);
#endif
};

IFTTTEasingFunction const IFTTTEasingFunctionLinear = ^CGFloat(CGFloat t) {
    return t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuad = ^CGFloat(CGFloat t) {
    return t * t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuad = ^CGFloat(CGFloat t) {
    return t * (2 - t);
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuad = ^CGFloat(CGFloat t) {
    if (t < 0.5f) {
        return 2 * t * t;
    } else {
        return -1 + (4 - 2 * t) * t;
    }
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInCubic = ^CGFloat(CGFloat t) {
    return t * t * t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutCubic = ^CGFloat(CGFloat t) {
    return IFTTTJazzHandsPow(t - 1, 3) + 1;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutCubic = ^CGFloat(CGFloat t) {
    if (t < 0.5f) {
        return 4 * IFTTTJazzHandsPow(t, 3);
    } else {
        return (t - 1) * IFTTTJazzHandsPow(2 * t - 2, 2) + 1;
    }
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInBounce = ^CGFloat(CGFloat t) {
    return 1.f - IFTTTEasingFunctionEaseOutBounce(1.0 - t);
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutBounce = ^CGFloat(CGFloat t) {
    if (t < 4.f / 11.f) {
        return IFTTTJazzHandsPow(11.f / 4.f, 2) * IFTTTJazzHandsPow(t, 2);
    }

    if (t < 8.f / 11.f) {
        return 3.0 / 4.0 + IFTTTJazzHandsPow(11.f / 4.f, 2) * IFTTTJazzHandsPow(t - 6.f / 11.f, 2);
    }

    if (t < 10.f / 11.0f) {
        return 15.f / 16.f + IFTTTJazzHandsPow(11.f / 4.f, 2) * IFTTTJazzHandsPow(t - 9.f / 11.f, 2);
    }

    return 63.f / 64.f + IFTTTJazzHandsPow(11.f / 4.f, 2) * IFTTTJazzHandsPow(t - 21.f / 22.f, 2);
};
