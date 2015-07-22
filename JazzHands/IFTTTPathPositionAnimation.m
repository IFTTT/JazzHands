//
//  IFTTTPathPositionAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/30/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTPathPositionAnimation.h"

@interface IFTTTPathPositionAnimation ()

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) NSString *animationKey;

@end

@implementation IFTTTPathPositionAnimation

- (instancetype)initWithView:(UIView *)view path:(CGPathRef)path
{
    if ((self = [super init])) {
        _view = view;
        _path = path;
        _rotationMode = kCAAnimationRotateAuto;
        _animationKey = @"RAZPathPosition";
        
        [self createKeyframeAnimation];
        
        // CAAnimations are lost when application enters the background, so re-add them
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(createKeyframeAnimation)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)animationWithView:(UIView *)view path:(CGPathRef)path
{
    return [[self alloc] initWithView:view path:path];
}

- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress
{
    if (![self validAnimationProgress:animationProgress]) return;
    [self addKeyframeForTime:time value:@(animationProgress)];
}

- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if (![self validAnimationProgress:animationProgress]) return;
    [self addKeyframeForTime:time value:@(animationProgress) withEasingFunction:easingFunction];
}

- (BOOL)validAnimationProgress:(CGFloat)animationProgress
{
    NSAssert((animationProgress >= 0.f) && (animationProgress <= 1.f), @"Animation progress values must be between zero and one.");
    if ((animationProgress < 0.f) || (animationProgress > 1.f)) return NO;
    return YES;
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    self.view.layer.timeOffset = (CFTimeInterval)[(NSNumber *)[self valueAtTime:time] doubleValue];
}

- (void)setRotationMode:(NSString *)rotationMode
{
    if (_rotationMode != rotationMode) {
        _rotationMode = rotationMode;
        [self createKeyframeAnimation];
    }
}

- (void)setPath:(CGPathRef)path
{
    if (_path != path) {
        _path = path;
        [self createKeyframeAnimation];
    }
}

- (void)createKeyframeAnimation
{
    // Set up a CAKeyframeAnimation to move the view along the path
    [self.view.layer addAnimation:[self pathAnimation] forKey:self.animationKey];
    self.view.layer.speed = 0;
    self.view.layer.timeOffset = 0;
}

- (CAKeyframeAnimation *)pathAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = self.path;
    animation.duration = 1;
    animation.additive = YES;
    animation.repeatCount = HUGE_VALF;
    animation.calculationMode = kCAAnimationPaced;
    animation.rotationMode = self.rotationMode;
    animation.fillMode = kCAFillModeBoth;
    animation.removedOnCompletion = NO;
    return animation;
}

@end
