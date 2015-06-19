//
//  IFTTTTransform3DAnimation.h
//  JazzHands
//
//  Created by QFish on 3/3/14.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "IFTTTViewAnimation.h"

struct IFTTTTransform3DTranslate
{
    CGFloat tx, ty, tz;
};

typedef struct IFTTTTransform3DTranslate IFTTTTransform3DTranslate;

struct IFTTTTransform3DScale
{
    CGFloat sx, sy, sz;
};

typedef struct IFTTTTransform3DScale IFTTTTransform3DScale;

struct IFTTTTransform3DRotate
{
    CGFloat angle;
    CGFloat x, y, z;
};

typedef struct IFTTTTransform3DRotate IFTTTTransform3DRotate;

@interface IFTTTTransform3D : NSObject <IFTTTInterpolatable>

@property (nonatomic, assign) CGFloat m34;
@property (nonatomic, assign) IFTTTTransform3DScale scale;
@property (nonatomic, assign) IFTTTTransform3DRotate rotate;
@property (nonatomic, assign) IFTTTTransform3DTranslate translate;

+ (instancetype)transformWithM34:(CGFloat)m34;
- (id)initWithM34:(CGFloat)m34;

@end

@interface IFTTTTransform3DAnimation : IFTTTViewAnimation <IFTTTAnimatable>

- (void)addKeyframeForTime:(CGFloat)time transform:(IFTTTTransform3D *)transform;
- (void)addKeyframeForTime:(CGFloat)time transform:(IFTTTTransform3D *)transform withEasingFunction:(IFTTTEasingFunction)easingFunction;

@end
