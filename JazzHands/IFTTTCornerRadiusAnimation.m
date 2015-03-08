//
//  IFTTTCornerRadiusAnimation.m
//  JazzHands
//
//  Created by Nuno Gonçalves on 3/8/13.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHands.h"

@implementation IFTTTCornerRadiusAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.layer.cornerRadius = animationFrame.cornerRadius;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.cornerRadius = [self tweenValueForStartTime:startKeyFrame.time
                                                       endTime:endKeyFrame.time
                                                    startValue:startKeyFrame.cornerRadius
                                                      endValue:endKeyFrame.cornerRadius
                                                        atTime:time];

    return animationFrame;
}

@end
