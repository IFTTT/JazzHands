//
//  IFTTTAnimationKeyFrame.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimationKeyFrame.h"

@implementation IFTTTAnimationKeyFrame

+ (NSArray *)keyFramesWithTimesAndAlphas:(NSInteger)pairCount,...
{
    va_list argumentList;
    NSInteger time;
    CGFloat alpha;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            alpha = (CGFloat)va_arg(argumentList, double);   // use double to suppress a va_arg conversion warning
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                               andAlpha:alpha];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    }
    else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndFrames:(NSInteger)pairCount,...
{
    va_list argumentList;
    NSInteger time;
    CGRect frame;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            frame = va_arg(argumentList, CGRect);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                               andFrame:frame];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    }
    else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndHiddens:(NSInteger)pairCount,...
{
    va_list argumentList;
    NSInteger time;
    BOOL hidden;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            hidden = (BOOL)va_arg(argumentList, int); // use int to suppress a va_arg conversion warning
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                              andHidden:hidden];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    }
    else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndColors:(NSInteger)pairCount,...
{
    va_list argumentList;
    NSInteger time;
    UIColor *color;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            color = va_arg(argumentList, id);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                               andColor:color];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    }
    else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndAngles:(NSInteger)pairCount, ... {
    va_list argumentList;
    NSInteger time;
    CGFloat angle;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            angle = (CGFloat)va_arg(argumentList, double);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                               andAngle:angle];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    }
    else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndTransform3D:(NSInteger)pairCount, ...{
    va_list argumentList;
    NSInteger time;
    IFTTTTransform3D * transform;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            transform = va_arg(argumentList, id);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                         andTransform3D:transform];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    } else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndScales:(NSInteger)pairCount, ... {
    va_list argumentList;
    NSInteger time;
    CGFloat scale;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];

        va_start(argumentList, pairCount);

        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            scale = (CGFloat)va_arg(argumentList, double);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime: time
                                                                               andScale: scale];
            [keyFrames addObject:keyFrame];
        }

        va_end(argumentList);

        return [NSArray arrayWithArray:keyFrames];
    } else {
        return nil;
    }
}

+ (NSArray *)keyFramesWithTimesAndConstraint:(NSInteger)pairCount, ... {
    va_list argumentList;
    NSInteger time;
    CGFloat constraint;
    if (pairCount > 0) {
        NSMutableArray *keyFrames = [NSMutableArray arrayWithCapacity:(NSUInteger)pairCount];
        
        va_start(argumentList, pairCount);
        
        for (int i=0; i<pairCount; i++) {
            time = va_arg(argumentList, NSInteger);
            constraint = (CGFloat)va_arg(argumentList, double);
            IFTTTAnimationKeyFrame *keyFrame = [IFTTTAnimationKeyFrame keyFrameWithTime:time
                                                                          andConstraint:constraint];
            [keyFrames addObject:keyFrame];
        }
        
        va_end(argumentList);
        
        return [NSArray arrayWithArray:keyFrames];
    } else {
        return nil;
    }
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andAlpha:(CGFloat)alpha
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                         andAlpha:alpha];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andFrame:(CGRect)frame
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                         andFrame:frame];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andHidden:(BOOL)hidden
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                        andHidden:hidden];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andColor:(UIColor*)color
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                         andColor:color];
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andAngle:(CGFloat)angle
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                         andAngle:angle];
    
    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andTransform3D:(IFTTTTransform3D *)transform
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                   andTransform3D:transform];

    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andScale:(CGFloat)scale
{
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                         andScale:scale];

    return keyFrame;
}

+ (instancetype)keyFrameWithTime:(NSInteger)time andConstraint:(CGFloat)constraint {
    IFTTTAnimationKeyFrame *keyFrame = [[self alloc] initWithTime:time
                                                    andConstraint:constraint];
    
    return keyFrame;
}

- (id)initWithTime:(NSInteger)time
{
    self = [super init];
    
    if (self) {
        self.time = time;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andAlpha:(CGFloat)alpha
{
    self = [self initWithTime:time];
    
    if (self) {
        self.alpha = alpha;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andFrame:(CGRect)frame
{
    self = [self initWithTime:time];
    
    if (self) {
        self.frame = frame;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andHidden:(BOOL)hidden
{
    self = [self initWithTime:time];
    
    if (self) {
        self.hidden = hidden;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andColor:(UIColor*)color
{
    self = [self initWithTime:time];
    
    if (self) {
        self.color = color;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andAngle:(CGFloat)angle
{
    self = [self initWithTime:time];
    
    if (self) {
        self.angle = angle;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andTransform3D:(IFTTTTransform3D *)transform
{
    self = [self initWithTime:time];
    
    if (self) {
        self.transform = transform;
    }
    
    return self;
}

- (id)initWithTime:(NSInteger)time andScale:(CGFloat)scale {
    self = [self initWithTime:time];

    if (self) {
        self.scale = scale;
    }

    return self;
}

- (id)initWithTime:(NSInteger)time andConstraint:(CGFloat)constraint {
    self = [self initWithTime:time];
    
    if (self) {
        self.constraintConstant = constraint;
    }
    
    return self;
}

@end
