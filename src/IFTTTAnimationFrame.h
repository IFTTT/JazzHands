//
//  IFTTTAnimationFrame.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

@class IFTTTTransform3D;

@interface IFTTTAnimationFrame : NSObject

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, copy) UIColor *color;
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, strong) IFTTTTransform3D *transform;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat constraintConstant;

@end
