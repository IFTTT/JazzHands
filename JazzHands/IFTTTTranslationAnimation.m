//
//  IFTTTTranslationAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTTranslationAnimation.h"
#import "UIView+IFTTTJazzHands.h"

@implementation IFTTTTranslationAnimation

- (void)addKeyframeForTime:(CGFloat)time translation:(CGPoint)translation
{
    [self addKeyframeForTime:time value:[NSValue valueWithCGPoint:translation]];
}

- (void)addKeyframeForTime:(CGFloat)time translation:(CGPoint)translation withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:[NSValue valueWithCGPoint:translation] withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGPoint translation = (CGPoint)[(NSValue *)[self valueAtTime:time] CGPointValue];
    CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    self.view.iftttTranslationTransform = [NSValue valueWithCGAffineTransform:translationTransform];
    CGAffineTransform newTransform = translationTransform;
    if (self.view.iftttRotationTransform) {
        newTransform = CGAffineTransformConcat(newTransform, [self.view.iftttRotationTransform CGAffineTransformValue]);
    }
    if (self.view.iftttScaleTransform) {
        newTransform = CGAffineTransformConcat(newTransform, [self.view.iftttScaleTransform CGAffineTransformValue]);
    }
    self.view.transform = newTransform;
}

@end
