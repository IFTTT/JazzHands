//
//  IFTTTPathPositionAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/30/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTPathPositionAnimation : IFTTTAnimation <IFTTTAnimatable>

@property (nonatomic, strong) NSString *rotationMode;
@property (nonatomic, assign) CGPathRef path;

- (instancetype)initWithView:(UIView *)view path:(CGPathRef)path;
+ (instancetype)animationWithView:(UIView *)view path:(CGPathRef)path;
- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress;
- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
