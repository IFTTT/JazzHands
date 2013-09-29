//
//  IFTTTJazzHandsViewController.m
//  JazzHandsDemo
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHandsViewController.h"

#define NUMBER_OF_PAGES 4

#define timeForPage(page) (self.view.frame.size.width * (page - 1))
#define xForPage(page) timeForPage(page)

@interface IFTTTJazzHandsViewController ()

@property (strong, nonatomic) UIImageView *wordmark;
@property (strong, nonatomic) UIImageView *unicorn;
@property (strong, nonatomic) UILabel *lastLabel;

@end

@implementation IFTTTJazzHandsViewController
{

}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.scrollView.contentSize = CGSizeMake(
            NUMBER_OF_PAGES * self.view.frame.size.width,
            self.view.frame.size.height
        );
        
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        [self placeViews];
        [self configureAnimation];
    }
    
    return self;
}

- (void)placeViews
{
    // put a unicorn in the middle of page two, hidden
    self.unicorn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Unicorn"]];
    self.unicorn.center = self.view.center;
    self.unicorn.frame = CGRectOffset(
        self.unicorn.frame,
        self.view.frame.size.width,
        -100
    );
    self.unicorn.alpha = 0.0f;
    [self.scrollView addSubview:self.unicorn];

    // put a logo on top of it
    self.wordmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IFTTT"]];
    self.wordmark.center = self.view.center;
    self.wordmark.frame = CGRectOffset(
        self.wordmark.frame,
        self.view.frame.size.width,
        -100
    );
    [self.scrollView addSubview:self.wordmark];
    
    UILabel *firstPageText = [[UILabel alloc] init];
    firstPageText.text = @"Introducing Jazz Hands";
    [firstPageText sizeToFit];
    firstPageText.center = self.view.center;
    [self.scrollView addSubview:firstPageText];
    
    UILabel *secondPageText = [[UILabel alloc] init];
    secondPageText.text = @"Brought to you by IFTTT";
    [secondPageText sizeToFit];
    secondPageText.center = self.view.center;
    secondPageText.frame = CGRectOffset(secondPageText.frame, xForPage(2), 180);
    [self.scrollView addSubview:secondPageText];
    
    UILabel *thirdPageText = [[UILabel alloc] init];
    thirdPageText.text = @"Simple keyframe animations";
    [thirdPageText sizeToFit];
    thirdPageText.center = self.view.center;
    thirdPageText.frame = CGRectOffset(thirdPageText.frame, xForPage(3), -100);
    [self.scrollView addSubview:thirdPageText];
    
    UILabel *fourthPageText = [[UILabel alloc] init];
    fourthPageText.text = @"Optimized for scrolling intros";
    [fourthPageText sizeToFit];
    fourthPageText.center = self.view.center;
    fourthPageText.frame = CGRectOffset(fourthPageText.frame, xForPage(4), 0);
    [self.scrollView addSubview:fourthPageText];
    
    self.lastLabel = fourthPageText;
}

- (void)configureAnimation
{
    CGFloat dy = 240;

    // first, let's animate the wordmark
    IFTTTFrameAnimation *wordmarkFrameAnimation = [IFTTTFrameAnimation new];
    wordmarkFrameAnimation.view = self.wordmark;
    [self.animator addAnimation:wordmarkFrameAnimation];
    
    // move 200 pixels to the right for parallax effect
    [wordmarkFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(1)
                                                                            andFrame:CGRectOffset(self.wordmark.frame, 200, 0)]];
    
    // move to initial frame on page 2 for parallax effect
    [wordmarkFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(2)
                                                                            andFrame:self.wordmark.frame]];
    
    // move down and to the right between pages 2 and 3
    [wordmarkFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(3)
                                                                            andFrame:CGRectOffset(self.wordmark.frame, self.view.frame.size.width, dy)]];
    
    // move back to initial position on page 4 for parallax effect
    [wordmarkFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(4)
                                                                            andFrame:CGRectOffset(self.wordmark.frame, 0, dy)]];
    
    // now, we animate the unicorn
    IFTTTFrameAnimation *unicornFrameAnimation = [IFTTTFrameAnimation new];
    unicornFrameAnimation.view = self.unicorn;
    [self.animator addAnimation:unicornFrameAnimation];
    
    CGFloat ds = 50;

    // move down and to the right, and shrink between pages 2 and 3
    [unicornFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(2) andFrame:self.unicorn.frame]];
    [unicornFrameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(3)
                                                                           andFrame:CGRectOffset(CGRectInset(self.unicorn.frame, ds, ds), xForPage(2), dy)]];
    // fade the unicorn in on page 2 and out on page 4
    IFTTTAlphaAnimation *unicornAlphaAnimation = [IFTTTAlphaAnimation new];
    unicornAlphaAnimation.view = self.unicorn;
    [self.animator addAnimation:unicornAlphaAnimation];
    
    [unicornAlphaAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(1) andAlpha:0.0f]];
    [unicornAlphaAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(2) andAlpha:1.0f]];
    [unicornAlphaAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(3) andAlpha:1.0f]];
    [unicornAlphaAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:timeForPage(4) andAlpha:0.0f]];
    
    IFTTTHideAnimation *labelHideAnimation = [[IFTTTHideAnimation alloc] initWithView:self.lastLabel hideAt:timeForPage(4)];
    [self.animator addAnimation:labelHideAnimation];
}

@end
