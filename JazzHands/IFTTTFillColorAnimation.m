//
//  IFTTTFillColorAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 07/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTFillColorAnimation.h"

@implementation IFTTTFillColorAnimation

- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color
{
    if (![self validColor:color]) return;
    [self addKeyframeForTime:time value:color];
}

- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validColor:color]) return;
    [self addKeyframeForTime:time value:color withEasingFunction:easingFunction];
}

- (BOOL)validColor:(UIColor *)color
{
    NSAssert((color != nil), @"Color must not be nil.");
    if (!color) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.layer.fillColor = ((UIColor *)[self valueAtTime:time]).CGColor;
}

@end
