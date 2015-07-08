//
//  IFTTTFilmstrip.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTFilmstrip.h"
#import "IFTTTInterpolatable.h"

#pragma mark - IFTTTKeyframe

@interface IFTTTKeyframe : NSObject

@property (nonatomic, assign) CGFloat time;
@property (nonatomic, strong) id<IFTTTInterpolatable> value;
@property (nonatomic, copy) IFTTTEasingFunction easingFunction;

- (instancetype)initWithTime:(CGFloat)time value:(id)value easingFunction:(IFTTTEasingFunction)easingFunction;

@end

@implementation IFTTTKeyframe

- (instancetype)initWithTime:(CGFloat)time value:(id)value easingFunction:(IFTTTEasingFunction)easingFunction
{
    if ((self = [super init])) {
        _time = time;
        _value = value;
        _easingFunction = easingFunction;
    }
    return self;
}

@end

#pragma mark - IFTTTFilmstrip

@interface IFTTTFilmstrip ()

@property (nonatomic, strong) NSMutableArray *keyframes;

@end

@implementation IFTTTFilmstrip

- (instancetype)init
{
    if ((self = [super init])) {
        _keyframes = [NSMutableArray array];
    }
    return self;
}

- (BOOL)isEmpty
{
    return (self.keyframes.count == 0);
}

- (void)setValue:(id<IFTTTInterpolatable>)value atTime:(CGFloat)time
{
    [self setValue:value atTime:time withEasingFunction:IFTTTEasingFunctionLinear];
}

- (void)setValue:(id<IFTTTInterpolatable>)value atTime:(CGFloat)time withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    NSAssert([self canInterpolateNewValue:value], @"New value must have the same interpolatable type as existing keyframe values.");
    
    IFTTTKeyframe *newKeyframe = [[IFTTTKeyframe alloc] initWithTime:time value:value easingFunction:easingFunction];
    NSUInteger indexAfter = [self indexOfKeyframeAfterTime:time];
    [self.keyframes insertObject:newKeyframe atIndex:indexAfter];
}

- (id<IFTTTInterpolatable>)valueAtTime:(CGFloat)time
{
    NSAssert(!self.isEmpty, @"At least one KeyFrame must be set before animation begins.");
    id value;
    NSUInteger indexAfter = [self indexOfKeyframeAfterTime:time];
    if (indexAfter == 0) {
        value = ((IFTTTKeyframe *)self.keyframes[0]).value;
    } else if (indexAfter < self.keyframes.count) {
        IFTTTKeyframe *keyframeBefore = (IFTTTKeyframe *)self.keyframes[indexAfter - 1];
        IFTTTKeyframe *keyframeAfter = (IFTTTKeyframe *)self.keyframes[indexAfter];
        CGFloat progress = [self progressFromTime:keyframeBefore.time toTime:keyframeAfter.time atTime:time withEasingFunction:keyframeBefore.easingFunction];
        value = [keyframeBefore.value interpolateTo:keyframeAfter.value withProgress:progress];
    } else {
        value = ((IFTTTKeyframe *)self.keyframes.lastObject).value;
    }
    return value;
}

- (NSUInteger)indexOfKeyframeAfterTime:(CGFloat)time
{
    for (NSUInteger i = 0; i < self.keyframes.count; i++) {
        IFTTTKeyframe *keyframe = (IFTTTKeyframe *)[self.keyframes objectAtIndex:i];
        if (time < keyframe.time) {
            return i;
        }
    }
    return self.keyframes.count;
}

- (CGFloat)progressFromTime:(CGFloat)fromTime toTime:(CGFloat)toTime atTime:(CGFloat)atTime withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    CGFloat duration = toTime - fromTime;
    if (duration == 0.f) return 0.f;
    CGFloat timeElapsed = atTime - fromTime;
    return easingFunction(timeElapsed / duration);
}

- (BOOL)canInterpolateNewValue:(id)newValue
{
    if (self.keyframes.count == 0) {
        return YES;
    }
    
    IFTTTKeyframe *existingKeyframe = (IFTTTKeyframe *)self.keyframes.firstObject;
    
    return ([newValue respondsToSelector:@selector(interpolateTo:withProgress:)]
            && ([newValue isKindOfClass:[existingKeyframe.value class]]
                || ([existingKeyframe.value isKindOfClass:[UIColor class]]
                    && [newValue isKindOfClass:[UIColor class]])));
}

@end
