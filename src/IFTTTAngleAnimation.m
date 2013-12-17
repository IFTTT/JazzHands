//
//  IFTTTAngleAnimation.m
//  JazzHands
//
//  Created by Vahur Roosimaa on 12/7/13.
//

#import "IFTTTAngleAnimation.h"

@implementation IFTTTAngleAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;

    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.transform = CGAffineTransformMakeRotation(animationFrame.angle);

}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.angle = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.angle
                                               endValue:endKeyFrame.angle atTime:time];

    return animationFrame;
}

@end
