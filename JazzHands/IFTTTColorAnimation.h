//
//  IFTTTColorAnimation.h
//  IFTTT
//
//  Created by Max Meyers on 10/10/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTColorAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color;
- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
