//
//  IFTTTHideAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTHideAnimation.h"

@implementation IFTTTHideAnimation

+ (instancetype)animationWithView:(UIView *)view hideAt:(NSInteger)time
{
    IFTTTHideAnimation *animation = [[[self class] alloc] initWithView: view
                                                                hideAt: time];
    return animation;
}

+ (instancetype)animationWithView:(UIView *)view showAt:(NSInteger)time
{
    IFTTTHideAnimation *animation = [[[self class] alloc] initWithView: view
                                                                showAt: time];
    return animation;
}

- (id)initWithView:(UIView *)view hideAt:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.view = view;
        [self addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:time andHidden:NO]];
        [self addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:time + 1 andHidden:YES]];
    }
    
    return self;
}

- (id)initWithView:(UIView *)view showAt:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.view = view;
        [self addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:time andHidden:YES]];
        [self addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:time + 1 andHidden:NO]];
    }
    
    return self;
}

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.hidden = animationFrame.hidden;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.hidden = (time == startKeyFrame.time ? startKeyFrame : endKeyFrame).hidden;    
    
    return animationFrame;
}

@end
