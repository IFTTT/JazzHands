//
//  JazzHandsTests.m
//  JazzHandsTests
//
//  Created by Devin Foley on 9/27/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

@import XCTest;
#import <IFTTTJazzHands.h>
#import <FBSnapshotTestCase.h>
#import <KIF.h>

#import "IFTTTJazzHandsAppDelegate.h"
#import "IFTTTJazzHandsViewController.h"

@interface JazzHandsTests : FBSnapshotTestCase

@property (nonatomic, weak, readonly) IFTTTJazzHandsViewController *rootViewController;
@property (nonatomic, weak, readonly) UIScrollView *rootScrollView;

@end

@implementation JazzHandsTests
{
    IFTTTAnimator *animator;
}

#pragma mark - Test scaffolding

- (void)setUp
{
    [super setUp];

    animator = [IFTTTAnimator new];

    // Enable recording mode to record and save reference images for tests
//    self.recordMode = YES;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

CG_INLINE UIScrollView *IFTTTTestScrollView()
{
    IFTTTJazzHandsAppDelegate *delegate = (IFTTTJazzHandsAppDelegate *)[UIApplication sharedApplication].delegate;
    return ((IFTTTJazzHandsViewController *)delegate.window.rootViewController).scrollView;
}

- (void)IFTTTResetScrollOffset
{
    [tester swipeViewWithAccessibilityLabel:@"JazzHands" inDirection:KIFSwipeDirectionRight];
}

- (void)IFTTTScrollByPageOffset:(CGFloat)pageOffset
{
    CGFloat fullWidth = IFTTTTestScrollView().contentSize.width;
    CGFloat pageSize = CGRectGetWidth(IFTTTTestScrollView().bounds);

    pageSize *= pageOffset;

    CGFloat sizeFraction = pageSize / fullWidth;

    [tester scrollViewWithAccessibilityIdentifier:@"JazzHands" byFractionOfSizeHorizontal:-sizeFraction vertical:0];
}

#pragma mark - Logic tests

- (void)testInitializable
{
    XCTAssertNotNil(animator, @"Animator should be initializable");
}

#pragma mark - Dimensions tests

- (void)testPhone6DeviceDimensions
{
    // Note: screenshots are made for iPhone 6 Simulator which has
    // 2.0 screen scale and 320x568 dimensions.

    UIScrollView *scrollView = IFTTTTestScrollView();

    XCTAssert(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone, @"");
    XCTAssertEqualWithAccuracy([[UIScreen mainScreen] nativeScale], 2.0f, FLT_EPSILON, @"");
    XCTAssertEqualWithAccuracy(CGRectGetWidth(scrollView.frame), 320.0f, FLT_EPSILON, @"");
    XCTAssertEqualWithAccuracy(CGRectGetHeight(scrollView.frame), 568.0f, FLT_EPSILON, @"");
}

#pragma mark - Snapshot tests

- (void)testInitialScreenSnapshot
{
    [self IFTTTResetScrollOffset];
    FBSnapshotVerifyView(IFTTTTestScrollView().superview, nil);
}

- (void)testFirstPageSnapshot
{
    [self IFTTTResetScrollOffset];
    [self IFTTTScrollByPageOffset:1.f];
    FBSnapshotVerifyView(IFTTTTestScrollView().superview, nil);
}

- (void)testSecondPageSnapshot
{
    [self IFTTTResetScrollOffset];
    [self IFTTTScrollByPageOffset:1.f];
    [self IFTTTScrollByPageOffset:1.f];
    FBSnapshotVerifyView(IFTTTTestScrollView().superview, nil);
}

- (void)testThirdPageSnapshot
{
    [self IFTTTResetScrollOffset];
    [self IFTTTScrollByPageOffset:1.f];
    [self IFTTTScrollByPageOffset:1.f];
    [self IFTTTScrollByPageOffset:1.f];
    FBSnapshotVerifyView(IFTTTTestScrollView().superview, nil);
}

@end
