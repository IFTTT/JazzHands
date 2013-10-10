//
//  IFTTTColorAnimation.m
//  IFTTT
//
//  Created by Max Meyers on 10/10/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTColorAnimation.h"

@implementation IFTTTColorAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.backgroundColor = animationFrame.color;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    
    CGFloat startRed, startBlue, startGreen, startAlpha;
    CGFloat endRed, endBlue, endGreen, endAlpha;
    if ([startKeyFrame.color getRed:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha] &&
        [endKeyFrame.color getRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha]) {
        CGFloat red = [self tweenValueForStartTime:startKeyFrame.time endTime:endKeyFrame.time startValue:startRed endValue:endRed atTime:time];
        CGFloat green = [self tweenValueForStartTime:startKeyFrame.time endTime:endKeyFrame.time startValue:startGreen endValue:endGreen atTime:time];
        CGFloat blue = [self tweenValueForStartTime:startKeyFrame.time endTime:endKeyFrame.time startValue:startBlue endValue:endBlue atTime:time];
        CGFloat alpha = [self tweenValueForStartTime:startKeyFrame.time endTime:endKeyFrame.time startValue:startAlpha endValue:endAlpha atTime:time];
        animationFrame.color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    return animationFrame;
}

@end
