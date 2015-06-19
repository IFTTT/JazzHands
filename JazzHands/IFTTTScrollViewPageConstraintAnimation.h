//
//  IFTTTScrollViewPageConstraintAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTScrollViewPageConstraintAnimation : IFTTTAnimation <IFTTTAnimatable>

@property (nonatomic, assign) CGFloat pageWidth;

- (instancetype)initWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithSuperview:(UIView *)superview constraint:(NSLayoutConstraint *)constraint pageWidth:(CGFloat)pageWidth;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page;
- (void)addKeyframeForTime:(CGFloat)time page:(CGFloat)page withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
