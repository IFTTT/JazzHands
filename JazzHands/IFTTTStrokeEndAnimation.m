//
//  IFTTTStrokeEndAnimation.m
//  JazzHands
//
//  Created by Pierluigi D'Andrea on 06/05/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHands.h"

@implementation IFTTTStrokeEndAnimation

- (id)initWithLayer:(CALayer *)layer {
    NSCAssert([self.layer isKindOfClass:CAShapeLayer.class], @"strokeEnd is a CAShapeLayer property");
    return [super initWithLayer:layer];
}

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    ((CAShapeLayer *)self.layer).strokeEnd = animationFrame.strokeEnd;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.strokeEnd = [self tweenValueForStartTime:startKeyFrame.time
                                                    endTime:endKeyFrame.time
                                                 startValue:startKeyFrame.strokeEnd
                                                   endValue:endKeyFrame.strokeEnd
                                                     atTime:time];
    
    return animationFrame;
}


@end
