//
//  IFTTTConstraintMultiplierAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTConstraintMultiplierAnimation.h"

@interface IFTTTConstraintMultiplierAnimation ()

@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) NSLayoutConstraint *constraint;
@property (nonatomic, strong) UIView *referenceView;
@property (nonatomic, assign) IFTTTLayoutAttribute attribute;
@property (nonatomic, assign) CGFloat constant;

@end

@implementation IFTTTConstraintMultiplierAnimation

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView
{
    return [self initWithSuperview:superview constraint:constraint attribute:attribute referenceView:referenceView constant:0.f];
}

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView constant:(CGFloat)constant
{
    if ((self = [super init])) {
        _superview = superview;
        _constraint = constraint;
        _referenceView = referenceView;
        _attribute = attribute;
        _constant = constant;
    }
    return self;
}

+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView
{
    return [self animationWithSuperview:superview constraint:constraint attribute:attribute referenceView:referenceView constant:0.f];
}

+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView constant:(CGFloat)constant
{
    return [[self alloc] initWithSuperview:superview constraint:constraint attribute:attribute referenceView:referenceView constant:constant];
}

- (void)addKeyframeForTime:(CGFloat)time multiplier:(CGFloat)multiplier
{
    [self addKeyframeForTime:time value:@(multiplier)];
}

- (void)addKeyframeForTime:(CGFloat)time multiplier:(CGFloat)multiplier withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(multiplier) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGFloat multiplier = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
    
    CGFloat referenceAttributeValue;
    
    switch (self.attribute) {
        case IFTTTLayoutAttributeOriginX:
            referenceAttributeValue = CGRectGetMinX(self.referenceView.frame);
            break;
        case IFTTTLayoutAttributeOriginY:
            referenceAttributeValue = CGRectGetMinY(self.referenceView.frame);
            break;
        case IFTTTLayoutAttributeCenterX:
            referenceAttributeValue = CGRectGetMinX(self.referenceView.frame) + (CGRectGetWidth(self.referenceView.frame) / 2.f);
            break;
        case IFTTTLayoutAttributeCenterY:
            referenceAttributeValue = CGRectGetMinY(self.referenceView.frame) + (CGRectGetHeight(self.referenceView.frame) / 2.f);
            break;
        case IFTTTLayoutAttributeWidth:
            referenceAttributeValue = CGRectGetWidth(self.referenceView.frame);
            break;
        case IFTTTLayoutAttributeHeight:
            referenceAttributeValue = CGRectGetHeight(self.referenceView.frame);
            break;
    }
    
    self.constraint.constant = (multiplier * referenceAttributeValue) + self.constant;
    [self.superview layoutIfNeeded];
}

@end
