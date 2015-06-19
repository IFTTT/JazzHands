//
//  IFTTTCornerRadiusAnimation.m
//  JazzHands
//
//  Created by Nuno Gonçalves on 3/8/13.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCornerRadiusAnimation.h"

@implementation IFTTTCornerRadiusAnimation

- (void)addKeyframeForTime:(CGFloat)time cornerRadius:(CGFloat)cornerRadius
{
    if (![self validRadius:cornerRadius]) return;
    [self addKeyframeForTime:time value:@(cornerRadius)];
}

- (void)addKeyframeForTime:(CGFloat)time cornerRadius:(CGFloat)cornerRadius withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validRadius:cornerRadius]) return;
    [self addKeyframeForTime:time value:@(cornerRadius) withEasingFunction:easingFunction];
}

- (BOOL)validRadius:(CGFloat)radius
{
    NSAssert((radius >= 0.f), @"Corner radius must be greater than or equal to zero.");
    if (!(radius >= 0.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.view.layer.cornerRadius = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
}

@end
