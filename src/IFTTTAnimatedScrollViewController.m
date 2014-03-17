//
//  IFTTTAnimatedScrollViewController.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimatedScrollViewController.h"

static inline CGFloat IFTTTMaxContentOffsetXForScrollView(UIScrollView *scrollView)
{
    return scrollView.contentSize.width + scrollView.contentInset.right - CGRectGetWidth(scrollView.bounds);
}

@interface IFTTTAnimatedScrollViewController ()

@property (nonatomic, assign) BOOL isAtEnd;

@end

@implementation IFTTTAnimatedScrollViewController

- (id)init
{
    if ((self = [super init])) {
        _isAtEnd = NO;
        self.animator = [IFTTTAnimator new];
    }
    
    return self;
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

    if (self.isAtEnd && [self.delegate respondsToSelector:@selector(animatedScrollViewControllerDidScrollToEnd:)]) {
        [self.delegate animatedScrollViewControllerDidScrollToEnd:self];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.isAtEnd && [self.delegate respondsToSelector:@selector(animatedScrollViewControllerDidEndDraggingAtEnd:)]) {
        [self.delegate animatedScrollViewControllerDidEndDraggingAtEnd:self];
    }
}

@end
