//
//  IFTTTScaleAnimation.m
//  JazzHands
//
//  Created by Steven Mok on 1/10/14.
//  Copyright (c) 2014 IFTTT Inc. All rights reserved.
//

#import "IFTTTScaleAnimation.h"

@implementation IFTTTScaleAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    CGFloat scale = animationFrame.scale;
    self.view.transform = CGAffineTransformMakeScale(scale, scale);
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.scale = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.scale
                                               endValue:endKeyFrame.scale atTime:time];

    return animationFrame;
}

@end
