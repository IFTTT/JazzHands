//
//  IFTTTTextColorAnimation.h
//  IFTTT
//
//  Created by Iulian Onofrei on 07/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTTextColorAnimation : IFTTTAnimation <IFTTTAnimatable>

- (instancetype)initWithLabel:(UILabel *)label;
+ (instancetype)animationWithLabel:(UILabel *)label;
- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color;
- (void)addKeyframeForTime:(CGFloat)time color:(UIColor *)color withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end