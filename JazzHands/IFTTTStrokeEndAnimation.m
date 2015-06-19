//
//  IFTTTStrokeEndAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTStrokeEndAnimation.h"

@implementation IFTTTStrokeEndAnimation

- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd
{
    if (![self isValidStrokeEnd:strokeEnd]) return;
    [self addKeyframeForTime:time value:@(strokeEnd)];
}

- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self isValidStrokeEnd:strokeEnd]) return;
    [self addKeyframeForTime:time value:@(strokeEnd) withEasingFunction:easingFunction];
}

- (BOOL)isValidStrokeEnd:(CGFloat)strokeEnd
{
    NSAssert((strokeEnd >= 0.f) && (strokeEnd <= 1.f), @"Stroke End values must be between zero and one.");
    if ((strokeEnd < 0.f) || (strokeEnd > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.layer.strokeEnd = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
}

@end
