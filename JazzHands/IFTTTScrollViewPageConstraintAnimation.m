//
//  IFTTTScrollViewPageConstraintAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTScrollViewPageConstraintAnimation.h"

@interface IFTTTScrollViewPageConstraintAnimation ()

@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) NSLayoutConstraint *constraint;

@end

@implementation IFTTTScrollViewPageConstraintAnimation

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth
{
    if ((self = [super init])) {
        _superview = superview;
        _constraint = constraint;
        _pageWidth = pageWidth;
    }
    return self;
}

+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth
{
    return [[self alloc] initWithSuperview:superview constraint:constraint pageWidth:pageWidth];
}

- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page
{
    [self addKeyframeForTime:time value:@(page)];
}

- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(page) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    CGFloat page = (CGFloat)[(NSNumber *)[self valueAtTime:time] floatValue];
    self.constraint.constant = (0.5f + page) * self.pageWidth;
    [self.superview layoutIfNeeded];
}

@end
