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
    [self.animator animate:(NSInteger)aScrollView.contentOffset.x];
    
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
