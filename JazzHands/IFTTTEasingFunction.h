//
//  IFTTTEasingFunction.h
//  JazzHands
//
//  Created by Felix Jendrusch on 1/9/15.
//
//

/**
 *  Easing functions specify the rate of change in your animations over time.
 *  Several standard easings are provided here. To explore these, and discover others,
 *  check out http://easings.net
 */

// Copied from Robert Böhnke's RBBAnimation, original available here:
// <https://github.com/robb/RBBAnimation/blob/a29cafe2fa91e62573cc9967990b0ad2a6b17a76/RBBAnimation/RBBEasingFunction.h>

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef CGFloat (^IFTTTEasingFunction) (CGFloat t);

UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionLinear;

UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseInQuad;
UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseOutQuad;
UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutQuad;

UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseInCubic;
UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseOutCubic;
UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseInOutCubic;

UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseInBounce;
UIKIT_EXTERN IFTTTEasingFunction const IFTTTEasingFunctionEaseOutBounce;
