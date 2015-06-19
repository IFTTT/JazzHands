//
//  IFTTTInterpolatableSpec.m
//  JazzHandsDemo
//
//  Created by Laura Skelton on 6/18/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#define EXP_SHORTHAND
#import <UIKit/UIKit.h>
#include <Specta/Specta.h>
#include <Expecta/Expecta.h>
#import <IFTTTJazzHands.h>

SpecBegin(IFTTTInterpolatable)

describe(@"IFTTTInterpolatable", ^{
    
    it(@"should interpolate floats", ^{
        CGFloat floatBetween = [NSNumber interpolateCGFloatFrom:1.f to:2.f withProgress:0.5f];
        expect(floatBetween).to.beCloseTo(1.5f);
    });
    
    it(@"should interpolate numbers", ^{
        NSNumber *numberBetween = [@(1) interpolateTo:@(2) withProgress:0.5f];
        expect([numberBetween floatValue]).to.beCloseTo(1.5f);
    });
    
    it(@"should interpolate bools", ^{
        NSNumber *boolBetween = [@(NO) interpolateTo:@(YES) withProgress:0.5f];
        expect([boolBetween boolValue]).to.beTruthy;
    });
    
    it(@"should interpolate CGPoints", ^{
        CGPoint pointBetween = [NSValue interpolateCGPointFrom:CGPointMake(1.f, 10.f) to:CGPointMake(2.f, 20.f) withProgress:0.5f];
        expect(CGPointEqualToPoint(pointBetween, CGPointMake(1.5f, 15.f))).to.beTruthy;
    });
    
    it(@"should interpolate CGSizes", ^{
        CGSize sizeBetween = [NSValue interpolateCGSizeFrom:CGSizeMake(1.f, 10.f) to:CGSizeMake(2.f, 20.f) withProgress:0.5f];
        expect(CGSizeEqualToSize(sizeBetween, CGSizeMake(1.5f, 15.f))).to.beTruthy;
    });
    
    it(@"should interpolate CGRects", ^{
        CGRect rectBetween = [NSValue interpolateCGRectFrom:CGRectMake(1.f, 10.f, 100.f, 1000.f) to:CGRectMake(2.f, 20.f, 200.f, 2000.f) withProgress:0.5f];
        expect(CGRectEqualToRect(rectBetween, CGRectMake(1.5f, 15.f, 150.f, 1500.f))).to.beTruthy;
    });
    
    it(@"should interpolate CGPoint values", ^{
        NSValue *valueBetween = [[NSValue valueWithCGPoint:CGPointMake(1.f, 10.f)] interpolateTo:[NSValue valueWithCGPoint:CGPointMake(2.f, 20.f)] withProgress:0.5f];
        expect(CGPointEqualToPoint(valueBetween.CGPointValue, CGPointMake(1.5f, 15.f))).to.beTruthy;
    });
    
    it(@"should interpolate CGSize values", ^{
        NSValue *valueBetween = [[NSValue valueWithCGSize:CGSizeMake(1.f, 10.f)] interpolateTo:[NSValue valueWithCGSize:CGSizeMake(2.f, 20.f)] withProgress:0.5f];
        expect(CGSizeEqualToSize(valueBetween.CGSizeValue, CGSizeMake(1.5f, 15.f))).to.beTruthy;
    });
    
    it(@"should interpolate CGRect values", ^{
        NSValue *valueBetween = [[NSValue valueWithCGRect:CGRectMake(1.f, 10.f, 100.f, 1000.f)] interpolateTo:[NSValue valueWithCGRect:CGRectMake(2.f, 20.f, 200.f, 2000.f)] withProgress:0.5f];
        expect(CGRectEqualToRect(valueBetween.CGRectValue, CGRectMake(1.5f, 15.f, 150.f, 1500.f))).to.beTruthy;
    });
    
});

SpecEnd
