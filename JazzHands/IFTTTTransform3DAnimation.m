//
//  IFTTTTransform3DAnimation.m
//  JazzHands
//
//  Created by QFish on 3/3/14.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTTransform3DAnimation.h"

#pragma mark - IFTTTTransform3D

@implementation IFTTTTransform3D

+ (instancetype)transformWithM34:(CGFloat)m34
{
    IFTTTTransform3D * transform = [[self alloc] initWithM34:m34];
    return transform;
}

- (instancetype)init
{
    if ((self = [super init])) {
        self.scale = (IFTTTTransform3DScale){ 1.f, 1.f, 1.f };;
    }
    return self;
}

- (instancetype)initWithM34:(CGFloat)m34
{
    if ((self = [self init])) {
        self.m34 = m34;
    }
    return self;
}

- (IFTTTTransform3D *)interpolateTo:(IFTTTTransform3D *)toValue withProgress:(CGFloat)progress
{
    IFTTTTransform3D *betweenTransform = [IFTTTTransform3D new];
    
    betweenTransform.m34 = self.m34;
    
    IFTTTTransform3DTranslate translate;
    
    translate.tx = [NSNumber interpolateCGFloatFrom:self.translate.tx to:toValue.translate.tx withProgress:progress];
    translate.ty = [NSNumber interpolateCGFloatFrom:self.translate.ty to:toValue.translate.ty withProgress:progress];
    translate.tz = [NSNumber interpolateCGFloatFrom:self.translate.tz to:toValue.translate.tz withProgress:progress];
    
    IFTTTTransform3DRotate rotate;

    rotate.angle = [NSNumber interpolateCGFloatFrom:self.rotate.angle to:toValue.rotate.angle withProgress:progress];
    rotate.x = [NSNumber interpolateCGFloatFrom:self.rotate.x to:toValue.rotate.x withProgress:progress];
    rotate.y = [NSNumber interpolateCGFloatFrom:self.rotate.y to:toValue.rotate.y withProgress:progress];
    rotate.z = [NSNumber interpolateCGFloatFrom:self.rotate.z to:toValue.rotate.z withProgress:progress];
    
    IFTTTTransform3DScale scale;

    scale.sx = [NSNumber interpolateCGFloatFrom:self.scale.sx to:toValue.scale.sx withProgress:progress];
    scale.sy = [NSNumber interpolateCGFloatFrom:self.scale.sy to:toValue.scale.sy withProgress:progress];
    scale.sz = [NSNumber interpolateCGFloatFrom:self.scale.sz to:toValue.scale.sz withProgress:progress];
    
    betweenTransform.translate = translate;
    betweenTransform.rotate = rotate;
    betweenTransform.scale = scale;
    
    return betweenTransform;
}

@end

#pragma mark - IFTTTTransform3DAnimation

@implementation IFTTTTransform3DAnimation

- (void)addKeyframeForTime:(CGFloat)time transform:(IFTTTTransform3D *)transform
{
    [self addKeyframeForTime:time value:transform];
}

- (void)addKeyframeForTime:(CGFloat)time transform:(IFTTTTransform3D *)transform withEasingFunction:(IFTTTEasingFunction)easingFunction
{
    [self addKeyframeForTime:time value:transform withEasingFunction:easingFunction];
}

- (void)animate:(CGFloat)time
{
    if (!self.hasKeyframes) return;
    IFTTTTransform3D *iftttTransform = (IFTTTTransform3D *)[self valueAtTime:time];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = iftttTransform.m34;
    transform = CATransform3DRotate(transform,
                                    iftttTransform.rotate.angle,
                                    iftttTransform.rotate.x,
                                    iftttTransform.rotate.y,
                                    iftttTransform.rotate.z);
    transform = CATransform3DScale(transform,
                                   iftttTransform.scale.sx,
                                   iftttTransform.scale.sy,
                                   iftttTransform.scale.sz);
    transform = CATransform3DTranslate(transform,
                                       iftttTransform.translate.tx,
                                       iftttTransform.translate.ty,
                                       iftttTransform.translate.tz);
    
    self.view.layer.transform = transform;
}

@end
