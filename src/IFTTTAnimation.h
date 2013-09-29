//
//  IFTTTAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimationKeyFrame.h"

@interface IFTTTAnimation : NSObject

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) NSMutableArray *keyFrames;

- (id)initWithView:(UIView *)view;

- (void)animate:(NSInteger)time;
- (void)addKeyFrame:(IFTTTAnimationKeyFrame *)keyFrame;

- (IFTTTAnimationFrame *)animationFrameForTime:(NSInteger)time;
- (float)tweenValueForStartTime:(NSInteger)startTime
                        endTime:(NSInteger)endTime
                     startValue:(float)startValue
                       endValue:(float)endValue
                         atTime:(float)time;

@end
