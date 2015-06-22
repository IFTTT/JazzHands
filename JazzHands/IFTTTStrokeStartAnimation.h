//
//  IFTTTStrokeStartAnimation.h
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTShapeLayerAnimation.h"

@interface IFTTTStrokeStartAnimation : IFTTTShapeLayerAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart;
- (void)addKeyframeForTime:(CGFloat)time strokeStart:(CGFloat)strokeStart withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
