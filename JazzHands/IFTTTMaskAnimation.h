//
//  IFTTTMaskAnimation.h
//  JazzHands
//
//  Created by Amir Shavit on 7/26/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

typedef NS_ENUM(NSUInteger, IFTTTMaskEffect)
{
    IFTTTMaskEffectRevealFromTop,
    IFTTTMaskEffectRevealFromLeft,
    IFTTTMaskEffectRevealFromBottom,
    IFTTTMaskEffectRevealFromRight,
    IFTTTMaskEffectRevealFromCenterToCircle,
    IFTTTMaskEffectRevealFromCenterToBounds
};

@interface IFTTTMaskAnimation : IFTTTAnimation <IFTTTAnimatable>

- (instancetype)initWithView:(UIView *)view maskEffect:(IFTTTMaskEffect)maskEffect;
+ (instancetype)animationWithView:(UIView *)view maskEffect:(IFTTTMaskEffect)maskEffect;

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent;
- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
