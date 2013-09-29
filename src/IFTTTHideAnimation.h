//
//  IFTTTHideAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTHideAnimation : IFTTTAnimation

- (id)initWithView:(UIView *)view hideAt:(NSInteger)time;
- (id)initWithView:(UIView *)view showAt:(NSInteger)time;

@end
