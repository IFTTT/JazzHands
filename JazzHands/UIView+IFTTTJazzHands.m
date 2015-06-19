//
//  UIView+IFTTTJazzHands.m
//  JazzHands
//
//  Created by Laura Skelton on 6/17/15.
//  Copyright (c) 2015 IFTTT Inc. All rights reserved.
//

#import "UIView+IFTTTJazzHands.h"
#import <objc/runtime.h>

@implementation UIView (IFTTTJazzHands)

- (NSValue *)iftttRotationTransform
{
    return objc_getAssociatedObject(self, @selector(iftttRotationTransform));
}

- (void)setIftttRotationTransform:(NSValue *)iftttRotationTransform
{
    objc_setAssociatedObject(self, @selector(iftttRotationTransform), iftttRotationTransform, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSValue *)iftttScaleTransform
{
    return objc_getAssociatedObject(self, @selector(iftttScaleTransform));
}

- (void)setIftttScaleTransform:(NSValue *)iftttScaleTransform
{
    objc_setAssociatedObject(self, @selector(iftttScaleTransform), iftttScaleTransform, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSValue *)iftttTranslationTransform
{
    return objc_getAssociatedObject(self, @selector(iftttTranslationTransform));
}

- (void)setIftttTranslationTransform:(NSValue *)iftttTranslationTransform
{
    objc_setAssociatedObject(self, @selector(iftttTranslationTransform), iftttTranslationTransform, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
