//
//  UIView+Menu.h
//  SideslipMenu
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 SUWQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Left,
    Right,
    Top,
    Buttom
}Location;

@interface UIView (Menu)
/**
 *  添回菜单视图
 *
 *  @param view         菜单视图
 *  @param location     菜单出现方向
 *  @param allowGesture 允许手势滑动
 */
- (void)addMenu:(UIView *)view
       location:(Location)location
   allowGesture:(BOOL)allowGesture;

/**
 *  弹出菜单
 *
 *  @param duration 动画时间
 */
- (void)showWithDuration:(NSTimeInterval)duration;

/**
 *  收菜单
 *
 *  @param duration 动画时间
 */
- (void)hideMenuDuration:(NSTimeInterval)duration;
@end










