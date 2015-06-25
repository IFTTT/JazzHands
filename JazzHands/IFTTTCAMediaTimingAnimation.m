//
//  IFTTTCAMediaTimingAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCAMediaTimingAnimation.h"

@implementation IFTTTCAMediaTimingAnimation

- (instancetype)initWithCAMediaTimingObject:(id<CAMediaTiming>)caMediaTimingObject
{
    if ((self = [super init])) {
        _caMediaTimingObject = caMediaTimingObject;
        _caMediaTimingObject.speed = 0;
    }
    return self;
}

+ (instancetype)animationWithCAMediaTimingObject:(id<CAMediaTiming>)caMediaTimingObject
{
    return [[self alloc] initWithCAMediaTimingObject:caMediaTimingObject];
}

- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress
{
    [self addKeyframeForTime:time value:@(animationProgress)];
}

- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:@(animationProgress) withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.caMediaTimingObject.timeOffset = (CFTimeInterval)[(NSNumber *)[self valueAtTime:time] doubleValue];
}

@end
