//
//  IFTTTAnimatedPagingScrollViewController.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IFTTTAnimator;

@interface IFTTTAnimatedPagingScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IFTTTAnimator *animator;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) NSUInteger numberOfPages;

- (CGFloat)pageWidth;
- (CGFloat)pageOffset;

- (void)animateCurrentFrame;
- (CGFloat)centerXMultiplierForPage:(CGFloat)page;

- (void)keepView:(UIView *)view onPage:(CGFloat)page;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times;

@end
