//
//  IFTTTScrollViewPageConstraintAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTScrollViewPageConstraintAnimation.h"
#import "IFTTTFilmstrip.h"

@interface IFTTTScrollViewPageConstraintAnimation ()

@property (nonatomic, strong) UIView *superview;
@property (nonatomic, strong) NSLayoutConstraint *constraint;
@property (nonatomic, assign) CGFloat initialConstraintConstant;
@property (nonatomic, assign) IFTTTHorizontalPositionAttribute attribute;
@property (nonatomic, strong) IFTTTFilmstrip *constantFilmstrip;

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
        _constantFilmstrip = [IFTTTFilmstrip new];
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

- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page constant:(CGFloat)constant
{
    [self addKeyframeForTime:time value:@(page)];
    [self.constantFilmstrip setValue:@(constant) atTime:time];
}

- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page constant:(CGFloat)constant withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(page) withEasingFunction:easingFunction];
    [self.constantFilmstrip setValue:@(constant) atTime:time withEasingFunction:easingFunction];
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
    
    CGFloat constant = 0.f;
    if (!self.constantFilmstrip.isEmpty) {
        constant = (CGFloat)[(NSNumber *)[self.constantFilmstrip valueAtTime:time] floatValue];
    }
    
    self.constraint.constant = (offset + page) * self.pageWidth + self.initialConstraintConstant + constant;
    [self.superview layoutIfNeeded];
}

@end
