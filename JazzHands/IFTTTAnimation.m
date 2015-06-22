//
//  IFTTTAnimation.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"
#import "IFTTTFilmstrip.h"

@interface IFTTTAnimation ()

@property (nonatomic, strong) IFTTTFilmstrip *filmstrip;

@end

@implementation IFTTTAnimation

- (instancetype)init
{
    if ((self = [super init])) {
        _filmstrip = [IFTTTFilmstrip new];
    }
    return self;
}

- (void)addKeyframeForTime:(CGFloat)time value:(id<IFTTTInterpolatable>)value
{
    if (!value) return;
    [self.filmstrip setValue:value atTime:time];
}

- (void)addKeyframeForTime:(CGFloat)time value:(id<IFTTTInterpolatable>)value withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    if ((!value) || (!easingFunction)) return;
    [self.filmstrip setValue:value atTime:time withEasingFunction:easingFunction];
}

- (id<IFTTTInterpolatable>)valueAtTime:(CGFloat)time
{
    if (self.filmstrip.isEmpty) return nil;
    return [self.filmstrip valueAtTime:time];
}

- (BOOL)hasKeyframes
{
    return !self.filmstrip.isEmpty;
}

@end
