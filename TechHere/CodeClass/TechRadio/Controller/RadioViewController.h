//
//  RadioViewController.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RadioListViewController.h"

#import "RadioMainCollectionViewCell.h"
#import "Total_DataModels.h"

#import "SDCycleScrollView.h"

@interface RadioViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, SDCycleScrollViewDelegate>

@property (strong, nonatomic) UICollectionView *mainCollectionView;

@end
