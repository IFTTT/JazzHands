//
//  IFTTTLayerStrokeStartAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTLayerStrokeStartAnimation.h"

@interface IFTTTLayerStrokeStartAnimation ()

@property (nonatomic, strong) NSString *animationKey;

@end

@implementation IFTTTLayerStrokeStartAnimation

- (instancetype)initWithLayer:(CAShapeLayer *)layer
{
    if ((self = [super initWithLayer:layer])) {
        _animationKey = @"RAZStrokeStart";
        
        [self createBasicAnimation];
        
        // CAAnimations are lost when application enters the background, so re-add them
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(createBasicAnimation)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart
{
    if (![self validStrokeStart:strokeStart]) return;
    [self addKeyframeForTime:time value:@(strokeStart)];
}

- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validStrokeStart:strokeStart]) return;
    [self addKeyframeForTime:time value:@(strokeStart) withEasingFunction:easingFunction];
}

- (BOOL)validStrokeStart:(CGFloat)strokeStart
{
    NSAssert((strokeStart >= 0.f) && (strokeStart <= 1.f), @"Stroke Start values must be between zero and one.");
    if ((strokeStart < 0.f) || (strokeStart > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.layer.timeOffset = (CFTimeInterval)[(NSNumber *)[self valueAtTime:time] doubleValue];
}

- (void)createBasicAnimation
{
    // Set up CABasicAnimation to animate the stroke start
    [self.layer addAnimation:[self strokeStartAnimation] forKey:self.animationKey];
    self.layer.speed = 0;
    self.layer.timeOffset = 0;
}

- (CABasicAnimation *)strokeStartAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration = 1;
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = false;
    return animation;
}

@end
