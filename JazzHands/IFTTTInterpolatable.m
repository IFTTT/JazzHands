//
//  IFTTTInterpolatable.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTInterpolatable.h"

#pragma mark - NSNumber (IFTTTInterpolatable)

@implementation NSNumber (IFTTTInterpolatable)

- (NSNumber *)interpolateTo:(NSNumber *)toValue withProgress:(CGFloat)progress
{
    if (strcmp([self objCType], @encode(BOOL)) == 0) {
        if (!(strcmp([toValue objCType], @encode(BOOL)) == 0)) return self;
        return (progress == 0.f ? self : toValue);
    }
    return @([self.class interpolateCGFloatFrom:(CGFloat)[self floatValue] to:(CGFloat)[toValue floatValue] withProgress:progress]);
}

+ (CGFloat)interpolateCGFloatFrom:(CGFloat)fromValue to:(CGFloat)toValue withProgress:(CGFloat)progress
{
    CGFloat totalChange = toValue - fromValue;
    CGFloat currentChange = totalChange * progress;
    return fromValue + currentChange;
}

@end

#pragma mark - UIColor (IFTTTInterpolatable)

@implementation UIColor (IFTTTInterpolatable)

- (UIColor *)interpolateTo:(UIColor *)toValue withProgress:(CGFloat)progress
{
    CGFloat startRed, startBlue, startGreen, startAlpha;
    CGFloat endRed, endBlue, endGreen, endAlpha;
    UIColor *interpolatedColor = self;
    
    if ([self.class iftttGetRed:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha fromColor:self] &&
        [self.class iftttGetRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha fromColor:toValue]) {
        CGFloat red = [NSNumber interpolateCGFloatFrom:startRed to:endRed withProgress:progress];
        CGFloat green = [NSNumber interpolateCGFloatFrom:startGreen to:endGreen withProgress:progress];
        CGFloat blue = [NSNumber interpolateCGFloatFrom:startBlue to:endBlue withProgress:progress];
        CGFloat alpha = [NSNumber interpolateCGFloatFrom:startAlpha to:endAlpha withProgress:progress];
        interpolatedColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    return interpolatedColor;
}

+ (BOOL)iftttGetRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue alpha:(CGFloat *)alpha fromColor:(UIColor *)color
{
    CGFloat white;
    if ([color getRed:red green:green blue:blue alpha:alpha]) {
        return YES;
    } else if ([color getWhite:&white alpha:alpha]) {
        *red = white;
        *green = white;
        *blue = white;
        return YES;
    }
    return NO;
}

@end

#pragma mark - NSValue (IFTTTInterpolatable)

@implementation NSValue (IFTTTInterpolatable)

- (NSValue *)interpolateTo:(NSValue *)toValue withProgress:(CGFloat)progress
{
    if (strcmp([self objCType], @encode(CGPoint)) == 0) {
        if (!(strcmp([toValue objCType], @encode(CGPoint)) == 0)) return self;
        // CGPoint method
        CGPoint fromPoint = [self CGPointValue];
        CGPoint toPoint = [toValue CGPointValue];
        CGPoint pointBetween = [self.class interpolateCGPointFrom:fromPoint to:toPoint withProgress:progress];
        return [NSValue valueWithCGPoint:pointBetween];
    } else if (strcmp([self objCType], @encode(CGSize)) == 0) {
        if (!(strcmp([toValue objCType], @encode(CGSize)) == 0)) return self;
        // CGRect method
        CGSize fromSize = [self CGSizeValue];
        CGSize toSize = [toValue CGSizeValue];
        CGSize sizeBetween = [self.class interpolateCGSizeFrom:fromSize to:toSize withProgress:progress];
        return [NSValue valueWithCGSize:sizeBetween];
    } else if (strcmp([self objCType], @encode(CGRect)) == 0) {
        if (!(strcmp([toValue objCType], @encode(CGRect)) == 0)) return self;
        // CGRect method
        CGRect fromRect = [self CGRectValue];
        CGRect toRect = [toValue CGRectValue];
        CGRect rectBetween = [self.class interpolateCGRectFrom:fromRect to:toRect withProgress:progress];
        return [NSValue valueWithCGRect:rectBetween];
    } else if (strcmp([self objCType], @encode(CGVector)) == 0) {
        if (!(strcmp([toValue objCType], @encode(CGVector)) == 0)) return self;
        // CGVector method
        CGVector fromVector = [self CGVectorValue];
        CGVector toVector = [toValue CGVectorValue];
        CGVector vectorBetween = [self.class interpolateCGVectorFrom:fromVector to:toVector withProgress:progress];
        return [NSValue valueWithCGVector:vectorBetween];
    } else if (strcmp([self objCType], @encode(UIEdgeInsets)) == 0) {
        if (!(strcmp([toValue objCType], @encode(UIEdgeInsets)) == 0)) return self;
        // UIEdgeInsets method
        UIEdgeInsets fromInsets = [self UIEdgeInsetsValue];
        UIEdgeInsets toInsets = [toValue UIEdgeInsetsValue];
        UIEdgeInsets insetsBetween = [self.class interpolateUIEdgeInsetsFrom:fromInsets to:toInsets withProgress:progress];
        return [NSValue valueWithUIEdgeInsets:insetsBetween];
    } else if (strcmp([self objCType], @encode(UIOffset)) == 0) {
        if (!(strcmp([toValue objCType], @encode(UIOffset)) == 0)) return self;
        // UIOffset method
        UIOffset fromOffset = [self UIOffsetValue];
        UIOffset toOffset = [toValue UIOffsetValue];
        UIOffset offsetBetween = [self.class interpolateUIOffsetFrom:fromOffset to:toOffset withProgress:progress];
        return [NSValue valueWithUIOffset:offsetBetween];
    } else if (strcmp([self objCType], @encode(CGAffineTransform)) == 0) {
        if (!(strcmp([toValue objCType], @encode(CGAffineTransform)) == 0)) return self;
        // CGAffineTransform method
        CGAffineTransform fromTransform = [self CGAffineTransformValue];
        CGAffineTransform toTransform = [toValue CGAffineTransformValue];
        CGAffineTransform transformBetween = [self.class interpolateCGAffineTransformFrom:fromTransform to:toTransform withProgress:progress];
        return [NSValue valueWithCGAffineTransform:transformBetween];
    }
    return self;
}

+ (CGPoint)interpolateCGPointFrom:(CGPoint)fromValue to:(CGPoint)toValue withProgress:(CGFloat)progress
{
    CGFloat xBetween = [NSNumber interpolateCGFloatFrom:fromValue.x to:toValue.x withProgress:progress];
    CGFloat yBetween = [NSNumber interpolateCGFloatFrom:fromValue.y to:toValue.y withProgress:progress];
    return CGPointMake(xBetween, yBetween);
}

+ (CGSize)interpolateCGSizeFrom:(CGSize)fromValue to:(CGSize)toValue withProgress:(CGFloat)progress
{
    CGFloat widthBetween = [NSNumber interpolateCGFloatFrom:fromValue.width to:toValue.width withProgress:progress];
    CGFloat heightBetween = [NSNumber interpolateCGFloatFrom:fromValue.height to:toValue.height withProgress:progress];
    return CGSizeMake(widthBetween, heightBetween);
}

+ (CGRect)interpolateCGRectFrom:(CGRect)fromValue to:(CGRect)toValue withProgress:(CGFloat)progress
{
    CGPoint originBetween = [self interpolateCGPointFrom:fromValue.origin to:toValue.origin withProgress:progress];
    CGSize sizeBetween = [self interpolateCGSizeFrom:fromValue.size to:toValue.size withProgress:progress];
    return CGRectMake(originBetween.x, originBetween.y, sizeBetween.width, sizeBetween.height);
}

+ (CGVector)interpolateCGVectorFrom:(CGVector)fromValue to:(CGVector)toValue withProgress:(CGFloat)progress
{
    CGFloat dxBetween = [NSNumber interpolateCGFloatFrom:fromValue.dx to:toValue.dx withProgress:progress];
    CGFloat dyBetween = [NSNumber interpolateCGFloatFrom:fromValue.dy to:toValue.dy withProgress:progress];
    return CGVectorMake(dxBetween, dyBetween);
}

+ (UIEdgeInsets)interpolateUIEdgeInsetsFrom:(UIEdgeInsets)fromValue to:(UIEdgeInsets)toValue withProgress:(CGFloat)progress
{
    CGFloat topBetween = [NSNumber interpolateCGFloatFrom:fromValue.top to:toValue.top withProgress:progress];
    CGFloat leftBetween = [NSNumber interpolateCGFloatFrom:fromValue.left to:toValue.left withProgress:progress];
    CGFloat bottomBetween = [NSNumber interpolateCGFloatFrom:fromValue.bottom to:toValue.bottom withProgress:progress];
    CGFloat rightBetween = [NSNumber interpolateCGFloatFrom:fromValue.right to:toValue.right withProgress:progress];
    return UIEdgeInsetsMake(topBetween, leftBetween, bottomBetween, rightBetween);
}

+ (UIOffset)interpolateUIOffsetFrom:(UIOffset)fromValue to:(UIOffset)toValue withProgress:(CGFloat)progress
{
    CGFloat horizontalBetween = [NSNumber interpolateCGFloatFrom:fromValue.horizontal to:toValue.horizontal withProgress:progress];
    CGFloat verticalBetween = [NSNumber interpolateCGFloatFrom:fromValue.vertical to:toValue.vertical withProgress:progress];
    return UIOffsetMake(horizontalBetween, verticalBetween);
}

+ (CGAffineTransform)interpolateCGAffineTransformFrom:(CGAffineTransform)fromValue to:(CGAffineTransform)toValue withProgress:(CGFloat)progress
{
    CGFloat aBetween = [NSNumber interpolateCGFloatFrom:fromValue.a to:toValue.a withProgress:progress];
    CGFloat bBetween = [NSNumber interpolateCGFloatFrom:fromValue.b to:toValue.b withProgress:progress];
    CGFloat cBetween = [NSNumber interpolateCGFloatFrom:fromValue.c to:toValue.c withProgress:progress];
    CGFloat dBetween = [NSNumber interpolateCGFloatFrom:fromValue.d to:toValue.d withProgress:progress];
    CGFloat txBetween = [NSNumber interpolateCGFloatFrom:fromValue.tx to:toValue.tx withProgress:progress];
    CGFloat tyBetween = [NSNumber interpolateCGFloatFrom:fromValue.ty to:toValue.ty withProgress:progress];
    return CGAffineTransformMake(aBetween, bBetween, cBetween, dBetween, txBetween, tyBetween);
}

@end
