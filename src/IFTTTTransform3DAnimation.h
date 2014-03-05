//
//  IFTTTTransform3DAnimation.h
//  JazzHands
//
//  Created by QFish on 3/3/14.
//

/*
 * Example
 * 
 * // transform the unicorn in on page 2 and out on page 4
 * IFTTTTransform3DAnimation * unicornTransformAnimation = [IFTTTTransform3DAnimation animationWithView:self.unicorn];
 * IFTTTTransform3D * tt1 = [IFTTTTransform3D new];
 * IFTTTTransform3D * tt2 = [IFTTTTransform3D transformWithM34:-(1 / 500.f)];
 * tt2.rotate = (IFTTTTransform3DRotate){ -(M_PI), 1, 0, 0 };
 * // tt2.translate = (IFTTTTransform3DTranslate){ 0, 0, 50 };
 * // tt2.scale = (IFTTTTransform3DScale){ 1.f, 2.f, 1.f };
 * [unicornTransformAnimation addKeyFrames:[IFTTTAnimationKeyFrame
 * keyFramesWithTimesAndTransform3D:2, timeForPage(2), tt1, timeForPage(3), tt2]];
 * [self.animator addAnimation:unicornTransformAnimation];
 *
 */

#import "IFTTTAnimation.h"

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

@interface IFTTTTransform3D : NSObject
@property (nonatomic, assign) CGFloat m34;
@property (nonatomic, assign) IFTTTTransform3DScale scale;
@property (nonatomic, assign) IFTTTTransform3DRotate rotate;
@property (nonatomic, assign) IFTTTTransform3DTranslate translate;

+ (instancetype)transformWithM34:(CGFloat)m34;

- (id)initWithM34:(CGFloat)m34;

@end

@interface IFTTTTransform3DAnimation : IFTTTAnimation
@end
