//
//  IFTTTAnimator.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

@protocol IFTTTAnimatable;

@interface IFTTTAnimator : NSObject

- (void)addAnimation:(id<IFTTTAnimatable>)animation;
- (void)animate:(CGFloat)time;

@end
