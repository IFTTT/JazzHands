//
//  IFTTTConstraintMultiplierAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

typedef NS_ENUM(NSUInteger, IFTTTLayoutAttribute) {
    IFTTTLayoutAttributeOriginX,
    IFTTTLayoutAttributeOriginY,
    IFTTTLayoutAttributeCenterX,
    IFTTTLayoutAttributeCenterY,
    IFTTTLayoutAttributeWidth,
    IFTTTLayoutAttributeHeight
};

@interface IFTTTConstraintMultiplierAnimation : IFTTTAnimation <IFTTTAnimatable>

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView;
- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView constant:(CGFloat)constant NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView;
+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint attribute:(IFTTTLayoutAttribute)attribute referenceView:(UIView *)referenceView constant:(CGFloat)constant;
- (void)addKeyframeForTime:(CGFloat)time multiplier:(CGFloat)multiplier;
- (void)addKeyframeForTime:(CGFloat)time multiplier:(CGFloat)multiplier withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
