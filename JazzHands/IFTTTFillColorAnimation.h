//
//  IFTTTFillColorAnimation.h
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 07/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTShapeLayerAnimation.h"

@interface IFTTTFillColorAnimation : IFTTTShapeLayerAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color;
- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
