//
//  IFTTTScaleAnimation.h
//  JazzHands
//
//  Created by Steven Mok on 1/10/14.
//  Copyright (c) 2014 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTScaleAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time scale:(CGFloat)scale;
- (void)addKeyframeForTime:(CGFloat)time scale:(CGFloat)scale withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
