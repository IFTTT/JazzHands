//
//  IFTTTAnimationSpec.m
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

SpecBegin(IFTTTAnimation)

describe(@"IFTTTAnimation", ^{
    
    describe(@"should apply all types of animation to the same view correctly", ^{
        __block UILabel *label;
        __block CAShapeLayer *layer;
        __block IFTTTTransform3D *tttransform;
        
        beforeAll(^{
            label = [UILabel new];
            label.text = @"some text";
            layer = [CAShapeLayer layer];
            label.layer.mask = layer;
            IFTTTAnimator *animator = [IFTTTAnimator new];
            
            IFTTTAlphaAnimation *alphaAnimation = [IFTTTAlphaAnimation animationWithView:label];
            IFTTTColorAnimation *colorAnimation = [IFTTTColorAnimation animationWithView:label];
            IFTTTCornerRadiusAnimation *cornerRadiusAnimation = [IFTTTCornerRadiusAnimation animationWithView:label];
            IFTTTFillColorAnimation *fillColorAnimation = [IFTTTFillColorAnimation animationWithLayer:layer];
            IFTTTHideAnimation *hideAnimation = [IFTTTHideAnimation animationWithView:label hideAt:2];
            IFTTTRotationAnimation *rotationAnimation = [IFTTTRotationAnimation animationWithView:label];
            IFTTTScaleAnimation *scaleAnimation = [IFTTTScaleAnimation animationWithView:label];
            IFTTTStrokeEndAnimation *strokeEndAnimation = [IFTTTStrokeEndAnimation animationWithLayer:layer];
            IFTTTStrokeStartAnimation *strokeStartAnimation = [IFTTTStrokeStartAnimation animationWithLayer:layer];
            IFTTTTextColorAnimation *textColorAnimation = [IFTTTTextColorAnimation animationWithLabel:label];
            IFTTTTransform3DAnimation *transformAnimation = [IFTTTTransform3DAnimation animationWithView:label];
            IFTTTTranslationAnimation *translationAnimation = [IFTTTTranslationAnimation animationWithView:label];
            
            // Note: None of the three constraint animations can be used with each other or with the frame animation.
            // They affect the same view properties.
            
            [alphaAnimation addKeyframeForTime:2 alpha:0.5f];
            [colorAnimation addKeyframeForTime:2 color:[UIColor redColor]];
            [cornerRadiusAnimation addKeyframeForTime:2 cornerRadius:3.f];
            [fillColorAnimation addKeyframeForTime:2 color:[UIColor blueColor]];
            [rotationAnimation addKeyframeForTime:2 rotation:45.f];
            [scaleAnimation addKeyframeForTime:2 scale:0.4f];
            [strokeEndAnimation addKeyframeForTime:2 strokeEnd:0.8f];
            [strokeStartAnimation addKeyframeForTime:2 strokeStart:0.1f];
            [textColorAnimation addKeyframeForTime:2 color:[UIColor greenColor]];
            [translationAnimation addKeyframeForTime:2 translation:CGPointMake(20.f, 30.f)];
            
            tttransform = [IFTTTTransform3D transformWithM34:0.3f];
            tttransform.rotate = (IFTTTTransform3DRotate){ -(CGFloat)(M_PI), 1, 0, 0 };
            tttransform.translate = (IFTTTTransform3DTranslate){ 0, 0, 50 };
            tttransform.scale = (IFTTTTransform3DScale){ 1.f, 2.f, 1.f };
            
            [transformAnimation addKeyframeForTime:2 transform:tttransform];
            
            [animator addAnimation:alphaAnimation];
            [animator addAnimation:colorAnimation];
            [animator addAnimation:cornerRadiusAnimation];
            [animator addAnimation:fillColorAnimation];
            [animator addAnimation:rotationAnimation];
            [animator addAnimation:scaleAnimation];
            [animator addAnimation:strokeEndAnimation];
            [animator addAnimation:strokeStartAnimation];
            [animator addAnimation:textColorAnimation];
            [animator addAnimation:translationAnimation];
            [animator addAnimation:transformAnimation];
            [animator addAnimation:hideAnimation];
            
            [animator animate:2];
        });
        
        it(@"should have the correct alpha", ^{
            expect(label.alpha).to.beCloseTo(0.5f);
        });
        
        it(@"should have the correct background color", ^{
            expect(label.backgroundColor).to.equal([UIColor redColor]);
        });
        
        it(@"should have the correct corner radius", ^{
            expect(label.layer.cornerRadius).to.beCloseTo(3.f);
        });
        
        it(@"should have the correct fill color", ^{
            expect(layer.fillColor).to.equal([UIColor blueColor].CGColor);
        });
        
        it(@"should have the correct stroke end", ^{
            expect(layer.strokeEnd).to.beCloseTo(0.8f);
        });
        
        it(@"should have the correct stroke start", ^{
            expect(layer.strokeStart).to.beCloseTo(0.1f);
        });
        
        it(@"should have the correct text color", ^{
            expect(label.textColor).to.equal([UIColor greenColor]);
        });
        
        it(@"should have the correct hidden setting", ^{
            expect(label.hidden).to.beTruthy;
        });
        
        it(@"should have the correct view affine transform", ^{
            CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.4f, 0.4f);
            CGAffineTransform rotationTransform = CGAffineTransformMakeRotation(45.f * (CGFloat)(M_PI / -180.f));
            CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(20.f, 30.f);
            CGAffineTransform mixedTransform = CGAffineTransformConcat(translationTransform, CGAffineTransformConcat(scaleTransform, rotationTransform));
            
            expect(CGAffineTransformEqualToTransform(label.transform, mixedTransform)).to.beTruthy;
        });
        
        it(@"should have the correct layer 3D transform", ^{
            CATransform3D transform3D = CATransform3DIdentity;
            transform3D.m34 = tttransform.m34;
            transform3D = CATransform3DRotate(transform3D,
                                              tttransform.rotate.angle,
                                              tttransform.rotate.x,
                                              tttransform.rotate.y,
                                              tttransform.rotate.z);
            transform3D = CATransform3DScale(transform3D,
                                             tttransform.scale.sx,
                                             tttransform.scale.sy,
                                             tttransform.scale.sz);
            transform3D = CATransform3DTranslate(transform3D,
                                                 tttransform.translate.tx,
                                                 tttransform.translate.ty,
                                                 tttransform.translate.tz);
            
            expect(CATransform3DEqualToTransform(label.layer.transform, transform3D)).to.beTruthy;
        });
        
        afterAll(^{
            label = nil;
            layer = nil;
            tttransform = nil;
        });
    });
});

SpecEnd
