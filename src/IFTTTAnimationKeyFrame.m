//
//  IFTTTAnimationKeyFrame.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimationKeyFrame.h"

@implementation IFTTTAnimationKeyFrame

+ (instancetype)keyFrameWithTime:(NSInteger)time andAlpha:(CGFloat)alpha
{
    IFTTTAnimationKeyFrame *keyFrame = [[[self class] alloc] initWithTime: time
                                                                 andAlpha: alpha];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andFrame:(CGRect)frame
{
    IFTTTAnimationKeyFrame *keyFrame = [[[self class] alloc] initWithTime: time
                                                                 andFrame: frame];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andHidden:(BOOL)hidden
{
    IFTTTAnimationKeyFrame *keyFrame = [[[self class] alloc] initWithTime: time
                                                                andHidden: hidden];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andColor:(UIColor*)color
{
    IFTTTAnimationKeyFrame *keyFrame = [[[self class] alloc] initWithTime: time
                                                                 andColor: color];
    return keyFrame;
}

- (id)initWithTime:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.time = time;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andAlpha:(CGFloat)alpha
{
    self = [self initWithTime:time];
    
    if (self) {
        self.alpha = alpha;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andFrame:(CGRect)frame
{
    self = [self initWithTime:time];
    
    if (self) {
        self.frame = frame;
    }

    return self;
}

- (id)initWithTime:(NSInteger)time andHidden:(BOOL)hidden
{
    self = [self initWithTime:time];
    
    if (self) {
        self.hidden = hidden;
    }

    return self;
}

- (id)initWithTime:(NSInteger)time andColor:(UIColor*)color
{
    self = [self initWithTime:time];
    
    if (self) {
        self.color = color;
    }
    
    return self;
}

@end
