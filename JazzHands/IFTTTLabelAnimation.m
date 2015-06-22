//
//  IFTTTLabelAnimation.m
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTLabelAnimation.h"

@interface IFTTTLabelAnimation ()

@property (nonatomic, strong, readwrite) UILabel *label;

@end

@implementation IFTTTLabelAnimation

- (instancetype)initWithLabel:(UILabel *)label
{
    if ((self = [super init])) {
        _label = label;
    }
    return self;
}

+ (instancetype)animationWithLabel:(UILabel *)label
{
    return [[self alloc] initWithLabel:label];
}

@end
