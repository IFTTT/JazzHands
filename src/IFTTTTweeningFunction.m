//
//  IFTTTTweeningFunction.m
//  JazzHands
//
//  Created by Felix Jendrusch on 1/9/15.
//
//

#import "IFTTTFrameAnimation.h"
#import "IFTTTAnimationKeyFrame.h"
#import "IFTTTTweeningFunction.h"

#if CGFLOAT_IS_DOUBLE
#define POW(X, Y) pow(X, Y)
#else
#define POW(X, Y) powf(X, Y)
#endif

IFTTTTweeningFunction const IFTTTTweeningFunctionDefault = ^(IFTTTAnimation *animation, NSInteger time, IFTTTAnimationKeyFrame *startKeyFrame, IFTTTAnimationKeyFrame *endKeyFrame) {
    return [animation frameForTime:time startKeyFrame:startKeyFrame endKeyFrame:endKeyFrame];
};

extern IFTTTTweeningFunction IFTTTTweeningFunctionFrameOriginQuadCurve(CGPoint cp) {
    return ^(IFTTTAnimation *animation, NSInteger time, IFTTTAnimationKeyFrame *startKeyFrame, IFTTTAnimationKeyFrame *endKeyFrame) {
        NSCParameterAssert([animation isKindOfClass:[IFTTTFrameAnimation class]]);

        NSInteger startTime = startKeyFrame.time;
        NSInteger endTime = endKeyFrame.time;
        NSInteger duration = endTime - startTime;

        CGFloat t = ((CGFloat)time - (CGFloat)startTime) / (CGFloat)duration;

        CGRect startFrame = startKeyFrame.frame;
        CGRect endFrame = endKeyFrame.frame;

        CGRect frame = animation.view.frame;
        // B(t) = (1 - t) ^ 2 * s + 2 * (1 - t) * t * cp + t ^ 2 * e
        frame.origin.x =     POW(1 - t, 2)             * CGRectGetMinX(startFrame)
                       + 2 *    (1 - t)    *     t     * cp.x
                       +                     POW(t, 2) * CGRectGetMinX(endFrame);
        frame.origin.y =     POW(1 - t, 2)             * CGRectGetMinY(startFrame)
                       + 2 *    (1 - t)    *     t     * cp.y
                       +                     POW(t, 2) * CGRectGetMinY(endFrame);
        frame.size.width = [animation tweenValueForStartTime:startTime
                                                     endTime:endTime
                                                  startValue:CGRectGetWidth(startFrame)
                                                    endValue:CGRectGetWidth(endFrame)
                                                      atTime:time] ? : 0;
        frame.size.height = [animation tweenValueForStartTime:startTime
                                                      endTime:endTime
                                                   startValue:CGRectGetHeight(startFrame)
                                                     endValue:CGRectGetHeight(endFrame)
                                                       atTime:time] ? : 0;

        IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
        animationFrame.frame = frame;

        return animationFrame;
    };
}

extern IFTTTTweeningFunction IFTTTTweeningFunctionFrameOriginCurve(CGPoint cp1, CGPoint cp2) {
    return ^(IFTTTAnimation *animation, NSInteger time, IFTTTAnimationKeyFrame *startKeyFrame, IFTTTAnimationKeyFrame *endKeyFrame) {
        NSCParameterAssert([animation isKindOfClass:[IFTTTFrameAnimation class]]);

        NSInteger startTime = startKeyFrame.time;
        NSInteger endTime = endKeyFrame.time;
        NSInteger duration = endTime - startTime;

        CGFloat t = ((CGFloat)time - (CGFloat)startTime) / (CGFloat)duration;

        CGRect startFrame = startKeyFrame.frame;
        CGRect endFrame = endKeyFrame.frame;

        CGRect frame = animation.view.frame;
        // B(t) = (1 - t) ^ 3 * s + 3 * (1 - t) ^ 2 * t * cp1 + 3 * (1 - t) * t ^ 2 * cp2 + t ^ 3 * e
        frame.origin.x =     POW(1 - t, 3)             * CGRectGetMinX(startFrame)
                       + 3 * POW(1 - t, 2) *     t     * cp1.x
                       + 3 *    (1 - t)    * POW(t, 2) * cp2.x
                       +                     POW(t, 3) * CGRectGetMinX(endFrame);
        frame.origin.y =     POW(1 - t, 3)             * CGRectGetMinY(startFrame)
                       + 3 * POW(1 - t, 2) *     t     * cp1.y
                       + 3 *    (1 - t)    * POW(t, 2) * cp2.y
                       +                     POW(t, 3) * CGRectGetMinY(endFrame);
        frame.size.width = [animation tweenValueForStartTime:startTime
                                                     endTime:endTime
                                                  startValue:CGRectGetWidth(startFrame)
                                                    endValue:CGRectGetWidth(endFrame)
                                                      atTime:time] ? : 0;
        frame.size.height = [animation tweenValueForStartTime:startTime
                                                      endTime:endTime
                                                   startValue:CGRectGetHeight(startFrame)
                                                     endValue:CGRectGetHeight(endFrame)
                                                       atTime:time] ? : 0;

        IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
        animationFrame.frame = frame;

        return animationFrame;
    };
}
