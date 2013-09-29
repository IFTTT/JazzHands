//
//  IFTTTFrameAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTFrameAnimation.h"

@implementation IFTTTFrameAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.frame = self.view.bounds = animationFrame.frame;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    NSInteger startTime = startKeyFrame.time;
    NSInteger endTime = endKeyFrame.time;
    CGRect startLocation = startKeyFrame.frame;
    CGRect endLocation = endKeyFrame.frame;
    
    CGRect frame = self.view.frame;
    frame.origin.x = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetMinX(startLocation) endValue:CGRectGetMinX(endLocation) atTime:time];
    frame.origin.y = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetMinY(startLocation) endValue:CGRectGetMinY(endLocation) atTime:time];
    frame.size.width = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetWidth(startLocation) endValue:CGRectGetWidth(endLocation) atTime:time];
    frame.size.height = [self tweenValueForStartTime:startTime endTime:endTime startValue:CGRectGetHeight(startLocation) endValue:CGRectGetHeight(endLocation) atTime:time];

    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.frame = CGRectIntegral(frame);
    
    return animationFrame;
}

@end
