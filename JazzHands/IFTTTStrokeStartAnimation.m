//
//  IFTTTStrokeStartAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTStrokeStartAnimation.h"

@implementation IFTTTStrokeStartAnimation

- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart
{
    if (![self isValidStrokeStart:strokeStart]) return;
    [self addKeyframeForTime:time value:@(strokeStart)];
}

- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self isValidStrokeStart:strokeStart]) return;
    [self addKeyframeForTime:time value:@(strokeStart) withEasingFunction:easingFunction];
}

- (BOOL)isValidStrokeStart:(CGFloat)strokeStart
{
    NSAssert((strokeStart >= 0.f) && (strokeStart <= 1.f), @"Stroke Start values must be between zero and one.");
    if ((strokeStart < 0.f) || (strokeStart > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.layer.strokeStart = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
}

@end
