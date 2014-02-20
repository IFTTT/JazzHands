//
//  IFTTTAnimatedScrollViewController.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimatedScrollViewController.h"

@interface IFTTTAnimatedScrollViewController () {
    BOOL _isAtEnd;
}

@end

@implementation IFTTTAnimatedScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.animator = [IFTTTAnimator new];
    }
    
    return self;
}

- (void)viewDidLoad {
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
}

- (CGFloat)maxContentOffsetXForScrollView:(UIScrollView *)scrollView {
    return scrollView.contentSize.width + scrollView.contentInset.right - scrollView.bounds.size.width;
}

- (void)updateValueOfAtEndWithScrollView:(UIScrollView *)scrollView {
    _isAtEnd = scrollView.contentOffset.x >= [self maxContentOffsetXForScrollView:scrollView] ? YES : NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    [self.animator animate:aScrollView.contentOffset.x];

    [self updateValueOfAtEndWithScrollView:aScrollView];

    if (_isAtEnd) {
        [self notifyDidScrollToEnd];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_isAtEnd) {
        [self notifyDidEndDraggingAtEnd];
    }
}

- (void)notifyDidScrollToEnd
{
    if ([self.delegate respondsToSelector:@selector(animatedScrollViewControllerDidScrollToEnd:)]) {
        [self.delegate animatedScrollViewControllerDidScrollToEnd:self];
    }
}

- (void)notifyDidEndDraggingAtEnd
{
    if ([self.delegate respondsToSelector:@selector(animatedScrollViewControllerDidEndDraggingAtEnd:)]) {
        [self.delegate animatedScrollViewControllerDidEndDraggingAtEnd:self];
    }
}

@end
