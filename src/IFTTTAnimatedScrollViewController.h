//
//  IFTTTAnimatedScrollViewController.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimator.h"

@interface IFTTTAnimatedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IFTTTAnimator *animator;
@property (strong, nonatomic) UIScrollView *scrollView;

@end
