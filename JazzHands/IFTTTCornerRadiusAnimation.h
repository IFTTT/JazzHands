//
//  IFTTTCornerRadiusAnimation.h
//  JazzHands
//
//  Created by Nuno Gonçalves on 3/8/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTCornerRadiusAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time cornerRadius:(CGFloat)cornerRadius;
- (void)addKeyframeForTime:(CGFloat)time cornerRadius:(CGFloat)cornerRadius withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
