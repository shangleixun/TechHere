//
//  UIView+Menu.m
//  SideslipMenu
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 SUWQ. All rights reserved.
//

#import "UIView+Menu.h"
#import "UIView+FrameChange.h"
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self

typedef enum {
    SwipeInit,
    SwipeLeft,
    SwipeRight,
    SwipeUp,
    SwipeDown
}SwipeLocation;

@implementation UIView (Menu)
UIView *menu;
BOOL isShow;
BOOL isAnimation;
CGPoint beginPoint;
CGPoint changePoint;
CGRect initMenuRect;
Location showLocation;
SwipeLocation swipeLocation;

#pragma mark Public Method
- (void)addMenu:(UIView *)view
       location:(Location)location
   allowGesture:(BOOL)allowGesture{
    menu = view;
    showLocation = location;
    self.layer.masksToBounds = YES;
    [self addSubview:menu];
    switch (location) {
        case Left:
            // 左
            menu.x = -menu.width;
            break;
        case Right:
            // 右
            menu.x = self.width;
            break;
        case Top:
            // 上
            menu.y = -menu.height;
            break;
        default:
            // 下
            menu.y = self.height;
            break;
    }
    initMenuRect = menu.frame;
    if (allowGesture) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(pan:)];
        [self addGestureRecognizer:pan];
    }
}

- (void)showWithDuration:(NSTimeInterval)duration{
    if (isShow || isAnimation) {
        return;
    }
    isAnimation = YES;
    switch (showLocation) {
        case Left:
            // 左
            [self leftAnimationDuration:duration];
            break;
        case Right:
            // 右
            [self rightAnimationDuration:duration];
            break;
        case Top:
            // 上
            [self topAnimationDuration:duration];
            break;
        default:
            // 下
            [self buttomAnimationDuration:duration];
            break;
    }
}

- (void)hideMenuDuration:(NSTimeInterval)duration{
    if (!isShow || isAnimation) {
        return;
    }
    isAnimation = YES;
    for (UIView *view in [self subviews]) {
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             switch (showLocation) {
                                 case Left:{
                                     view.x -= (menu.x - initMenuRect.origin.x);
                                     break;
                                 }
                                 case Right:{
                                     view.x += (self.width - menu.x);
                                     break;
                                 }
                                 case Top:{
                                     view.y -= (menu.y - initMenuRect.origin.y);
                                     break;
                                 }
                                 default:{
                                     view.y += (self.height - menu.y);
                                     break;
                                 }
                             }
                         } completion:^(BOOL finished) {
                             isShow = !finished;
                             isAnimation = !finished;
                         }];
    }
}


