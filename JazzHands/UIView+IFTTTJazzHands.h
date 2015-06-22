//
//  UIView+IFTTTJazzHands.h
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (IFTTTJazzHands)

@property (nonatomic, strong) NSValue *iftttRotationTransform;
@property (nonatomic, strong) NSValue *iftttScaleTransform;
@property (nonatomic, strong) NSValue *iftttTranslationTransform;

@end
