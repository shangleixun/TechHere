//
//  EvernoteTransition.h
//  EvernoteAnimation
//
//  Created by WangXuesen on 16/7/14.
//  Copyright © 2016年 Jsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BookDetailViewController.h"
#import "NewsBookCell.h"
@interface EvernoteTransition : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,EvernoteDetailControllerDelegate>

@property (nonatomic , assign) BOOL isPresent;

@property (nonatomic , strong) NewsBookCell * selectCell;

@property (nonatomic , strong) NSArray * visibleCells;

@property (nonatomic , assign) CGRect originFrame;

@property (nonatomic , assign) CGRect finalFrame;

@property (nonatomic , strong) UIViewController * panViewController;

@property (nonatomic , strong) UIViewController * listViewController;

@property (nonatomic , strong) UIPercentDrivenInteractiveTransition * interactionController;
- (void)evernoteTransitionWithSelectCell:(NewsBookCell *)selectCell visibleCells:(NSArray *)visibleCells originFrame:(CGRect)originFrame finalFrame:(CGRect)finalFrame panViewController:(UIViewController *)panVC listViewController:(UIViewController *)listVC;


@end
