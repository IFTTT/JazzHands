//
//  IFTTTViewAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTViewAnimation : IFTTTAnimation

@property (nonatomic, strong, readonly) UIView *view;

- (instancetype)initWithView:(UIView *)view;
+ (instancetype)animationWithView:(UIView *)view;

@end
