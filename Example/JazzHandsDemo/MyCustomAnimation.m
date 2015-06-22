//
//  MyCustomAnimation.m
//  JazzHandsDemo
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "MyCustomAnimation.h"

@implementation MyCustomAnimation

- (void)addKeyframeForTime:(CGFloat)time shadowOpacity:(CGFloat)shadowOpacity
{
    [self addKeyframeForTime:time value:@(shadowOpacity)];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.view.layer.shadowOpacity = (float)[(NSNumber *)[self valueAtTime:time] floatValue];
}

@end
