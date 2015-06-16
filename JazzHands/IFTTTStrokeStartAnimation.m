//
//  IFTTTStrokeStartAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHands.h"

@implementation IFTTTStrokeStartAnimation

- (id)initWithLayer:(CALayer *)layer {
    NSCParameterAssert([layer isKindOfClass:CAShapeLayer.class]);
    return [super initWithLayer:layer];
}

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    ((CAShapeLayer *)self.layer).strokeStart = animationFrame.strokeStart;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.strokeStart = [self tweenValueForStartTime:startKeyFrame.time
                                                      endTime:endKeyFrame.time
                                                   startValue:startKeyFrame.strokeStart
                                                     endValue:endKeyFrame.strokeStart
                                                       atTime:time];
    
    return animationFrame;
}


@end
