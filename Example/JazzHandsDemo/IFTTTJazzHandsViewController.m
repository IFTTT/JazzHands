//
//  IFTTTJazzHandsViewController.m
//  JazzHandsDemo
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTJazzHandsViewController.h"
#import <Masonry/Masonry.h>
#import "IFTTTCircleView.h"

@interface IFTTTJazzHandsViewController ()

@property (nonatomic, strong) IFTTTCircleView *circle;
@property (nonatomic, strong) UIImageView *iftttPresents;
@property (nonatomic, strong) UIImageView *jazz;
@property (nonatomic, strong) UIImageView *hands;
@property (nonatomic, strong) UIImageView *blueStick;
@property (nonatomic, strong) UIImageView *orangeStick;

@property (nonatomic, strong) UIImageView *musicStand;
@property (nonatomic, strong) UIImageView *musicNotes;
@property (nonatomic, strong) UIImageView *plane;
@property (nonatomic, strong) CAShapeLayer *planePathLayer;
@property (nonatomic, strong) UIView *planePathView;

@property (nonatomic, strong) UIImageView *bigCloud;
@property (nonatomic, strong) UIImageView *littleCloud;
@property (nonatomic, strong) UIImageView *sun;
@property (nonatomic, strong) UIImageView *iftttCloud;

@property (nonatomic, strong) UIImageView *page2Text;
@property (nonatomic, strong) UIImageView *page3Text;

@property (nonatomic, strong) IFTTTPathPositionAnimation *airplaneFlyingAnimation;

@end

@implementation IFTTTJazzHandsViewController

- (NSUInteger)numberOfPages
{
    // Tell the scroll view how many pages it should have
    return 4;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configureViews];
    [self configureAnimations];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self scaleAirplanePathToSize:self.scrollView.frame.size];
}

#pragma mark - iOS8+ Resizing

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self scaleAirplanePathToSize:size];
    } completion:nil];
}

#pragma mark - iOS7 Orientation Change Resizing

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGSize newPageSize;
    
    if ((UIInterfaceOrientationIsLandscape(self.interfaceOrientation)
         && UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
        || (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)
            && UIInterfaceOrientationIsLandscape(toInterfaceOrientation))) {
            
            newPageSize = CGSizeMake(CGRectGetHeight(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame));
        } else {
            newPageSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        }

    [UIView animateWithDuration:duration animations:^{
        [self scaleAirplanePathToSize:newPageSize];
    } completion:nil];
}

#pragma mark - Configure Views and Animations

- (void)configureViews
{
    self.circle = [IFTTTCircleView new];
    [self.contentView addSubview:self.circle];
    
    self.iftttPresents = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IFTTTPresents"]];
    [self.contentView addSubview:self.iftttPresents];
    
    self.blueStick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueStick"]];
    [self.contentView addSubview:self.blueStick];
    
    self.orangeStick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OrangeStick"]];
    [self.contentView addSubview:self.orangeStick];
    
    self.jazz = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Jazz"]];
    [self.contentView addSubview:self.jazz];
    
    self.hands = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hands"]];
    [self.contentView addSubview:self.hands];
    
    self.planePathView = [UIView new];
    [self.contentView addSubview:self.planePathView];
    
    self.plane = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Plane"]];
    
    self.musicStand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MusicStand"]];
    [self.contentView addSubview:self.musicStand];
    
    self.musicNotes = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MusicNotes"]];
    [self.contentView addSubview:self.musicNotes];
    
    self.sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sun"]];
    [self.contentView addSubview:self.sun];

    self.bigCloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BigCloud"]];
    [self.contentView addSubview:self.bigCloud];
    
    self.littleCloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LittleCloud"]];
    [self.contentView addSubview:self.littleCloud];
    
    self.iftttCloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IFTTTCloud"]];
    [self.contentView addSubview:self.iftttCloud];

    self.page2Text = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Page2Text"]];
    [self.contentView addSubview:self.page2Text];

    self.page3Text = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Page3Text"]];
    [self.contentView addSubview:self.page3Text];
}

- (void)configureAnimations
{
    [self configureScrollViewAnimations];
    [self configureIFTTTPresentsAnimations];
    [self configureCircleAnimations];
    [self configureJazzHandsLabelAnimations];
    [self configureStickAnimations];
    [self configureMusicStandAnimations];
    [self configureAirplaneAnimations];
    [self configureCloudAnimations];
    [self configureSunAnimations];
    [self configurePageTextAnimations];
    [self animateCurrentFrame];
}

