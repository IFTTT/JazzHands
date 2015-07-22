//
//  IFTTTTextColorAnimation.m
//  IFTTT
//
//  Created by Iulian Onofrei on 07/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTTextColorAnimation.h"

@interface IFTTTTextColorAnimation ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation IFTTTTextColorAnimation

- (instancetype)initWithLabel:(UILabel *)label
{
    if ((self = [super init])) {
        _label = label;
    }
    return self;
}

+ (instancetype)animationWithLabel:(UILabel *)label
{
    return [[self alloc] initWithLabel:label];
}

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
    self.label.textColor = (UIColor *)[self valueAtTime:time];
}

@end
