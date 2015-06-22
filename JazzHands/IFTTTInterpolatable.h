//
//  IFTTTInterpolatable.h
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - IFTTTInterpolatable

@protocol IFTTTInterpolatable <NSObject>

- (id)interpolateTo:(id)toValue withProgress:(CGFloat)progress;

@end

#pragma mark - NSNumber (IFTTTInterpolatable)

@interface NSNumber (IFTTTInterpolatable) <IFTTTInterpolatable>

+ (CGFloat)interpolateCGFloatFrom:(CGFloat)fromValue to:(CGFloat)toValue withProgress:(CGFloat)progress;

@end

#pragma mark - UIColor (IFTTTInterpolatable)

@interface UIColor (IFTTTInterpolatable) <IFTTTInterpolatable>

@end

#pragma mark - NSValue (IFTTTInterpolatable)

@interface NSValue (IFTTTInterpolatable) <IFTTTInterpolatable>

+ (CGPoint)interpolateCGPointFrom:(CGPoint)fromValue to:(CGPoint)toValue withProgress:(CGFloat)progress;

+ (CGSize)interpolateCGSizeFrom:(CGSize)fromValue to:(CGSize)toValue withProgress:(CGFloat)progress;

+ (CGRect)interpolateCGRectFrom:(CGRect)fromValue to:(CGRect)toValue withProgress:(CGFloat)progress;

+ (CGVector)interpolateCGVectorFrom:(CGVector)fromValue to:(CGVector)toValue withProgress:(CGFloat)progress;

+ (UIEdgeInsets)interpolateUIEdgeInsetsFrom:(UIEdgeInsets)fromValue to:(UIEdgeInsets)toValue withProgress:(CGFloat)progress;

+ (UIOffset)interpolateUIOffsetFrom:(UIOffset)fromValue to:(UIOffset)toValue withProgress:(CGFloat)progress;

+ (CGAffineTransform)interpolateCGAffineTransformFrom:(CGAffineTransform)fromValue to:(CGAffineTransform)toValue withProgress:(CGFloat)progress;

@end
