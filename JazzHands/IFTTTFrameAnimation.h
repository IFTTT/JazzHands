//
//  IFTTTFrameAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTFrameAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time frame:(CGRect)frame;
- (void)addKeyframeForTime:(CGFloat)time frame:(CGRect)frame withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end