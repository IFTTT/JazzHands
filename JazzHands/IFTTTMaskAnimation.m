//
//  IFTTTMaskAnimation.m
//  JazzHands
//
//  Created by Amir Shavit on 7/26/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTMaskAnimation.h"

@interface IFTTTMaskAnimation ()

@property (nonatomic, strong) UIView *maskedView;
@property (nonatomic, assign) IFTTTMaskEffect maskEffect;

@end

@implementation IFTTTMaskAnimation

#pragma mark - Init

- (instancetype)initWithView:(UIView *)view maskEffect:(IFTTTMaskEffect)maskEffect
{
    if ((self = [super init])) {
        _maskedView = view;
        _maskEffect = maskEffect;
    }
    return self;
}

+ (instancetype)animationWithView:(UIView *)view maskEffect:(IFTTTMaskEffect)maskEffect
{
    return [[self alloc] initWithView:view maskEffect:maskEffect];
}

#pragma mark - Public Methods

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent
{
    [self addKeyframeForTime:time value:@(percent)];
}

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(percent) withEasingFunction:easingFunction];
}

#pragma mark - IFTTTAnimatable Protocol

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGFloat visibilityPercent = ((NSNumber *)[self valueAtTime:time]).floatValue;
    
    UIBezierPath *maskPath;
    CGRect maskedRect = self.maskedView.bounds;
    switch (self.maskEffect)
    {
        case IFTTTMaskEffectRevealFromTop:
        {
            maskedRect.size.height *= visibilityPercent;
            maskPath = [UIBezierPath bezierPathWithRect:maskedRect];
            break;
        }
        case IFTTTMaskEffectRevealFromLeft:
        {
            maskedRect.size.width *= visibilityPercent;
            maskPath = [UIBezierPath bezierPathWithRect:maskedRect];
            break;
        }
        case IFTTTMaskEffectRevealFromBottom:
        {
            maskedRect.size.height *= visibilityPercent;
            maskedRect.origin.y = CGRectGetMaxY(self.maskedView.bounds) - CGRectGetHeight(maskedRect);
            maskPath = [UIBezierPath bezierPathWithRect:maskedRect];
            break;
        }
        case IFTTTMaskEffectRevealFromRight:
        {
            maskedRect.size.width *= visibilityPercent;
            maskedRect.origin.x = CGRectGetMaxX(self.maskedView.bounds) - CGRectGetWidth(maskedRect);
            maskPath = [UIBezierPath bezierPathWithRect:maskedRect];
            break;
        }
        case IFTTTMaskEffectRevealFromCenterToCircle:
        {
            CGPoint center = CGPointMake((CGRectGetWidth(maskedRect) / 2.f), (CGRectGetHeight(maskedRect) / 2.f));
            CGFloat radius = MIN(center.x, center.y);
            maskPath = [UIBezierPath bezierPathWithArcCenter:center
                                                      radius:radius * visibilityPercent
                                                  startAngle:0.f
                                                    endAngle:M_PI * 2.f
                                                   clockwise:YES];
            break;
        }
        case IFTTTMaskEffectRevealFromCenterToBounds:
        {
            CGPoint center = CGPointMake((CGRectGetWidth(maskedRect) / 2.f), (CGRectGetHeight(maskedRect) / 2.f));
            CGFloat radius = sqrt(pow(center.x, 2) + pow(center.y, 2));
            maskPath = [UIBezierPath bezierPathWithArcCenter:center
                                                      radius:radius * visibilityPercent
                                                  startAngle:0.f
                                                    endAngle:M_PI * 2.f
                                                   clockwise:YES];
            break;
        }
            
        default:
            break;
    }
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.path = maskPath.CGPath;
    self.maskedView.layer.mask = maskLayer;
}

@end
