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
    
    [self updatePageOffset];
}

- (NSUInteger)numberOfPages
{
    return 2;
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
    
    [self setPageOffset:self.pageOffset];
    [self animateCurrentFrame];
}

#pragma mark - iOS8+ Resizing

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
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

#pragma mark - Page Offset

- (void)setPageOffset:(CGFloat)pageOffset
{
    if (pageOffset < 0.f || pageOffset > (CGFloat) ([self numberOfPages] - 1)) {
        return;
    }
    
    _pageOffset = pageOffset;
    self.scrollView.contentOffset = CGPointMake(self.pageWidth * pageOffset, 0.f);
    [self animateCurrentFrame];
}

- (void)updatePageOffset
{
    if (self.pageWidth > 0.f) {
        CGFloat currentOffset = self.scrollView.contentOffset.x;
        currentOffset = currentOffset / self.pageWidth;
        _pageOffset = currentOffset;
    } else {
        _pageOffset = 0.f;
    }
}

#pragma mark - Scroll View

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self updatePageOffset];
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

#pragma mark - Keep View On Page Animations

- (void)keepView:(UIView *)view onPage:(CGFloat)page
{
    [self keepView:view onPage:page withAttribute:IFTTTHorizontalPositionAttributeCenterX];
}

- (void)keepView:(UIView *)view onPage:(CGFloat)page withAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    [self keepView:view onPage:page withAttribute:attribute offset:0.f];
}

- (void)keepView:(UIView *)view onPage:(CGFloat)page withAttribute:(IFTTTHorizontalPositionAttribute)attribute offset:(CGFloat)offset
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                 attribute:[self layoutAttributeFromPositionAttribute:attribute]
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:[self multiplierForPage:page withAttribute:attribute]
                                                                  constant:offset]];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages
{
    [self keepView:view onPages:pages atTimes:pages];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times
{
    [self keepView:view onPages:pages atTimes:times withAttribute:IFTTTHorizontalPositionAttributeCenterX];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages withAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    [self keepView:view onPages:pages atTimes:pages withAttribute:attribute];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times withAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    [self keepView:view onPages:pages atTimes:times withAttribute:attribute offset:0.f];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages withAttribute:(IFTTTHorizontalPositionAttribute)attribute offset:(CGFloat)offset
{
    [self keepView:view onPages:pages atTimes:pages withAttribute:attribute offset:offset];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times withAttribute:(IFTTTHorizontalPositionAttribute)attribute offset:(CGFloat)offset
{
    NSAssert((pages.count == times.count), @"Make sure you set a time for each position.");
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *xPositionConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:[self layoutAttributeFromPositionAttribute:attribute]
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.f
                                                                            constant:offset];
    [self.contentView addConstraint:xPositionConstraint];
    // TODO: set constraint type for animation initializer
    IFTTTScrollViewPageConstraintAnimation *xPositionAnimation = [IFTTTScrollViewPageConstraintAnimation animationWithSuperview:self.contentView
                                                                                                                     constraint:xPositionConstraint
                                                                                                                      pageWidth:self.pageWidth
                                                                                                                      attribute:attribute];
    
    for (NSUInteger i = 0; i < pages.count; i++) {
        [xPositionAnimation addKeyframeForTime:(CGFloat)[(NSNumber *)times[i] floatValue]
                                          page:(CGFloat)[(NSNumber *)pages[i] floatValue]];
    }
    
    [self.animator addAnimation:xPositionAnimation];
    [self.scrollViewPageConstraintAnimations addObject:xPositionAnimation];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages withAttribute:(IFTTTHorizontalPositionAttribute)attribute offsets:(NSArray *)offsets
{
    [self keepView:view onPages:pages atTimes:pages withOffsets:offsets withAttribute:attribute];
}

- (void)keepView:(UIView *)view onPages:(NSArray *)pages atTimes:(NSArray *)times withOffsets:(NSArray *)offsets withAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    NSAssert((pages.count == times.count) && (pages.count == offsets.count), @"Make sure you set a time and offset for each position.");
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *xPositionConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:[self layoutAttributeFromPositionAttribute:attribute]
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.f
                                                                            constant:0.f];
    [self.contentView addConstraint:xPositionConstraint];
    // TODO: set constraint type for animation initializer
    IFTTTScrollViewPageConstraintAnimation *xPositionAnimation = [IFTTTScrollViewPageConstraintAnimation animationWithSuperview:self.contentView
                                                                                                                     constraint:xPositionConstraint
                                                                                                                      pageWidth:self.pageWidth
                                                                                                                      attribute:attribute];
    
    for (NSUInteger i = 0; i < pages.count; i++) {
        [xPositionAnimation addKeyframeForTime:(CGFloat)[(NSNumber *)times[i] floatValue]
                                          page:(CGFloat)[(NSNumber *)pages[i] floatValue]
                                      constant:(CGFloat)[(NSNumber *)offsets[i] floatValue]];
    }
    
    [self.animator addAnimation:xPositionAnimation];
    [self.scrollViewPageConstraintAnimations addObject:xPositionAnimation];
}

- (CGFloat)centerXMultiplierForPage:(CGFloat)page
{
    return [self multiplierForPage:page withAttribute:IFTTTHorizontalPositionAttributeCenterX];
}

- (CGFloat)leftMultiplierForPage:(CGFloat)page
{
    return [self multiplierForPage:page withAttribute:IFTTTHorizontalPositionAttributeLeft];
}

- (CGFloat)rightMultiplierForPage:(CGFloat)page
{
    return [self multiplierForPage:page withAttribute:IFTTTHorizontalPositionAttributeRight];
}

- (CGFloat)multiplierForPage:(CGFloat)page withAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    CGFloat offset;
    
    switch (attribute) {
        case IFTTTHorizontalPositionAttributeCenterX:
            offset = 0.5;
            break;
        case IFTTTHorizontalPositionAttributeLeft:
            offset = 0;
            break;
        case IFTTTHorizontalPositionAttributeRight:
            offset = 1;
            break;
    }
    
    return 2.f * (offset + page) / self.numberOfPages;
}

- (NSLayoutAttribute)layoutAttributeFromPositionAttribute:(IFTTTHorizontalPositionAttribute)attribute
{
    NSLayoutAttribute layoutAttribute;
    switch (attribute) {
        case IFTTTHorizontalPositionAttributeCenterX:
            layoutAttribute = NSLayoutAttributeCenterX;
            break;
        case IFTTTHorizontalPositionAttributeLeft:
            layoutAttribute = NSLayoutAttributeLeft;
            break;
        case IFTTTHorizontalPositionAttributeRight:
            layoutAttribute = NSLayoutAttributeRight;
            break;
    }
    return layoutAttribute;
}

@end
