//
//  IFTTTAnimation.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

@import Foundation;
@import UIKit;
@class IFTTTAnimationKeyFrame, IFTTTAnimationFrame;

@interface IFTTTAnimation : NSObject

@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) CALayer *layer;
@property (strong, nonatomic) NSLayoutConstraint *constraint;
@property (strong, nonatomic) NSMutableArray *keyFrames;

+ (instancetype)animationWithView:(UIView *)view;
+ (instancetype)animationWithLayer:(CALayer *)layer;

- (id)initWithView:(UIView *)view;
- (id)initWithLayer:(CALayer *)layer;

- (void)animate:(NSInteger)time;

- (void)addKeyFrames:(NSArray *)keyFrames;
- (void)addKeyFrame:(IFTTTAnimationKeyFrame *)keyFrame;

- (IFTTTAnimationFrame *)animationFrameForTime:(NSInteger)time;
- (CGFloat)tweenValueForStartTime:(NSInteger)startTime
                          endTime:(NSInteger)endTime
                       startValue:(CGFloat)startValue
                         endValue:(CGFloat)endValue
                           atTime:(CGFloat)time;

@end
