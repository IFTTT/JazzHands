//
//  IFTTTViewAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

@interface IFTTTViewAnimation ()

@property (nonatomic, strong, readwrite) UIView *view;

@end

@implementation IFTTTViewAnimation

- (instancetype)initWithView:(UIView *)view
{
    if ((self = [super init])) {
        _view = view;
    }
    return self;
}

+ (instancetype)animationWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

@end
