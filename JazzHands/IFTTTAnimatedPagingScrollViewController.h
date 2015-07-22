//
//  IFTTTAnimatedPagingScrollViewController.h
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IFTTTScrollViewPageConstraintAnimation.h"
@class IFTTTAnimator;

@interface IFTTTAnimatedPagingScrollViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IFTTTAnimator *animator;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;

- (NSUInteger)numberOfPages;
- (CGFloat)pageWidth;
- (CGFloat)pageOffset;

- (void)animateCurrentFrame;
- (CGFloat)centerXMultiplierForPage:(CGFloat)page;
- (CGFloat)leftMultiplierForPage:(CGFloat)page;
- (CGFloat)rightMultiplierForPage:(CGFloat)page;
- (CGFloat)multiplierForPage:(CGFloat)page withAttribute:(IFTTTHorizontalPositionAttribute)attribute;

- (void)keepView:(UIView *)view onPage:(CGFloat)page;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times;
- (void)keepView:(UIView *)view onPage:(CGFloat)page withAttribute:(IFTTTHorizontalPositionAttribute)attribute;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages withAttribute:(IFTTTHorizontalPositionAttribute)attribute;
- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times withAttribute:(IFTTTHorizontalPositionAttribute)attribute;

@end
