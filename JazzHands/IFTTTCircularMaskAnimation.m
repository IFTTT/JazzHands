//
//  IFTTTCircularMaskAnimation.m
//  JazzHands
//
//  Created by Jason Millard on 9/7/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCircularMaskAnimation.h"

@implementation IFTTTCircularMaskAnimation

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent
{
    [self addKeyframeForTime:time value:@(percent)];
}

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(percent) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGFloat visibilityPercent = ((NSNumber *)[self valueAtTime:time]).floatValue;
    
    CGFloat radius = MAX((self.view.bounds.size.width / 2), (self.view.bounds.size.height / 2));
    CGFloat inset = radius - (radius * visibilityPercent);
    
    CGRect maskedRect = CGRectInset(self.view.bounds, inset, inset);
    
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:maskedRect cornerRadius:radius];
    
    CAShapeLayer* maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    self.view.layer.mask = maskLayer;
}

@end
