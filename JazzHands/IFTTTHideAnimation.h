//
//  IFTTTHideAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTHideAnimation : IFTTTAnimation <IFTTTAnimatable>

+ (instancetype)animationWithView:(UIView *)view hideAt:(CGFloat)time;
+ (instancetype)animationWithView:(UIView *)view showAt:(CGFloat)time;

- (instancetype)initWithView:(UIView *)view hideAt:(CGFloat)time;
- (instancetype)initWithView:(UIView *)view showAt:(CGFloat)time;

@end
