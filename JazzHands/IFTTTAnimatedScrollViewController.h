//
//  IFTTTAnimatedScrollViewController.h
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IFTTTAnimator;

@protocol IFTTTAnimatedScrollViewControllerDelegate;

@interface IFTTTAnimatedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) id <IFTTTAnimatedScrollViewControllerDelegate> delegate;

@property (nonatomic, strong) IFTTTAnimator *animator;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@protocol IFTTTAnimatedScrollViewControllerDelegate <NSObject>

@optional

/**
 *  The user has scrolled to the last page of the scrollview.
 *
 *  @param animatedScrollViewController the scroll view controller that's been scrolled
 */
- (void)animatedScrollViewControllerDidScrollToEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController;

/**
 *  The user has released the scrollview (ended dragging) at the last page of the scrollview.
 *
 *  @param animatedScrollViewController the scroll view controller that's been scrolled
 */
- (void)animatedScrollViewControllerDidEndDraggingAtEnd:(IFTTTAnimatedScrollViewController *)animatedScrollViewController;

@end
