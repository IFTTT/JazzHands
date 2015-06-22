//
//  IFTTTAlphaAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAlphaAnimation.h"

@implementation IFTTTAlphaAnimation

- (void)addKeyframeForTime:(CGFloat)time alpha:(CGFloat)alpha
{
    if (![self validAlpha:alpha]) return;
    [self addKeyframeForTime:time value:@(alpha)];
}

- (void)addKeyframeForTime:(CGFloat)time alpha:(CGFloat)alpha withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validAlpha:alpha]) return;
    [self addKeyframeForTime:time value:@(alpha) withEasingFunction:easingFunction];
}

- (BOOL)validAlpha:(CGFloat)alpha
{
    NSAssert((alpha >= 0.f) && (alpha <= 1.f), @"Alpha values must be between zero and one.");
    if ((alpha < 0.f) || (alpha > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.view.alpha = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
}

@end
