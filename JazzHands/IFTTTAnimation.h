//
//  IFTTTAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTTTEasingFunction.h"
#import "IFTTTInterpolatable.h"
#import "IFTTTAnimatable.h"

@interface IFTTTAnimation : NSObject

- (void)addKeyframeForTime:(CGFloat)time value:(id<IFTTTInterpolatable>)value;
- (void)addKeyframeForTime:(CGFloat)time value:(id<IFTTTInterpolatable>)value withEasingFunction:(IFTTTEasingFunction)easingFunction;
- (id<IFTTTInterpolatable>)valueAtTime:(CGFloat)time;
- (BOOL)hasKeyframes;

@end
