//
//  IFTTTRotationAnimation.h
//  JazzHands
//
//  Created by Vahur Roosimaa on 12/7/13.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTRotationAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time rotation:(CGFloat)degrees;
- (void)addKeyframeForTime:(CGFloat)time rotation:(CGFloat)degrees withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
