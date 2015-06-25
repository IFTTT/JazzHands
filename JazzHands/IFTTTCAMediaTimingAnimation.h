//
//  IFTTTCAMediaTimingAnimation.h
//  JazzHands
//
//  Created by Laura Skelton on 6/24/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTCAMediaTimingAnimation : IFTTTAnimation <IFTTTAnimatable>

@property (nonatomic, strong) id<CAMediaTiming> caMediaTimingObject;

- (instancetype)initWithCAMediaTimingObject:(id<CAMediaTiming>)caMediaTimingObject;
+ (instancetype)animationWithCAMediaTimingObject:(id<CAMediaTiming>)caMediaTimingObject;
- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress;
- (void)addKeyframeForTime:(CGFloat)time animationProgress:(CGFloat)animationProgress withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
