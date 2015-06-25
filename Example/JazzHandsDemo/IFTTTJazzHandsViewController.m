//
//  IFTTTJazzHandsViewController.m
//  JazzHandsDemo
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHandsViewController.h"
#import "MyCustomAnimation.h"

@interface IFTTTJazzHandsViewController ()

@property (nonatomic, strong) UIImageView *wordmark;
@property (nonatomic, strong) UIImageView *unicorn;
@property (nonatomic, strong) UIImageView *heart;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UILabel *thirdLabel;
@property (nonatomic, strong) UILabel *fourthLabel;

@end

@implementation IFTTTJazzHandsViewController

- (instancetype)init
{
    if ((self = [super init])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.numberOfPages = 4;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.accessibilityLabel = @"JazzHands";
    self.scrollView.accessibilityIdentifier = @"JazzHands";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureViews];
    [self configureAnimations];
}

- (void)configureViews
{
    self.unicorn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Unicorn"]];
    [self.contentView addSubview:self.unicorn];

    self.wordmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IFTTT"]];
    [self.contentView addSubview:self.wordmark];
    
    self.heart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Heart"]];
    [self.contentView addSubview:self.heart];
    
    self.firstLabel = [UILabel new];
    self.firstLabel.text = @"Introducing Jazz Hands";
    [self.firstLabel sizeToFit];
    [self.contentView addSubview:self.firstLabel];
    
    self.secondLabel = [UILabel new];
    self.secondLabel.text = @"Brought to you by IFTTT";
    [self.secondLabel sizeToFit];
    [self.contentView addSubview:self.secondLabel];
    
    self.thirdLabel = [UILabel new];
    self.thirdLabel.text = @"Simple keyframe animations";
    [self.thirdLabel sizeToFit];
    [self.contentView addSubview:self.thirdLabel];
    
    self.fourthLabel = [UILabel new];
    self.fourthLabel.text = @"Optimized for scrolling intros";
    [self.fourthLabel sizeToFit];
    [self.contentView addSubview:self.fourthLabel];
}

- (void)configureAnimations
{
    [self configureScrollViewAnimations];
    [self configureUnicornAnimations];
    [self configureWordmarkAnimations];
    [self configureHeartAnimations];
    [self configureLabelAnimations];
    [self animateCurrentFrame];
}

- (void)configureScrollViewAnimations
{
    // change the scrollView's background color for each page
    IFTTTColorAnimation *backgroundColorAnimation = [IFTTTColorAnimation animationWithView:self.scrollView];
    [backgroundColorAnimation addKeyframeForTime:0 color:[[UIColor blueColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:1 color:[[UIColor cyanColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:2 color:[[UIColor greenColor] colorWithAlphaComponent:0.4f]];
    [backgroundColorAnimation addKeyframeForTime:3 color:[[UIColor yellowColor] colorWithAlphaComponent:0.4f]];
    [self.animator addAnimation:backgroundColorAnimation];
}

- (void)configureUnicornAnimations
{
    // now, we animate the unicorn
    // keep the unicorn centered when we're on pages 1 and 2.
    // It will slide from the right between pages 0 and 1, and slide out to the left between pages 2 and 3.
    [self keepView:self.unicorn onPages:@[ @(1), @(2) ]];
    
    NSLayoutConstraint *unicornCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.unicorn
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.contentView
                                                                                attribute:NSLayoutAttributeCenterY
                                                                               multiplier:1.f constant:0.f];
    [self.contentView addConstraint:unicornCenterYConstraint];
    
    // Move the unicorn from a bit higher than center on page 1 to a bit lower on page 2, by an amount relative to the height of the view.
    IFTTTConstraintMultiplierAnimation *unicornCenterYAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                  constraint:unicornCenterYConstraint
                                                                                                                   attribute:IFTTTLayoutAttributeHeight
                                                                                                               referenceView:self.contentView];
    [unicornCenterYAnimation addKeyframeForTime:1 multiplier:-0.1f withEasingFunction:IFTTTEasingFunctionEaseOutQuad];
    [unicornCenterYAnimation addKeyframeForTime:2 multiplier:0.2f];
    [self.animator addAnimation:unicornCenterYAnimation];
    
    // Scale down the unicorn by 75% between pages 1 and 2
    IFTTTScaleAnimation *unicornScaleAnimation = [IFTTTScaleAnimation animationWithView:self.unicorn];
    [unicornScaleAnimation addKeyframeForTime:1 scale:1.f];
    [unicornScaleAnimation addKeyframeForTime:2 scale:0.75f];
    [self.animator addAnimation:unicornScaleAnimation];
    
    // fade the unicorn in on page 1 and out on page 3
    IFTTTAlphaAnimation *unicornAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.unicorn];
    [unicornAlphaAnimation addKeyframeForTime:0 alpha:0.f];
    [unicornAlphaAnimation addKeyframeForTime:1 alpha:1.f];
    [unicornAlphaAnimation addKeyframeForTime:2 alpha:1.f];
    [unicornAlphaAnimation addKeyframeForTime:3 alpha:0.f];
    [self.animator addAnimation:unicornAlphaAnimation];
}

- (void)configureWordmarkAnimations
{
    // let's animate the wordmark
    // keep the wordmark centered on pages 1 and 2, slide it in fast from the right between page 0 and 1, and slide it out fast to the left between pages 2 and 3.
    [self keepView:self.wordmark
           onPages:@[ @(2), @(1), @(2), @(1) ]
           atTimes:@[ @(0), @(1), @(2), @(3) ]];
    
    // keep the wordmark vertically centered on top of the unicorn
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.wordmark
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.unicorn
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.f constant:0.f]];
    
    // Rotate the wordmark a full circle from page 1 to 2
    IFTTTRotationAnimation *wordmarkRotationAnimation = [IFTTTRotationAnimation animationWithView:self.wordmark];
    [wordmarkRotationAnimation addKeyframeForTime:1 rotation:0.f];
    [wordmarkRotationAnimation addKeyframeForTime:2 rotation:360.f];
    [self.animator addAnimation:wordmarkRotationAnimation];
    
    // Scale down the wordmark by 75% between pages 1 and 2
    IFTTTScaleAnimation *wordmarkScaleAnimation = [IFTTTScaleAnimation animationWithView:self.wordmark];
    [wordmarkScaleAnimation addKeyframeForTime:1 scale:1.f];
    [wordmarkScaleAnimation addKeyframeForTime:2 scale:0.75f];
    [self.animator addAnimation:wordmarkScaleAnimation];
}

