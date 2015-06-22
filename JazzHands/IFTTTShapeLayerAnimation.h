//
//  IFTTTShapeLayerAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTShapeLayerAnimation : IFTTTAnimation

@property (nonatomic, strong, readonly) CAShapeLayer *layer;

- (instancetype)initWithLayer:(CAShapeLayer *)layer NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithLayer:(CAShapeLayer *)layer;

@end
