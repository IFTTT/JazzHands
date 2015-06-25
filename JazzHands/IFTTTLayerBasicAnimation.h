//
//  IFTTTLayerBasicAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCAMediaTimingAnimation.h"

@interface IFTTTLayerBasicAnimation : IFTTTCAMediaTimingAnimation <IFTTTAnimatable>

- (instancetype)initWithLayer:(CAShapeLayer *)layer NS_DESIGNATED_INITIALIZER;
+ (instancetype)animationWithLayer:(CAShapeLayer *)layer;

@end
