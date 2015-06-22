//
//  IFTTTTranslationAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTTranslationAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time translation:(CGPoint)translation;
- (void)addKeyframeForTime:(CGFloat)time translation:(CGPoint)translation withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
