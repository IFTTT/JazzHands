//
//  IFTTTAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTAnimation ()

@property (strong, nonatomic) NSMutableArray *timeline; // IFTTTAnimationFrames
@property (assign, nonatomic) NSInteger startTime; // in case timeline starts before t=0

@end

@implementation IFTTTAnimation

+ (instancetype)animationWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

- (id)init
{
    if ((self = [super init])) {
        self.keyFrames = [NSMutableArray new];
        self.timeline = [NSMutableArray new];
        self.startTime = 0;
    }
    
    return self;
}

- (id)initWithView:(UIView *)view
{
    if ((self = [self init])) {
        self.view = view;
    }
    
    return self;
}

- (void)addKeyFrames:(NSArray *)keyFrames
{
    for (IFTTTAnimationKeyFrame *keyFrame in keyFrames) {
        [self addKeyFrame:keyFrame];
    }
}

- (void)addKeyFrame:(IFTTTAnimationKeyFrame *)keyFrame
{
    if (self.keyFrames.count == 0) {
        [self.keyFrames addObject:keyFrame];
        return;
    }

    // because folks might add keyframes out of order, we have to sort here
    if (keyFrame.time > ((IFTTTAnimationKeyFrame *)self.keyFrames.lastObject).time) {
        [self.keyFrames addObject:keyFrame];
    } else {
        for (NSUInteger i = 0; i < self.keyFrames.count; i++) {
            if (keyFrame.time < ((IFTTTAnimationKeyFrame *)[self.keyFrames objectAtIndex:i]).time) {
                [self.keyFrames insertObject:keyFrame atIndex:i];
                break;
            }
        }
    }
    
    self.timeline = [NSMutableArray new];
    for (NSUInteger i = 0; i < self.keyFrames.count - 1; i++) {
        IFTTTAnimationKeyFrame *currentKeyFrame = self.keyFrames[i];
        IFTTTAnimationKeyFrame *nextKeyFrame = self.keyFrames[i+1];
        
        for (NSInteger j = currentKeyFrame.time + (i == 0 ? 0 : 1); j <= nextKeyFrame.time; j++) {
            [self.timeline addObject:[self frameForTime:j
                                          startKeyFrame:currentKeyFrame
                                            endKeyFrame:nextKeyFrame]];
        }
    }
    
    self.startTime = ((IFTTTAnimationKeyFrame *)self.keyFrames[0]).time;
}

- (IFTTTAnimationFrame *)animationFrameForTime:(NSInteger)time
{
    if (time < self.startTime) {
        return [self.timeline objectAtIndex:0];
    }

    if (time - self.startTime < (NSInteger)self.timeline.count) {
        return [self.timeline objectAtIndex:(NSUInteger)(time - self.startTime)];
    }

    return [self.timeline lastObject];
}

- (void)animate:(NSInteger)time
{
    NSLog(@"Hey pal! You need to use a subclass of IFTTTAnimation.");
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    NSLog(@"Hey pal! You need to use a subclass of IFTTTAnimation.");
    return startKeyFrame;
}

- (CGFloat)tweenValueForStartTime:(NSInteger)startTime
                          endTime:(NSInteger)endTime
                       startValue:(CGFloat)startValue
                         endValue:(CGFloat)endValue
                           atTime:(CGFloat)time
{
    CGFloat dt = (endTime - startTime);
    CGFloat timePassed = (time - startTime);
    CGFloat dv = (endValue - startValue);
    CGFloat vv = dv / dt;
    return (timePassed * vv) + startValue;
}

@end
