#Jazz Hands

Jazz Hands is a simple, keyframe based animation framework for UIKit.
Animations can be controlled via gestures, scroll views, kvo, or ReactiveCocoa.

Jazz Hands is used extensively in [IFTTT for iPhone](https://ifttt.com/mobile), most famously in the app intro:

![ScreenShot](https://raw.github.com/IFTTT/JazzHands/screenshots/screenshots/intro.gif)

##Demo App

Run JazzHandsDemo/JazzHandsDemo.xcodeproj to see a simple demonstration of moving, resizing, fading, and hiding views in a scrolling app intro.

##Installation

It's recommended that you install from CocoaPods, but you may alternatively just copy the contents of /src into your project.

##Quick Start

First, add JazzHands to your UIViewController.

```
import "IFTTTJazzHands.h"
```

Now, create an Animator to manage all of the animations in this UIViewController.

```
@property (nonatomic, strong) IFTTTAnimator *animator;

...

self.animator = [IFTTTAnimator new];
```

Create an animation for a view that you want to animate. There are multiple
types of animation that can be applied to a view. For this example, we'll use 
IFTTTFrameAnimation, which moves and sizes a view.

```
IFTTTFrameAnimation *frameAnimation = [IFTTTFrameAnimation new];
frameAnimation.view = viewThatYouWantToAnimate;
```

Register the animation with the animator.

```
[self.animator addAnimation:frameAnimation];
```

Add some keyframes to the animation. Let's move this view 140 pixels left, and double the size, between times 30 and 60.

```
[frameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:30 andFrame:CGRectMake(10, 10, 100, 100)]];
[frameAnimation addKeyFrame:[[IFTTTAnimationKeyFrame alloc] initWithTime:60 andFrame:CGRectMake(150, 10, 200, 200)]];
```

Now, to animate the view, tell the animator what time it is. For example, to tie this animation to a UIScrollView, notify the animator of time in the scroller's delegate method.

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  [self.animator animate:scrollView.contentOffset.x];
}
```

This will produce an effect where the view will be at 10,10 and sized 100x100 for scroll positions 0 to 30. Between scroll positions 30 and 60, the view will grow and move until scroll position 61, where it will be locked to 150, 10 and 200x200.

##Animation Types

Currently, Jazz Hands supports three types of animations:

+ **IFTTTFrameAnimation** moves and sizes views.
+ **IFTTTAlphaAnimation** creates fade effects.
+ **IFTTTHideAnimation** hides and shows views.

##More Examples

###ReactiveCocoa

Say you want to perform some animations based on a UITableView's scroll offset, but you don't want to be the delegate for that table? ReactiveCocoa is perfect for that.

```
[RACAble(self.tableView.contentOffset) subscribeNext:^(NSValue *value) {
  NSInteger y = floor(self.tableView.contentOffset.y);
  [self.animator animate:y];
}];
```

### KVO

Or, maybe you want to animate some views based upon the position of another view? Jazz Hands works well with KVO.

```
- (void)viewDidLoad
{
  [self.viewToMirror addObserver:self 
                      forKeyPath:@"frame" 
                         options:NSKeyValueObservingOptionInitial 
                         context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object 
                        change:(NSDictionary *)change 
                       context:(void *)context {

  if ([keyPath isEqualToString:@"frame"]) {
    [self.animator animate:CGRectGetMinY(self.viewToMirror.frame)];
  } else {
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
  }
}
```

### Gestures

Jazz Hands is flexible enough that it can accept timer input from many different types sources, and this includes UIGestureRecognizers.

``` 
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
  [self.animator animate:[recognizer locationOfTouch:0 inView:self.view]];
}
```

## Notes

An animator can only handle one animation per type per view. If you want multiple animations of the same type on a view, use keyframes.

Copyright 2013 IFTTT Inc
