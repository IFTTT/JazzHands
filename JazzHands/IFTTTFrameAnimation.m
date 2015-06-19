//
//  IFTTTFrameAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTFrameAnimation.h"

@implementation IFTTTFrameAnimation

- (void)addKeyframeForTime:(CGFloat)time frame:(CGRect)frame
{
    if (![self validFrame:frame]) return;
    [self addKeyframeForTime:time value:[NSValue valueWithCGRect:frame]];
}

- (void)addKeyframeForTime:(CGFloat)time frame:(CGRect)frame withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validFrame:frame]) return;
    [self addKeyframeForTime:time value:[NSValue valueWithCGRect:frame] withEasingFunction:easingFunction];
}

- (BOOL)validFrame:(CGRect)frame
{
    NSAssert((CGRectGetWidth(frame) >= 0.f) && (CGRectGetHeight(frame) >= 0.f), @"Frame width and height must be greater than or equal to zero.");
    if (!((CGRectGetWidth(frame) >= 0.f) && (CGRectGetHeight(frame) >= 0.f))) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    
    // Store the current transform
    CGAffineTransform tempTransform = self.view.transform;
    
    // Reset transform to avoid warping
    self.view.transform = CGAffineTransformIdentity;
    self.view.frame = (CGRect)[(NSValue *)[self valueAtTime:time] CGRectValue];
    
    // Return to original transform
    self.view.transform = tempTransform;
}

@end
