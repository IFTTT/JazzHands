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

#if CGFLOAT_IS_DOUBLE
#define POW(X, Y) pow(X, Y)
#else
#define POW(X, Y) powf(X, Y)
#endif

IFTTTEasingFunction const IFTTTEasingFunctionLinear = ^(CGFloat t) {
    return t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuad = ^(CGFloat t) {
    return t * t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuad = ^(CGFloat t) {
    return t * (2 - t);
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuad = ^(CGFloat t) {
    if (t < 0.5) {
        return 2 * t * t;
    } else {
        return -1 + (4 - 2 * t) * t;
    }
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInCubic = ^(CGFloat t) {
    return t * t * t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutCubic = ^(CGFloat t) {
    return POW(t - 1, 3) + 1;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutCubic = ^(CGFloat t) {
    if (t < 0.5) {
        return 4 * POW(t, 3);
    } else {
        return (t - 1) * POW(2 * t - 2, 2) + 1;
    }
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuart = ^(CGFloat t) {
    return t * t * t * t;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuart = ^(CGFloat t) {
    return POW(t - 1, 4) + 1;
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuart = ^(CGFloat t) {
    if (t < 0.5) {
        return 8 * POW(t, 4);
    } else {
        return -1 / 2 * POW(2 * t - 2, 4) + 1;
    }
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseInBounce = ^CGFloat(CGFloat t) {
    return 1.0 - IFTTTEasingFunctionEaseOutBounce(1.0 - t);
};

IFTTTEasingFunction const IFTTTEasingFunctionEaseOutBounce = ^CGFloat(CGFloat t) {
    if (t < 4.0 / 11.0) {
        return POW(11.0 / 4.0, 2) * POW(t, 2);
    }

    if (t < 8.0 / 11.0) {
        return 3.0 / 4.0 + POW(11.0 / 4.0, 2) * POW(t - 6.0 / 11.0, 2);
    }

    if (t < 10.0 / 11.0) {
        return 15.0 /16.0 + POW(11.0 / 4.0, 2) * POW(t - 9.0 / 11.0, 2);
    }

    return 63.0 / 64.0 + POW(11.0 / 4.0, 2) * POW(t - 21.0 / 22.0, 2);
};
