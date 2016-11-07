//
//  LeftViewController.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftTableViewCell.h"

#import "CenterViewController.h"
#import "ReviewViewController.h"
#import "HotViewController.h"

#import "RadioViewController.h"
#import "CollectionViewController.h"
#import "SettingsViewController.h"

@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tabelView;

@end
