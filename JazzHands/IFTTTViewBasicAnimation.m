//
//  IFTTTViewBasicAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewBasicAnimation.h"

@implementation IFTTTViewBasicAnimation

- (instancetype)initWithView:(UIView *)view
{
    return [super initWithCAMediaTimingObject:view.layer];
}

+ (instancetype)animationWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

@end
