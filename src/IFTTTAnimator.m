//
//  IFTTTAnimator.m
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimator.h"
#import "IFTTTAnimation.h"

@interface IFTTTAnimator ()

@property (nonatomic, strong) NSMutableArray *animations;

@end

@implementation IFTTTAnimator

- (id)init
{
    self = [super init];
    
    if (self) {
        self.animations = [NSMutableArray new];
    }
    
    return self;
}

- (void)animate:(NSInteger)time
{
    for (IFTTTAnimation *animation in self.animations) {
        [animation animate:time];
    }
}

- (void)addAnimation:(IFTTTAnimation *)animation
{
    [self.animations addObject:animation];
}

@end