- (void)configureScrollViewAnimations
{
    // change the scrollView's background color from dark gray to blue just after page 1
    IFTTTBackgroundColorAnimation *backgroundColorAnimation = [IFTTTBackgroundColorAnimation animationWithView:self.scrollView];
    [backgroundColorAnimation addKeyframeForTime:1 color:[UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.f]];
    [backgroundColorAnimation addKeyframeForTime:1.1 color:[UIColor colorWithRed:0.14f green:0.8f blue:1.f alpha:1.f]];
    [self.animator addAnimation:backgroundColorAnimation];
}

- (void)configureIFTTTPresentsAnimations
{
    // Keep IFTTTPresents centered at the top of pages 0 and 1
    [self keepView:self.iftttPresents onPages:@[@(0), @(-1)] atTimes:@[@(0), @(1)]];
    [self.iftttPresents mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
    }];
}

- (void)configureCircleAnimations
{
    // lay out the circle with autolayout (no x-position constraint since we are using the keepView:onPage: method)
    [self.circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(self.scrollView);
        make.width.equalTo(self.scrollView).multipliedBy(0.9).with.priorityHigh();
        make.top.greaterThanOrEqualTo(self.scrollView).offset(60);
        make.height.equalTo(self.circle.mas_width);
        make.centerY.equalTo(self.contentView).multipliedBy(0.8);
    }];
    
    // keep the circle centered on pages 0 and 1
    [self keepView:self.circle onPages:@[@(0), @(1)]];
    
    // change the circle's color from gray to blue between pages 0 and 1
    IFTTTBackgroundColorAnimation *circleColorAnimation = [IFTTTBackgroundColorAnimation animationWithView:self.circle];
    [circleColorAnimation addKeyframeForTime:0 color:[UIColor colorWithRed:0.4f green:0.4f blue:0.4f alpha:1.f]];
    [circleColorAnimation addKeyframeForTime:1 color:[UIColor colorWithRed:0.14f green:0.8f blue:1.f alpha:1.f]];
    [self.animator addAnimation:circleColorAnimation];
    
    // grow the circle into the background between pages 0 and 1
    IFTTTScaleAnimation *circleScaleAnimation = [IFTTTScaleAnimation animationWithView:self.circle];
    [circleScaleAnimation addKeyframeForTime:0 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [circleScaleAnimation addKeyframeForTime:1 scale:6];
    [self.animator addAnimation:circleScaleAnimation];
    
    // hide the circle after page 1 (instead the background color will show)
    IFTTTHideAnimation *circleHideAnimation = [IFTTTHideAnimation animationWithView:self.circle hideAt:1.15];
    [self.animator addAnimation:circleHideAnimation];
}

- (void)configureJazzHandsLabelAnimations
{
    // lay out jazz and hands with autolayout (no x-position or y-position constraint since we are animating those separately)
    [self.jazz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.circle).multipliedBy(0.89);
        make.height.equalTo(self.jazz.mas_width).multipliedBy(186.f/607.f);
    }];
    
    [self.hands mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.jazz).multipliedBy(550.f / 607.f);
        make.height.equalTo(self.hands.mas_width).multipliedBy(244.f/550.f);
    }];
    
    NSLayoutConstraint *jazzVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.jazz
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.circle
                                                                              attribute:NSLayoutAttributeCenterY
                                                                             multiplier:1.f constant:0.f];
    NSLayoutConstraint *handsVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.hands
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.circle
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1.f constant:0.f];
    
    [self.contentView addConstraint:jazzVerticalConstraint];
    [self.contentView addConstraint:handsVerticalConstraint];
    
    // move JAZZ up between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *jazzVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                constraint:jazzVerticalConstraint
                                                                                                                 attribute:IFTTTLayoutAttributeHeight
                                                                                                             referenceView:self.circle];
    [jazzVerticalAnimation addKeyframeForTime:0 multiplier:-0.14f];
    [jazzVerticalAnimation addKeyframeForTime:1 multiplier:-0.64f];
    [self.animator addAnimation:jazzVerticalAnimation];
    
    // move HANDS down between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *handsVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                 constraint:handsVerticalConstraint
                                                                                                                  attribute:IFTTTLayoutAttributeHeight
                                                                                                              referenceView:self.circle];
    [handsVerticalAnimation addKeyframeForTime:0 multiplier:0.2f];
    [handsVerticalAnimation addKeyframeForTime:1 multiplier:0.72f];
    [self.animator addAnimation:handsVerticalAnimation];
    
    // keep JAZZ on page 0, a little to the right
    [self keepView:self.jazz onPages:@[@(0)] atTimes:@[@(0)]];
    
    // keep HANDS centered on page 0
    [self keepView:self.hands onPages:@[@(0)] atTimes:@[@(0)]];
    
    // Rotate Jazz 100 degrees counterclockwise between pages 0 and 1
    IFTTTRotationAnimation *jazzRotationAnimation = [IFTTTRotationAnimation animationWithView:self.jazz];
    [jazzRotationAnimation addKeyframeForTime:0 rotation:0];
    [jazzRotationAnimation addKeyframeForTime:1 rotation:100];
    [self.animator addAnimation:jazzRotationAnimation];
    
    // Rotate Hands 100 degrees clockwise between pages 0 and 1
    IFTTTRotationAnimation *handsRotationAnimation = [IFTTTRotationAnimation animationWithView:self.hands];
    [handsRotationAnimation addKeyframeForTime:0 rotation:0];
    [handsRotationAnimation addKeyframeForTime:1 rotation:-100];
    [self.animator addAnimation:handsRotationAnimation];
}

