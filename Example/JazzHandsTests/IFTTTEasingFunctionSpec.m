//
//  IFTTTEasingFunctionSpec.m
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

SpecBegin(IFTTTEasingFunction)

describe(@"IFTTTEasingFunction", ^{

    describe(@"IFTTTEasingFunctionLinear", ^{
        it(@"should return t", ^{
            expect(IFTTTEasingFunctionLinear(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionLinear(0.5f)).to.beCloseTo(0.5f);
            expect(IFTTTEasingFunctionLinear(0.25f)).to.beCloseTo(0.25f);
            expect(IFTTTEasingFunctionLinear(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseInQuad", ^{
        it(@"should return t * t", ^{
            expect(IFTTTEasingFunctionEaseInQuad(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseInQuad(0.5f)).to.beCloseTo(0.25f);
            expect(IFTTTEasingFunctionEaseInQuad(0.25f)).to.beCloseTo(0.0625f);
            expect(IFTTTEasingFunctionEaseInQuad(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseOutQuad", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseOutQuad(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseOutQuad(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseOutQuad(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseOutQuad(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseInOutQuad", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseInOutQuad(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseInOutQuad(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseInOutQuad(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseInOutQuad(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseInCubic", ^{
        it(@"should return t * t * t", ^{
            expect(IFTTTEasingFunctionEaseInCubic(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseInCubic(0.5f)).to.beCloseTo(0.125f);
            expect(IFTTTEasingFunctionEaseInCubic(0.25f)).to.beCloseTo(0.015625f);
            expect(IFTTTEasingFunctionEaseInCubic(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseOutCubic", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseOutCubic(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseOutCubic(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseOutCubic(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseOutCubic(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseInOutCubic", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseInOutCubic(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseInOutCubic(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseInOutCubic(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseInOutCubic(0.f)).to.beCloseTo(0.f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseInBounce", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseInBounce(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseInBounce(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseInBounce(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseInBounce(0.f)).to.beCloseToWithin(0.f, 0.1f);
        });
    });
    
    describe(@"IFTTTEasingFunctionEaseOutBounce", ^{
        it(@"should return between 0 and 1", ^{
            expect(IFTTTEasingFunctionEaseOutBounce(1.f)).to.beCloseTo(1.f);
            expect(IFTTTEasingFunctionEaseOutBounce(0.5f)).to.beLessThan(1.f);
            expect(IFTTTEasingFunctionEaseOutBounce(0.5f)).to.beGreaterThan(0.f);
            expect(IFTTTEasingFunctionEaseOutBounce(0.f)).to.beCloseTo(0.f);
        });
    });
    
});

SpecEnd
