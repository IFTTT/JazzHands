//
//  IFTTTStrokeEndAnimation.h
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTShapeLayerAnimation.h"

@interface IFTTTStrokeEndAnimation : IFTTTShapeLayerAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd;
- (void)addKeyframeForTime:(CGFloat)time strokeEnd:(CGFloat)strokeEnd withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
