//
//  IFTTTConstraintConstantAnimation.h
//  JazzHands
//
//  Created by willsbor Kang on 7/9/14.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTConstraintConstantAnimation : IFTTTAnimation <IFTTTAnimatable>

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint;
- (void)addKeyframeForTime:(CGFloat)time constant:(CGFloat)constant;
- (void)addKeyframeForTime:(CGFloat)time constant:(CGFloat)constant withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
