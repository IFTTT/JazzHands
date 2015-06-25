//
//  IFTTTViewBasicAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCAMediaTimingAnimation.h"

@interface IFTTTViewBasicAnimation : IFTTTCAMediaTimingAnimation <IFTTTAnimatable>

- (instancetype)initWithView:(UIView *)view NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithView:(UIView *)view;

@end
