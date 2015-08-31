//
//  IFTTTMaskAnimation.m
//  JazzHands
//
//  Created by Amir Shavit on 7/26/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTMaskAnimation.h"

@interface IFTTTMaskAnimation ()

@property (nonatomic, strong) UIView* maskedView;
@property (nonatomic, assign) IFTTTMaskSwipeDirection direction;

@end

@implementation IFTTTMaskAnimation

#pragma mark - Init

- (instancetype)initWithView:(UIView *)view direction:(IFTTTMaskSwipeDirection)direction
{
    if ((self = [super init])) {
        _maskedView = view;
        _direction = direction;
    }
    return self;
}

+ (instancetype)animationWithView:(UIView *)view direction:(IFTTTMaskSwipeDirection)direction
{
    return [[self alloc] initWithView:view direction:direction];
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
    
    CGRect maskedRect = self.maskedView.bounds;
    switch (self.direction)
    {
        case IFTTTMaskSwipeFromTop:
        {
            maskedRect.size.height *= visibilityPercent;
            break;
        }
        case IFTTTMaskSwipeFromLeft:
        {
            maskedRect.size.width *= visibilityPercent;
            break;
        }
        case IFTTTMaskSwipeFromBottom:
        {
            maskedRect.size.height *= visibilityPercent;
            maskedRect.origin.y = CGRectGetMaxY(self.maskedView.bounds) - maskedRect.size.height;
            break;
        }
        case IFTTTMaskSwipeFromRight:
        {
            maskedRect.size.width *= visibilityPercent;
            maskedRect.origin.x = CGRectGetMaxX(self.maskedView.bounds) - maskedRect.size.width;
            break;
        }
            
        default:
            break;
    }

    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRect:maskedRect];

    CAShapeLayer* maskLayer = [CAShapeLayer new];
    maskLayer.path = maskPath.CGPath;
    self.maskedView.layer.mask = maskLayer;
}

@end
