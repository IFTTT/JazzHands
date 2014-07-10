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

    self.constraint.constant = animationFrame.constraintConstant;
    
    [self.view setNeedsLayout];
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.constraintConstant = [self tweenValueForStartTime:startKeyFrame.time
                                                             endTime:endKeyFrame.time
                                                          startValue:startKeyFrame.constraintConstant
                                                            endValue:endKeyFrame.constraintConstant
                                                              atTime:time];
    
    return animationFrame;
}

@end
