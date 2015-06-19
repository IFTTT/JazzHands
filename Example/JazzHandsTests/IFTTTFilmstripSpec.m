//
//  IFTTTFilmstripSpec.m
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

SpecBegin(IFTTTFilmstrip)

describe(@"IFTTTFilmstrip", ^{
    __block IFTTTFilmstrip *filmstrip;
    
    beforeEach(^{
        filmstrip = [IFTTTFilmstrip new];
    });
    
    it(@"should start empty", ^{
        expect(filmstrip.isEmpty).to.beTruthy;
    });
    
    it(@"should set and get a number", ^{
        [filmstrip setValue:@(2) atTime:4.f];
        expect([(NSNumber *)[filmstrip valueAtTime:4.f] floatValue]).to.beCloseTo(2.f);
    });
    
    it(@"should set and get a color", ^{
        [filmstrip setValue:[UIColor redColor] atTime:4.f];
        expect([filmstrip valueAtTime:4.f]).to.equal([UIColor redColor]);
    });
    
    it(@"should set and get multiple numbers", ^{
        [filmstrip setValue:@(2) atTime:4.f];
        [filmstrip setValue:@(3) atTime:5.f];
        expect([(NSNumber *)[filmstrip valueAtTime:4.f] floatValue]).to.beCloseTo(2.f);
        expect([(NSNumber *)[filmstrip valueAtTime:5.f] floatValue]).to.beCloseTo(3.f);
    });
    
    it(@"should set and get multiple colors", ^{
        [filmstrip setValue:[UIColor redColor] atTime:4.f];
        [filmstrip setValue:[UIColor blueColor] atTime:5.f];
        expect([filmstrip valueAtTime:4.f]).to.equal([UIColor redColor]);
        expect([filmstrip valueAtTime:5.f]).to.equal([UIColor blueColor]);
    });
    
    it(@"should interpolate between numbers", ^{
        [filmstrip setValue:@(2) atTime:4.f];
        [filmstrip setValue:@(4) atTime:6.f];
        expect([(NSNumber *)[filmstrip valueAtTime:5.f] floatValue]).to.beCloseTo(3.f);
    });
    
    it(@"should return the first value for times before the start time", ^{
        [filmstrip setValue:@(2) atTime:4.f];
        [filmstrip setValue:@(3) atTime:5.f];
        expect([(NSNumber *)[filmstrip valueAtTime:0.f] floatValue]).to.beCloseTo(2.f);
        expect([(NSNumber *)[filmstrip valueAtTime:1.f] floatValue]).to.beCloseTo(2.f);
    });
    
    it(@"should return the last value for times after the end time", ^{
        [filmstrip setValue:@(2) atTime:4.f];
        [filmstrip setValue:@(3) atTime:5.f];
        expect([(NSNumber *)[filmstrip valueAtTime:6.f] floatValue]).to.beCloseTo(3.f);
        expect([(NSNumber *)[filmstrip valueAtTime:7.f] floatValue]).to.beCloseTo(3.f);
    });
    
    it(@"should work for negative times", ^{
        [filmstrip setValue:@(2) atTime:-4.f];
        [filmstrip setValue:@(3) atTime:5.f];
        expect([(NSNumber *)[filmstrip valueAtTime:-5.f] floatValue]).to.beCloseTo(2.f);
        expect([(NSNumber *)[filmstrip valueAtTime:-4.f] floatValue]).to.beCloseTo(2.f);
        expect([(NSNumber *)[filmstrip valueAtTime:5.f] floatValue]).to.beCloseTo(3.f);
    });
    
    it(@"should set a timing curve", ^{
        [filmstrip setValue:@(0.1f) atTime:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
        [filmstrip setValue:@(0.2f) atTime:2];
        expect([(NSNumber *)[filmstrip valueAtTime:1.5f] floatValue]).to.beCloseTo(((0.5f * 0.5f) * 0.1f) + 0.1f);
    });
    
    it(@"should use the timing curve from the starting keyframe", ^{
        [filmstrip setValue:@(0.1f) atTime:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
        [filmstrip setValue:@(0.2f) atTime:2 withEasingFunction:IFTTTEasingFunctionEaseOutBounce];
        expect([(NSNumber *)[filmstrip valueAtTime:1.5f] floatValue]).to.beCloseTo(((0.5f * 0.5f) * 0.1f) + 0.1f);
    });
    
    it(@"should use linear time for keyframes with no timing curve", ^{
        [filmstrip setValue:@(0.1f) atTime:1 withEasingFunction:IFTTTEasingFunctionEaseOutBounce];
        [filmstrip setValue:@(0.2f) atTime:2];
        [filmstrip setValue:@(0.3f) atTime:3];
        expect([(NSNumber *)[filmstrip valueAtTime:2.5f] floatValue]).to.beCloseTo(0.25f);
    });
    
    afterEach(^{
        filmstrip = nil;
    });
});

SpecEnd
