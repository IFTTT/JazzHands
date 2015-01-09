//
//  IFTTTTweeningFunction.h
//  JazzHands
//
//  Created by Felix Jendrusch on 1/9/15.
//
//

#import "IFTTTAnimation.h"

@class IFTTTAnimationKeyFrame;

typedef IFTTTAnimationFrame * (^IFTTTTweeningFunction)(IFTTTAnimation *animation, NSInteger time, IFTTTAnimationKeyFrame *startKeyFrame, IFTTTAnimationKeyFrame *endKeyFrame);

extern IFTTTTweeningFunction const IFTTTTweeningFunctionDefault;

extern IFTTTTweeningFunction IFTTTTweeningFunctionFrameOriginQuadCurve(CGPoint cp);
extern IFTTTTweeningFunction IFTTTTweeningFunctionFrameOriginCurve(CGPoint cp1, CGPoint cp2);
