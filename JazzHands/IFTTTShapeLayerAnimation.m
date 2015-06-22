//
//  IFTTTShapeLayerAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTShapeLayerAnimation.h"

@interface IFTTTShapeLayerAnimation ()

@property (nonatomic, strong, readwrite) CAShapeLayer *layer;

@end

@implementation IFTTTShapeLayerAnimation

- (instancetype)initWithLayer:(CAShapeLayer *)layer
{
    if ((self = [super init])) {
        _layer = layer;
    }
    return self;
}

+ (instancetype)animationWithLayer:(CAShapeLayer *)layer
{
    return [[self alloc] initWithLayer:layer];
}

@end