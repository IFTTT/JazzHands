//
//  IFTTTAnimator.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimator.h"
#import "IFTTTAnimatable.h"

@interface IFTTTAnimator ()

@property (nonatomic, strong) NSMutableArray *animations;

@end

@implementation IFTTTAnimator

- (instancetype)init
{
    if ((self = [super init])) {
        self.animations = [NSMutableArray new];
    }
    return self;
}

- (void)animate:(CGFloat)time
{
    for (id<IFTTTAnimatable> animation in self.animations) {
        [animation animate:time];
    }
}

- (void)addAnimation:(id<IFTTTAnimatable>)animation
{
    [self.animations addObject:animation];
}

@end
