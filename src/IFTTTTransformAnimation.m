//
// Created by hayashi311 on 11/10/13.
// Copyright (c) 2013 IFTTT Inc. All rights reserved.
//


#import "IFTTTTransformAnimation.h"


@implementation IFTTTTransformAnimation {

}

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.transform = animationFrame.transform;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    NSInteger startTime = startKeyFrame.time;
    NSInteger endTime = endKeyFrame.time;
    CGAffineTransform startTransform = startKeyFrame.transform;
    CGAffineTransform endTransform = endKeyFrame.transform;

    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.a = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.a endValue:endTransform.a atTime:time];
    transform.b = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.b endValue:endTransform.b atTime:time];
    transform.c = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.c endValue:endTransform.c atTime:time];
    transform.d = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.d endValue:endTransform.d atTime:time];
    transform.tx = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.tx endValue:endTransform.tx atTime:time];
    transform.ty = [self tweenValueForStartTime:startTime endTime:endTime startValue:startTransform.ty endValue:endTransform.ty atTime:time];

    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.transform = transform;

    return animationFrame;
}
@end