- (void)configureHeartAnimations
{
    // let's animate the heart
    // keep the heart on page 3
    [self keepView:self.heart onPage:3];
    
    // keep the heart vertically centered around the fourth label
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.heart
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.fourthLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.heart
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:0
                                                                multiplier:1.f constant:80.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.heart
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:0
                                                                multiplier:1.f constant:80.f]];
    
    // orbit the heart in a circle around the label using a CAKeyframeAnimation
    CGRect boundingRect = CGRectMake(-80, -80, 160, 160);
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 1;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    [self.heart.layer addAnimation:orbit forKey:@"orbit"];
    
    IFTTTViewBasicAnimation *heartOrbitAnimation = [IFTTTViewBasicAnimation animationWithView:self.heart];
    [heartOrbitAnimation addKeyframeForTime:2 animationProgress:0];
    [heartOrbitAnimation addKeyframeForTime:3 animationProgress:0.75f];
    [self.animator addAnimation:heartOrbitAnimation];
}

- (void)configureLabelAnimations
{
    // lay out labels' vertical positions
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.firstLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.secondLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.5f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.thirdLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:0.5f constant:0.f]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.fourthLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.f constant:0.f]];
    
    // lay out the labels' horizontal positions (centered on each page)
    [self keepView:self.firstLabel onPage:0];
    [self keepView:self.secondLabel onPage:1];
    [self keepView:self.thirdLabel onPage:2];
    [self keepView:self.fourthLabel onPage:3];
    
    // apply a 3D zoom animation to the first label
    IFTTTTransform3DAnimation * labelTransform = [IFTTTTransform3DAnimation animationWithView:self.firstLabel];
    IFTTTTransform3D *tt1 = [IFTTTTransform3D transformWithM34:0.03f];
    IFTTTTransform3D *tt2 = [IFTTTTransform3D transformWithM34:0.3f];
    tt2.rotate = (IFTTTTransform3DRotate){ -(CGFloat)(M_PI), 1, 0, 0 };
    tt2.translate = (IFTTTTransform3DTranslate){ 0, 0, 50 };
    tt2.scale = (IFTTTTransform3DScale){ 1.f, 2.f, 1.f };
    [labelTransform addKeyframeForTime:0 transform:tt1];
    [labelTransform addKeyframeForTime:0.5f transform:tt2];
    [self.animator addAnimation:labelTransform];
    
    // fade out the first label
    IFTTTAlphaAnimation *firstLabelAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.firstLabel];
    [firstLabelAlphaAnimation addKeyframeForTime:0 alpha:1.f];
    [firstLabelAlphaAnimation addKeyframeForTime:0.35f alpha:0.f];
    [self.animator addAnimation:firstLabelAlphaAnimation];
    
    // custom animate the third label
    MyCustomAnimation *thirdLabelAnimation = [MyCustomAnimation animationWithView:self.thirdLabel];
    [thirdLabelAnimation addKeyframeForTime:1.5f shadowOpacity:0.f];
    [thirdLabelAnimation addKeyframeForTime:2 shadowOpacity:1.f];
    [thirdLabelAnimation addKeyframeForTime:2.5f shadowOpacity:0.f];
    [self.animator addAnimation:thirdLabelAnimation];
    
    self.thirdLabel.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.thirdLabel.layer.shadowRadius = 1.f;
    self.thirdLabel.layer.shadowOffset = CGSizeMake(1.f, 1.f);
    
    // Fade out the last label by dragging on the last page
    IFTTTAlphaAnimation *lastLabelAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.fourthLabel];
    [lastLabelAlphaAnimation addKeyframeForTime:3 alpha:1.f];
    [lastLabelAlphaAnimation addKeyframeForTime:3.35f alpha:0.f];
    [self.animator addAnimation:lastLabelAlphaAnimation];
}

@end
