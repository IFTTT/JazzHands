//
//  IFTTTAlphaAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTAlphaAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time alpha:(CGFloat)alpha;
- (void)addKeyframeForTime:(CGFloat)time alpha:(CGFloat)alpha withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
