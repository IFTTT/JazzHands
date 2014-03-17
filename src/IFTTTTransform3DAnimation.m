//
//  IFTTTTransform3DAnimation.m
//  JazzHands
//
//  Created by QFish on 3/3/14.
//

#import "IFTTTTransform3DAnimation.h"

@implementation IFTTTTransform3D

+ (instancetype)transformWithM34:(CGFloat)m34
{
    IFTTTTransform3D * transform = [[self alloc] initWithM34:m34];
    return transform;
}

- (id)init
{
    if ((self = [super init])) {
        self.scale = (IFTTTTransform3DScale){ 1.f, 1.f, 1.f };;
    }
    
    return self;
}

- (id)initWithM34:(CGFloat)m34
{
    if ((self = [self init])) {
        self.m34 = m34;
    }
    
    return self;
}

@end

#pragma mark -

@implementation IFTTTTransform3DAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = animationFrame.transform.m34;
    transform = CATransform3DRotate(transform,
                                    animationFrame.transform.rotate.angle,
                                    animationFrame.transform.rotate.x,
                                    animationFrame.transform.rotate.y,
                                    animationFrame.transform.rotate.z);    
    transform = CATransform3DScale(transform,
                                   animationFrame.transform.scale.sx,
                                   animationFrame.transform.scale.sy,
                                   animationFrame.transform.scale.sz);
    transform = CATransform3DTranslate(transform,
                                       animationFrame.transform.translate.tx,
                                       animationFrame.transform.translate.ty,
                                       animationFrame.transform.translate.tz);
    
    self.view.layer.transform = transform;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    IFTTTAnimationFrame * animationFrame = [IFTTTAnimationFrame new];
    animationFrame.transform = [IFTTTTransform3D new];
    animationFrame.transform.m34 = startKeyFrame.transform.m34;
    
    IFTTTTransform3DTranslate translate;
    
    translate.tx = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.translate.tx
                                       endValue:endKeyFrame.transform.translate.tx
                                         atTime:time];
    translate.ty = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.translate.ty
                                       endValue:endKeyFrame.transform.translate.ty
                                         atTime:time];
    translate.tz = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.translate.tz
                                       endValue:endKeyFrame.transform.translate.tz
                                         atTime:time];
    
    animationFrame.transform.translate = translate;
    
    IFTTTTransform3DRotate rotate;
    
    rotate.angle = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.rotate.angle
                                       endValue:endKeyFrame.transform.rotate.angle
                                         atTime:time];
    rotate.x = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.rotate.x
                                       endValue:endKeyFrame.transform.rotate.x
                                         atTime:time];
    rotate.y = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.rotate.y
                                       endValue:endKeyFrame.transform.rotate.y
                                         atTime:time];
    rotate.z = [self tweenValueForStartTime:startKeyFrame.time
                                        endTime:endKeyFrame.time
                                     startValue:startKeyFrame.transform.rotate.z
                                       endValue:endKeyFrame.transform.rotate.z
                                         atTime:time];
    
    animationFrame.transform.rotate = rotate;
    
    IFTTTTransform3DScale scale;
    
    scale.sx = [self tweenValueForStartTime:startKeyFrame.time
                                    endTime:endKeyFrame.time
                                 startValue:startKeyFrame.transform.scale.sx
                                   endValue:endKeyFrame.transform.scale.sx
                                     atTime:time];
    scale.sy = [self tweenValueForStartTime:startKeyFrame.time
                                    endTime:endKeyFrame.time
                                 startValue:startKeyFrame.transform.scale.sy
                                   endValue:endKeyFrame.transform.scale.sy
                                     atTime:time];
    scale.sz = [self tweenValueForStartTime:startKeyFrame.time
                                    endTime:endKeyFrame.time
                                 startValue:startKeyFrame.transform.scale.sz
                                   endValue:endKeyFrame.transform.scale.sz
                                     atTime:time];
    
    animationFrame.transform.scale = scale;

    return animationFrame;
}

@end
