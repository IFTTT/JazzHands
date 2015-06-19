//
//  IFTTTLabelAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTLabelAnimation : IFTTTAnimation

@property (nonatomic, strong, readonly) UILabel *label;

- (instancetype)initWithLabel:(UILabel *)label NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithLabel:(UILabel *)label;

@end
