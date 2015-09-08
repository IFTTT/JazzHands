//
//  IFTTTCircularMaskAnimation.h
//  JazzHands
//
//  Created by Jason Millard on 9/7/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTCircularMaskAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent;
- (void)addKeyframeForTime:(CGFloat)time visibility:(CGFloat)percent withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
