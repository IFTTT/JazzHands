//
//  IFTTTAnimatedScrollViewController.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHands.h"

CG_INLINE CGFloat IFTTTMaxContentOffsetXForScrollView(UIScrollView *scrollView)
{
    return scrollView.contentSize.width + scrollView.contentInset.right - CGRectGetWidth(scrollView.bounds);
}

@interface IFTTTAnimatedScrollViewController ()

@property (nonatomic, assign) BOOL isAtEnd;

@end

@implementation IFTTTAnimatedScrollViewController

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

- (void) commonInit {
    _isAtEnd = NO;
    self.animator = [IFTTTAnimator new];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    [self.animator animate:aScrollView.contentOffset.x];
    
    self.isAtEnd = (aScrollView.contentOffset.x >= IFTTTMaxContentOffsetXForScrollView(aScrollView));
    
    id delegate = self.delegate;

    if (self.isAtEnd && [delegate respondsToSelector:@selector(animatedScrollViewControllerDidScrollToEnd:)]) {
        [delegate animatedScrollViewControllerDidScrollToEnd:self];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    id delegate = self.delegate;
    
    if (self.isAtEnd && [delegate respondsToSelector:@selector(animatedScrollViewControllerDidEndDraggingAtEnd:)]) {
        [delegate animatedScrollViewControllerDidEndDraggingAtEnd:self];
    }
}

@end
