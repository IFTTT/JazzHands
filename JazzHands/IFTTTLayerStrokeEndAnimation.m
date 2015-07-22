//
//  IFTTTLayerStrokeEndAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTLayerStrokeEndAnimation.h"

@interface IFTTTLayerStrokeEndAnimation ()

@property (nonatomic, strong) NSString *animationKey;

@end

@implementation IFTTTLayerStrokeEndAnimation

- (instancetype)initWithLayer:(CAShapeLayer *)layer
{
    if ((self = [super initWithLayer:layer])) {
        _animationKey = @"RAZStrokeEnd";
        
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

- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd
{
    if (![self validStrokeEnd:strokeEnd]) return;
    [self addKeyframeForTime:time value:@(strokeEnd)];
}

- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validStrokeEnd:strokeEnd]) return;
    [self addKeyframeForTime:time value:@(strokeEnd) withEasingFunction:easingFunction];
}

- (BOOL)validStrokeEnd:(CGFloat)strokeEnd
{
    NSAssert((strokeEnd >= 0.f) && (strokeEnd <= 1.f), @"Stroke End values must be between zero and one.");
    if ((strokeEnd < 0.f) || (strokeEnd > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.layer.timeOffset = (CFTimeInterval)[(NSNumber *)[self valueAtTime:time] doubleValue];
}

- (void)createBasicAnimation
{
    // Set up CABasicAnimation to animate the stroke end
    [self.layer addAnimation:[self strokeEndAnimation] forKey:self.animationKey];
    self.layer.speed = 0;
    self.layer.timeOffset = 0;
}

- (CABasicAnimation *)strokeEndAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1;
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = false;
    return animation;
}

@end
