//
//  IFTTTAnimatedScrollViewController.m
//  JazzHands
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTAnimatedScrollViewController.h"

@implementation IFTTTAnimatedScrollViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.animator = [IFTTTAnimator new];
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        self.scrollView.delegate = self;
        [self.view addSubview:self.scrollView];
    }
    
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    [self.animator animate:aScrollView.contentOffset.x];
}

@end
