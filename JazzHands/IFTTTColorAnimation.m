//
//  IFTTTColorAnimation.m
//  IFTTT
//
//  Created by Max Meyers on 10/10/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTColorAnimation.h"

@implementation IFTTTColorAnimation

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
    self.view.backgroundColor = (UIColor *)[self valueAtTime:time];
}

@end
