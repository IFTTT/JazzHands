//
//  IFTTTCircleView.m
//  JazzHandsDemo
//
//  Created by Laura Skelton on 6/25/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTCircleView.h"

@interface IFTTTCircleView ()

@property (nonatomic, strong) CAShapeLayer *maskLayer;

@end

@implementation IFTTTCircleView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!self.maskLayer) {
        self.maskLayer = [CAShapeLayer layer];
        self.layer.mask = self.maskLayer;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CGRectGetWidth(self.bounds) / 2.f];
    self.maskLayer.path = path.CGPath;
    
    self.layer.cornerRadius = CGRectGetWidth(self.layer.bounds) / 2.f;
}


@end
