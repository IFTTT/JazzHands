//
//  IFTTTEasingFunction.h
//  JazzHands
//
//  Created by Felix Jendrusch on 1/9/15.
//
//

// Copied from Robert Böhnke's RBBAnimation, original available here:
// <https://github.com/robb/RBBAnimation/blob/a29cafe2fa91e62573cc9967990b0ad2a6b17a76/RBBAnimation/RBBEasingFunction.h>

#import <QuartzCore/QuartzCore.h>

typedef CGFloat (^IFTTTEasingFunction)(CGFloat t);

extern IFTTTEasingFunction const IFTTTEasingFunctionLinear;

extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuad;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuad;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuad;

extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInCubic;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseOutCubic;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutCubic;

extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuart;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuart;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuart;

extern IFTTTEasingFunction const IFTTTEasingFunctionEaseInBounce;
extern IFTTTEasingFunction const IFTTTEasingFunctionEaseOutBounce;