- (void)configureStickAnimations
{
    // lay out sticks with autolayout (no x-position or y-position constraint since we are animating those separately)
    [self.blueStick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.scrollView).multipliedBy(0.75);
        make.width.equalTo(self.blueStick.mas_height).multipliedBy(466.f/1002.f);
    }];
    
    [self.orangeStick mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.scrollView).multipliedBy(0.65);
        make.width.equalTo(self.orangeStick.mas_height).multipliedBy(234.f/866.f);
        make.centerY.equalTo(self.contentView).multipliedBy(1.1);
    }];
    
    // Keep the orange stick centered horizontally on page 0
    [self keepView:self.orangeStick onPage:0];
    
    NSLayoutConstraint *blueStickVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.blueStick
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.contentView
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.f constant:0.f];
    
    [self.contentView addConstraint:blueStickVerticalConstraint];
    
    // Keep the blue stick centered horizontally on pages 0 and 1
    [self keepView:self.blueStick onPages:@[@(0), @(1)]];
    
    // Animate the blue stick moving down off the screen between pages 0 and 1
    IFTTTConstraintMultiplierAnimation *blueStickVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                     constraint:blueStickVerticalConstraint
                                                                                                                      attribute:IFTTTLayoutAttributeCenterY
                                                                                                                  referenceView:self.contentView];
    [blueStickVerticalAnimation addKeyframeForTime:0 multiplier:1.1f];
    [blueStickVerticalAnimation addKeyframeForTime:1 multiplier:3.1f];
    [self.animator addAnimation:blueStickVerticalAnimation];
}

- (void)configureMusicStandAnimations
{
    // Keep the music stand aligned with the right edge of pages 1 and 2 (this takes care of the x-position autolayout constraint)
    [self keepView:self.musicStand onPages:@[@(1), @(2)] withAttribute:IFTTTHorizontalPositionAttributeRight];
    
    // Lay out the music stand using Autolayout (no x-position or y-position constraint since we are animating those separately)
    [self.musicStand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(self.scrollView);
        make.height.equalTo(self.musicStand.mas_width).multipliedBy(1184.f/750.f);
        make.height.lessThanOrEqualTo(self.scrollView).offset(-40);
    }];
    
    // Animate the music stand moving down off the screen between pages 1 and 2
    NSLayoutConstraint *musicStandVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.musicStand
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.contentView
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                   multiplier:1.f constant:0.f];
    
    [self.contentView addConstraint:musicStandVerticalConstraint];
    
    IFTTTConstraintMultiplierAnimation *musicStandVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                      constraint:musicStandVerticalConstraint
                                                                                                                       attribute:IFTTTLayoutAttributeHeight
                                                                                                                   referenceView:self.contentView];
    [musicStandVerticalAnimation addKeyframeForTime:1 multiplier:0.f withEasingFunction:IFTTTEasingFunctionEaseOutCubic];
    [musicStandVerticalAnimation addKeyframeForTime:2 multiplier:1.f];
    [self.animator addAnimation:musicStandVerticalAnimation];
    
    // Layout the music notes using Autolayout (no x-position constraint since we are using keepView:onPages: to set the horizontal position)
    [self.musicNotes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.and.height.and.width.equalTo(self.musicStand);
    }];
    
    // zoom the music notes over from the right between pages 0 and 1, then keep the music notes image aligned with the right edge of pages 1 and 2
    [self keepView:self.musicNotes onPages:@[@(2), @(1), @(2)] atTimes:@[@(0.5), @(1), @(2)] withAttribute:IFTTTHorizontalPositionAttributeRight];
}

