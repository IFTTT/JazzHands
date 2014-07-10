//
//  IFTTTFrameAnimation.h
//  JazzHands
//
//  Created by willsbor Kang on 7/9/14.
//

#import "IFTTTConstraintsAnimation.h"

@implementation IFTTTConstraintsAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];

    self.constraint.constant = animationFrame.constraint;
    
    [self.view setNeedsLayout];
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.constraint = [self tweenValueForStartTime:startKeyFrame.time
                                                endTime:endKeyFrame.time
                                             startValue:startKeyFrame.constraint
                                               endValue:endKeyFrame.constraint atTime:time];
    
    return animationFrame;
}

@end