#pragma mark Private Method
- (void)pan:(UIPanGestureRecognizer *)gesture{
    CGPoint point = [gesture translationInView:self];
    CGFloat precent = showLocation == Left || showLocation == Right ? point.x/self.width : point.y/self.height;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            swipeLocation = SwipeInit;
            beginPoint = point;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            changePoint = point;
            [self judgeDirection];
            if (showLocation == Left && (menu.x < - menu.width || menu.x > 0)) {
                return;
            }
            if (showLocation == Right && (menu.x < self.size.width - menu.width || menu.x > self.size.width)) {
                return;
            }
            if (showLocation == Top && (menu.y < -menu.height || menu.y > 0)) {
                return;
            }
            if (showLocation == Buttom && (menu.y < self.size.height - menu.height || menu.y > self.size.height)) {
                return;
            }
            switch (showLocation) {
                case Left:{
                    for (UIView *view in [self subviews]) {
                        if (isShow) {
                            // hide
                            if (precent > 0) {
                                return;
                            }
                            if (menu.x > -menu.width) {
                                view.x += menu.width*precent - menu.x;
                            }
                        }else {
                            // show
                            if (precent < 0){
                                return;
                            }
                            if (menu.x < 0) {
                                view.x += (menu.width*precent - (menu.x - initMenuRect.origin.x));
                            }
                        }
                    }
                    break;
                }
                case Right:{
                    for (UIView *view in [self subviews]) {
                        if (isShow) {
                            // hide
                            if (precent < 0) {
                                return;
                            }
                            if (menu.x < self.width) {
                                view.x += menu.width*precent - (menu.x - (self.width - menu.width));
                            }
                        }else {
                            // show
                            if (precent > 0) {
                                return;
                            }
                            if (menu.x > self.width - menu.width) {
                                view.x -= (-menu.width*precent - (self.width - menu.x));
                            }
                        }
                    }
                    break;
                }
                case Top:{
                    for (UIView *view in [self subviews]) {
                        if (isShow) {
                            // hide
                            if (precent > 0) {
                                return;
                            }
                            if (menu.y > -menu.height) {
                                view.y += menu.height*precent - menu.y;
                            }
                        }else {
                            // show
                            if (precent < 0){
                                return;
                            }
                            if (menu.y < 0) {
                                view.y += (menu.height*precent - (menu.y - initMenuRect.origin.y));
                            }
                        }
                    }
                    break;
                }
                default:{
                    for (UIView *view in [self subviews]) {
                        if (isShow) {
                            // hide
                            if (precent < 0) {
                                return;
                            }
                            if (menu.y < self.height) {
                                view.y += menu.height*precent - (menu.y - (self.height - menu.height));
                            }
                        }else {
                            // show
                            if (precent > 0) {
                                return;
                            }
                            if (menu.y > self.height - menu.height) {
                                view.y -= (-menu.height*precent - (self.height - menu.y));
                            }
                        }
                    }
                    break;
                }
            }
            
            break;
        }
        default:
            if (fabs(precent) > 0.3) {
                if (isShow) {
                    switch (showLocation) {
                        case Left:{
                            if (swipeLocation == SwipeLeft) {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }else {
                                [self leftAnimationDuration:0.2];
                            }
                            break;
                        }
                        case Right:{
                            if (swipeLocation == SwipeRight) {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }else {
                                [self rightAnimationDuration:0.2];
                            }
                            break;
                        }
                        case Top:{
                            if (swipeLocation == SwipeUp) {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }else {
                                [self topAnimationDuration:0.2];
                            }
                            break;
                        }
                        default:{
                            if (swipeLocation == SwipeDown) {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }else {
                                [self buttomAnimationDuration:0.2];
                            }
                            break;
                        }
                    }
                    
                }else {
                    switch (showLocation) {
                        case Left:{
                            if (swipeLocation == SwipeRight) {
                                [self leftAnimationDuration:0.2];
                            }else {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }
                            break;
                        }
                        case Right:{
                            if (swipeLocation == SwipeLeft) {
                                [self rightAnimationDuration:0.2];
                            }else {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }
                            break;
                        }
                        case Top:{
                            if (swipeLocation == SwipeDown) {
                                [self topAnimationDuration:0.2];
                            }else {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }
                            break;
                        }
                        default:{
                            if (swipeLocation == SwipeUp) {
                                [self buttomAnimationDuration:0.2];
                            }else {
                                isShow = YES;
                                [self hideMenuDuration:0.2];
                            }
                            break;
                        }
                    }
                }
            }else {
                if (isShow) {
                    switch (showLocation) {
                        case Left:{
                            [self leftAnimationDuration:0.2];
                            break;
                        }
                        case Right:{
                            [self rightAnimationDuration:0.2];
                            break;
                        }
                        case Top:{
                            [self topAnimationDuration:0.2];
                            break;
                        }
                        default:{
                            [self buttomAnimationDuration:0.2];
                            break;
                        }
                    }
                    
                }else {
                    isShow = YES;
                    [self hideMenuDuration:0.2];
                }
            }
            break;
    }
}


#pragma mark Private
/**
 *  判断滑动手势
 */
- (void)judgeDirection{
    if (showLocation == Left || showLocation == Right) {
        if (changePoint.x - beginPoint.x > 0) {
            swipeLocation = SwipeRight;
        }else {
            swipeLocation = SwipeLeft;
        }
    }else {
        if (changePoint.y - beginPoint.y > 0) {
            swipeLocation = SwipeDown;
        }else {
            swipeLocation = SwipeUp;
        }
    }
}


#pragma mark Animation ---- 1
- (void)leftAnimationDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         for (UIView *subView in [self subviews]) {
                             subView.x += (0 - menu.x);
                         }
                     } completion:^(BOOL finished) {
                         isShow = finished;
                         isAnimation = !finished;
                     }];
}

- (void)rightAnimationDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         for (UIView *subView in [self subviews]) {
                             subView.x -= (menu.width - (self.width - menu.x));
                         }
                     } completion:^(BOOL finished) {
                         isShow = finished;
                         isAnimation = !finished;
                     }];
}

- (void)topAnimationDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         for (UIView *subView in [self subviews]) {
                             subView.y += (0 - menu.y);
                         }
                     } completion:^(BOOL finished) {
                         isShow = finished;
                         isAnimation = !finished;
                     }];
}

- (void)buttomAnimationDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         for (UIView *subView in [self subviews]) {
                             subView.y -= (menu.height - (self.height - menu.y));
                         }
                     } completion:^(BOOL finished) {
                         isShow = finished;
                         isAnimation = !finished;
                     }];
}
@end