- (void)configurePageTextAnimations
{
    // Use Autolayout to set the vertical position of the text (it has an inherent size)
    [self.page2Text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).multipliedBy(0.95);
    }];
    
    // Set the horizontal position to keep the text centered on page 2
    [self keepView:self.page2Text onPage:2];
    
    // Use Autolayout to set the vertical position of the text (it has an inherent size)
    [self.page3Text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
    }];
    
    // Set the horizontal position to keep the text centered on page 3
    [self keepView:self.page3Text onPage:3];
}

- (void)configureCloudAnimations
{
    // lay out big cloud with autolayout (no x-position or y-position constraint since we are animating those separately)
    [self.bigCloud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(self.scrollView).multipliedBy(0.78);
        make.height.lessThanOrEqualTo(self.scrollView).multipliedBy(0.2);
        make.height.equalTo(self.bigCloud.mas_width).multipliedBy(0.45);
    }];
    
    // keep the big cloud a bit to the righthand side of pages 1 and 2, then zoom it off to the left between pages 2 and 3
    [self keepView:self.bigCloud onPages:@[@(1.35), @(2.35), @(1.8)] atTimes:@[@(1), @(2), @(3)]];
    
    // Move the big cloud down from above the screen on page 1 to near the top of the screen on page 2
    NSLayoutConstraint *bigCloudVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.bigCloud
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.contentView
                                                                                  attribute:NSLayoutAttributeTop
                                                                                 multiplier:1.f constant:0.f];
    
    [self.contentView addConstraint:bigCloudVerticalConstraint];
    
    IFTTTConstraintMultiplierAnimation *bigCloudVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                    constraint:bigCloudVerticalConstraint
                                                                                                                     attribute:IFTTTLayoutAttributeHeight
                                                                                                                 referenceView:self.contentView];
    [bigCloudVerticalAnimation addKeyframeForTime:1 multiplier:-0.2f];
    [bigCloudVerticalAnimation addKeyframeForTime:2 multiplier:0.2f];
    [self.animator addAnimation:bigCloudVerticalAnimation];
    
    // Layout the little cloud using Autolayout (the x-position is set by keepView:onPages:atTimes:)
    [self.littleCloud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bigCloud.mas_top).offset(20);
        make.width.equalTo(self.bigCloud.mas_height);
        make.height.equalTo(self.littleCloud.mas_width).multipliedBy(0.5);
    }];
    
    // Keep the little cloud a bit to the left of pages 1 and 2
    [self keepView:self.littleCloud onPages:@[@(0.75), @(1.75)] atTimes:@[@(1), @(2)]];
    
    // Layout the vertical position of the IFTTT cloud using Autolayout (it has an inherent size)
    [self.iftttCloud mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView).multipliedBy(1.5);
    }];
    
    // Zoom in the IFTTT cloud from the right between pages 2 and 3
    [self keepView:self.iftttCloud onPages:@[@(3.5), @(3)] atTimes:@[@(2), @(3)]];
}

- (void)configureSunAnimations
{
    // Move the sun from the right side of page 2.5 to the left side of page 3
    [self keepView:self.sun onPages:@[@(2.8), @(2.6)] atTimes:@[@(2.5), @(3)]];
    
    // Animate the sun moving down from above the screen to near the top of the screen bewteen pages 2.5 and 3
    NSLayoutConstraint *sunVerticalConstraint = [NSLayoutConstraint constraintWithItem:self.sun
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.contentView
                                                                             attribute:NSLayoutAttributeTop
                                                                            multiplier:1.f constant:0.f];
    
    [self.contentView addConstraint:sunVerticalConstraint];
    
    IFTTTConstraintConstantAnimation *sunVerticalAnimation = [IFTTTConstraintConstantAnimation animationWithSuperview:self.contentView
                                                                                                           constraint:sunVerticalConstraint];
    [sunVerticalAnimation addKeyframeForTime:2 constant:-200.f];
    [sunVerticalAnimation addKeyframeForTime:3 constant:20.f];
    [self.animator addAnimation:sunVerticalAnimation];
}

