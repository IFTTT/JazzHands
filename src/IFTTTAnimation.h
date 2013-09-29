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
- (CGFloat)tweenValueForStartTime:(NSInteger)startTime
                          endTime:(NSInteger)endTime
                       startValue:(CGFloat)startValue
                         endValue:(CGFloat)endValue
                           atTime:(CGFloat)time;

@end
