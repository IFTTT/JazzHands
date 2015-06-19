//
//  IFTTTAnimatedPagingScrollViewController.m
//  JazzHands
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimatedPagingScrollViewController.h"
#import "IFTTTAnimator.h"
#import "IFTTTScrollViewPageConstraintAnimation.h"

@interface IFTTTAnimatedPagingScrollViewController ()

@property (nonatomic, strong) NSMutableArray *scrollViewPageConstraintAnimations;

@end

@implementation IFTTTAnimatedPagingScrollViewController

- (instancetype)init
{
    if ((self = [super init])) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _scrollViewPageConstraintAnimations = [NSMutableArray array];
    _animator = [IFTTTAnimator new];
    _scrollView = [UIScrollView new];
    _contentView = [UIView new];
    _numberOfPages = 2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.scrollView addSubview:self.contentView];
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 views:@{ @"scrollView" : self.scrollView }]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 views:@{ @"scrollView" : self.scrollView }]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.f constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:(CGFloat)self.numberOfPages constant:0.f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    for (IFTTTScrollViewPageConstraintAnimation *animation in self.scrollViewPageConstraintAnimations) {
        animation.pageWidth = self.pageWidth;
    }
    
    [self animateCurrentFrame];
}

#pragma mark - iOS8+ Resizing

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    CGFloat newPageWidth = size.width;
    
    for (IFTTTScrollViewPageConstraintAnimation *animation in self.scrollViewPageConstraintAnimations) {
        animation.pageWidth = newPageWidth;
    }
    
    CGFloat futurePixelOffset = self.pageOffset * newPageWidth;
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self animateCurrentFrame];
        [self.scrollView setContentOffset:CGPointMake(futurePixelOffset, 0.f)];
    } completion:nil];
}

#pragma mark - iOS7 Orientation Change Resizing

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGFloat newPageWidth;
    
    if ((UIInterfaceOrientationIsLandscape(self.interfaceOrientation)
         && UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
        || (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)
            && UIInterfaceOrientationIsLandscape(toInterfaceOrientation))) {
            
            newPageWidth = CGRectGetHeight(self.scrollView.frame);
        } else {
            newPageWidth = CGRectGetWidth(self.scrollView.frame);
        }
    
    for (IFTTTScrollViewPageConstraintAnimation *animation in self.scrollViewPageConstraintAnimations) {
        animation.pageWidth = newPageWidth;
    }
    
    CGFloat futurePixelOffset = self.pageOffset * newPageWidth;

    [UIView animateWithDuration:duration animations:^{
        [self animateCurrentFrame];
        [self.scrollView setContentOffset:CGPointMake(futurePixelOffset, 0.f)];
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.1f
                         animations:^{
                             [self animateCurrentFrame];
                         }];
    }];
}

#pragma mark - Scroll View

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self animateCurrentFrame];
}

- (void)animateCurrentFrame
{
    [self.animator animate:self.pageOffset];
}

- (CGFloat)pageWidth
{
    return CGRectGetWidth(self.scrollView.frame);
}

- (CGFloat)pageOffset
{
    CGFloat currentOffset = self.scrollView.contentOffset.x;
    if (self.pageWidth > 0.f) {
        currentOffset = currentOffset / self.pageWidth;
    }
    return currentOffset;
}

- (CGFloat)centerXMultiplierForPage:(CGFloat)page
{
    return (1.f + (2.f * page)) / ((CGFloat)self.numberOfPages);
}

#pragma mark - Keep View On Page Animations

- (void)keepView:(UIView *)view onPage:(CGFloat)page
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:[self centerXMultiplierForPage:page]
                                                                  constant:0.f]];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages
{
    [self keepView:view onPages:pages atTimes:pages];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times
{
    NSAssert((pages.count == times.count), @"Make sure you set a time for each position.");
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
        
    NSLayoutConstraint *xPositionConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.f
                                                                            constant:0.f];
    [self.contentView addConstraint:xPositionConstraint];
    
    IFTTTScrollViewPageConstraintAnimation *xPositionAnimation = [IFTTTScrollViewPageConstraintAnimation animationWithSuperview:self.contentView
                                                                                                                     constraint:xPositionConstraint
                                                                                                                      pageWidth:self.pageWidth];
    
    for (NSUInteger i = 0; i < pages.count; i++) {
        [xPositionAnimation addKeyframeForTime:(CGFloat)[(NSNumber *)times[i] floatValue]
                                          page:(CGFloat)[(NSNumber *)pages[i] floatValue]];
    }
    
    [self.animator addAnimation:xPositionAnimation];
    [self.scrollViewPageConstraintAnimations addObject:xPositionAnimation];
}

@end