- (void)configureAirplaneAnimations
{
    // Set up the view that contains the airplane view and its dashed line path view
    self.planePathLayer = [self airplanePathLayer];
    [self.planePathView.layer addSublayer:self.planePathLayer];
    
    [self.planePathView addSubview:self.plane];
    [self.plane mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.planePathView.mas_centerY);
        make.right.equalTo(self.planePathView.mas_centerX);
    }];
    
    [self.planePathView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.scrollView).offset(55);
        make.width.and.height.equalTo(self.plane);
    }];
    
    // Keep the left edge of the planePathView at the center of pages 1 and 2
    [self keepView:self.planePathView onPages:@[@(1.5), @(2.5)] atTimes:@[@(1), @(2)] withAttribute:IFTTTHorizontalPositionAttributeLeft];
    
    // Fly the plane along the path
    self.airplaneFlyingAnimation = [IFTTTPathPositionAnimation animationWithView:self.plane path:self.planePathLayer.path];
    [self.airplaneFlyingAnimation addKeyframeForTime:1 animationProgress:0];
    [self.airplaneFlyingAnimation addKeyframeForTime:2 animationProgress:1];
    [self.animator addAnimation:self.airplaneFlyingAnimation];
    
    // Change the stroke end of the dashed line airplane path to match the plane's current position
    IFTTTLayerStrokeEndAnimation *planePathAnimation = [IFTTTLayerStrokeEndAnimation animationWithLayer:self.planePathLayer];
    [planePathAnimation addKeyframeForTime:1 strokeEnd:0];
    [planePathAnimation addKeyframeForTime:2 strokeEnd:1];
    [self.animator addAnimation:planePathAnimation];
    
    // Fade the plane path view in after page 1 and fade it out again after page 2.5
    IFTTTAlphaAnimation *planeAlphaAnimation = [IFTTTAlphaAnimation animationWithView:self.planePathView];
    [planeAlphaAnimation addKeyframeForTime:1.06f alpha:0];
    [planeAlphaAnimation addKeyframeForTime:1.08f alpha:1];
    [planeAlphaAnimation addKeyframeForTime:2.5f alpha:1];
    [planeAlphaAnimation addKeyframeForTime:3.f alpha:0];
    [self.animator addAnimation:planeAlphaAnimation];
}

- (CGPathRef)airplanePath
{
    // Create a bezier path for the airplane to fly along
    UIBezierPath *airplanePath = [UIBezierPath bezierPath];
    [airplanePath moveToPoint: CGPointMake(120, 20)];
    [airplanePath addCurveToPoint: CGPointMake(40, -130) controlPoint1: CGPointMake(120, 20) controlPoint2: CGPointMake(140, -50)];
    [airplanePath addCurveToPoint: CGPointMake(30, -430) controlPoint1: CGPointMake(-60, -210) controlPoint2: CGPointMake(-320, -430)];
    [airplanePath addCurveToPoint: CGPointMake(-210, -190) controlPoint1: CGPointMake(320, -430) controlPoint2: CGPointMake(130, -190)];
    
    return airplanePath.CGPath;
}

- (CAShapeLayer *)airplanePathLayer
{
    // Create a shape layer to draw the airplane's path
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self airplanePath];
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.lineDashPattern = @[@(20), @(20)];
    shapeLayer.lineWidth = 4;
    shapeLayer.miterLimit = 4;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    
    return shapeLayer;
}

- (void)scaleAirplanePathToSize:(CGSize)pageSize
{
    // Scale the airplane path to the given page size
    CGSize scaleSize = CGSizeMake(pageSize.width / 375.f, pageSize.height / 667.f);
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scaleSize.width, scaleSize.height);
    
    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(self.airplanePath, &scaleTransform);
    
    self.planePathLayer.path = scaledPath;
    self.airplaneFlyingAnimation.path = scaledPath;
    CGPathRelease(scaledPath);
}

@end
