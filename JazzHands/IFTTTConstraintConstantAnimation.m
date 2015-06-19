//
//  IFTTTConstraintConstantAnimation.m
//  JazzHands
//
//  Created by willsbor Kang on 7/9/14.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTConstraintConstantAnimation.h"

@interface IFTTTConstraintConstantAnimation ()

@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) NSLayoutConstraint *constraint;

@end

@implementation IFTTTConstraintConstantAnimation

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint
{
    if ((self = [super init])) {
        _superview = superview;
        _constraint = constraint;
    }
    return self;
}

+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint
{
    return [[self alloc] initWithSuperview:superview constraint:constraint];
}

- (void)addKeyframeForTime:(CGFloat)time constant:(CGFloat)constant
{
    [self addKeyframeForTime:time value:@(constant)];
}

- (void)addKeyframeForTime:(CGFloat)time constant:(CGFloat)constant withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(constant) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.constraint.constant = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
    [self.superview layoutIfNeeded];
}

@end
