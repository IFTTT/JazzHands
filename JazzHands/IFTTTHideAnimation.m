//
//  IFTTTHideAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTHideAnimation.h"

@interface IFTTTHideAnimation ()

@property (nonatomic, strong) UIView *view;

@end

@implementation IFTTTHideAnimation

+ (instancetype)animationWithView:(UIView *)view hideAt:(CGFloat)time
{
    IFTTTHideAnimation *animation = [[[self class] alloc] initWithView:view
                                                                hideAt:time];
    return animation;
}

+ (instancetype)animationWithView:(UIView *)view showAt:(CGFloat)time
{
    IFTTTHideAnimation *animation = [[[self class] alloc] initWithView:view
                                                                showAt:time];
    return animation;
}

- (instancetype)initWithView:(UIView *)view hideAt:(CGFloat)time
{
    if((self = [super init])) {
        _view = view;
        [self addKeyframeForTime:time value:@(NO)];
        [self addKeyframeForTime:time + 1 value:@(YES)];
    }
    return self;
}

- (instancetype)initWithView:(UIView *)view showAt:(CGFloat)time
{
    if((self = [super init])) {
        _view = view;
        [self addKeyframeForTime:time value:@(YES)];
        [self addKeyframeForTime:time + 1 value:@(NO)];
    }
    return self;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.view.hidden = (BOOL)[(NSNumber *)[self valueAtTime:time] boolValue];
}

@end
