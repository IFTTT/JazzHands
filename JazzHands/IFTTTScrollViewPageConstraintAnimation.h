//
//  IFTTTScrollViewPageConstraintAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

typedef NS_ENUM(NSUInteger, IFTTTHorizontalPositionAttribute) {
    IFTTTHorizontalPositionAttributeCenterX,
    IFTTTHorizontalPositionAttributeLeft,
    IFTTTHorizontalPositionAttributeRight
};

@interface IFTTTScrollViewPageConstraintAnimation : IFTTTAnimation <IFTTTAnimatable>

@property (nonatomic, assign) CGFloat pageWidth;

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth attribute:(IFTTTHorizontalPositionAttribute)attribute;
+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth attribute:(IFTTTHorizontalPositionAttribute)attribute;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page withEasingFunction:(IFTTTEasingFunction)easingFunction;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page constant:(CGFloat)constant;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page constant:(CGFloat)constant withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
