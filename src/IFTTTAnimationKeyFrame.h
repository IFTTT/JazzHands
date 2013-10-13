//
//  IFTTTAnimationKeyFrame.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimationFrame.h"

@interface IFTTTAnimationKeyFrame : IFTTTAnimationFrame

+ (instancetype)keyFrameWithTime:(NSInteger)time andAlpha:(CGFloat)alpha;
+ (instancetype)keyFrameWithTime:(NSInteger)time andFrame:(CGRect)frame;
+ (instancetype)keyFrameWithTime:(NSInteger)time andHidden:(BOOL)hidden;
+ (instancetype)keyFrameWithTime:(NSInteger)time andColor:(UIColor*)color;

- (id)initWithTime:(NSInteger)time andAlpha:(CGFloat)alpha;
- (id)initWithTime:(NSInteger)time andFrame:(CGRect)frame;
- (id)initWithTime:(NSInteger)time andHidden:(BOOL)hidden;
- (id)initWithTime:(NSInteger)time andColor:(UIColor*)color;

@property (assign, nonatomic) NSInteger time;

@end
