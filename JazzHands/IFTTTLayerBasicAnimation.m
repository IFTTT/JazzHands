//
//  IFTTTLayerBasicAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTLayerBasicAnimation.h"

@implementation IFTTTLayerBasicAnimation

- (instancetype)initWithLayer:(CAShapeLayer *)layer
{
    return [super initWithCAMediaTimingObject:layer];
}

+ (instancetype)animationWithLayer:(CAShapeLayer *)layer
{
    return [[self alloc] initWithLayer:layer];
}

@end
