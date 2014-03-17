//
//  IFTTTAnimatedScrollViewController.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimator.h"

@protocol IFTTTAnimatedScrollViewControllerDelegate;

@interface IFTTTAnimatedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) id <IFTTTAnimatedScrollViewControllerDelegate> delegate;

@property (nonatomic, strong) IFTTTAnimator *animator;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@protocol IFTTTAnimatedScrollViewControllerDelegate <NSObject>

@optional

- (void)animatedScrollViewControllerDidScrollToEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController;

- (void)animatedScrollViewControllerDidEndDraggingAtEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController;

@end
