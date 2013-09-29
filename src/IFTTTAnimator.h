//
//  IFTTTAnimator.h
//  JazzHands
//
//  Created by Devin Foley on 9/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimation.h"

@interface IFTTTAnimator : NSObject

- (void)addAnimation:(IFTTTAnimation *)animation;
- (void)animate:(NSInteger)time;

@end
