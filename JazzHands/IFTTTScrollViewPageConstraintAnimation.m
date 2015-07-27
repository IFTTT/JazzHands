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
@property (nonatomic, assign) CGFloat initialConstraintConstant;
@property (nonatomic, assign) IFTTTHorizontalPositionAttribute attribute;

@end

@implementation IFTTTScrollViewPageConstraintAnimation

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth attribute:(IFTTTHorizontalPositionAttribute)attribute
{
    if ((self = [super init])) {
        _superview = superview;
        _constraint = constraint;
        _initialConstraintConstant = constraint.constant;
        _pageWidth = pageWidth;
        _attribute = attribute;
    }
    return self;
}

+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth attribute:(IFTTTHorizontalPositionAttribute)attribute
{
    return [[self alloc] initWithSuperview:superview constraint:constraint pageWidth:pageWidth attribute:attribute];
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
    
    CGFloat offset;
    switch (self.attribute) {
        case IFTTTHorizontalPositionAttributeCenterX:
            offset = 0.5f;
            break;
        case IFTTTHorizontalPositionAttributeLeft:
            offset = 0.f;
            break;
        case IFTTTHorizontalPositionAttributeRight:
            offset = 1.f;
            break;
    }
    
    self.constraint.constant = (offset + page) * self.pageWidth + self.initialConstraintConstant;
    [self.superview layoutIfNeeded];
}

@end
