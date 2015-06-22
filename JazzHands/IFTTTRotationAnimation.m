//
//  IFTTTRotationAnimation.m
//  JazzHands
//
//  Created by Vahur Roosimaa on 12/7/13.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTRotationAnimation.h"
#import "UIView+IFTTTJazzHands.h"

@implementation IFTTTRotationAnimation

- (void)addKeyframeForTime:(CGFloat)time rotation:(CGFloat)degrees
{
    [self addKeyframeForTime:time value:@(degrees)];
}

- (void)addKeyframeForTime:(CGFloat)time rotation:(CGFloat)degrees withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(degrees) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGFloat degrees = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
    CGFloat radians = degrees * (CGFloat)(M_PI / -180.0);
    CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(radians);
    self.view.iftttRotationTransform = [NSValue valueWithCGAffineTransform:rotationTransform];
    CGAffineTransform newTransform = rotationTransform;
    if (self.view.iftttScaleTransform) {
        newTransform = CGAffineTransformConcat(newTransform, [self.view.iftttScaleTransform CGAffineTransformValue]);
    }
    if (self.view.iftttTranslationTransform) {
        newTransform = CGAffineTransformConcat(newTransform, [self.view.iftttTranslationTransform CGAffineTransformValue]);
    }
    self.view.transform = newTransform;
}

@end
