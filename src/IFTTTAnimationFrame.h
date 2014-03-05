//
//  IFTTTAnimationFrame.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

@class IFTTTTransform3D;

@interface IFTTTAnimationFrame : NSObject

@property (nonatomic) CGRect frame;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) BOOL hidden;
@property (nonatomic, retain) UIColor * color;
@property (nonatomic) CGFloat angle;
@property (nonatomic, retain) IFTTTTransform3D * transform;

@end
