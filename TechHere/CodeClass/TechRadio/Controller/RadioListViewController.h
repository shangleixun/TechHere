//
//  RadioListViewController.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/29.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumListTableViewCell.h"
#import "RadioList_DataModels.h"

#import "AlbumDetailViewController.h"

@interface RadioListViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *mainTableView;
@property (strong, nonatomic) NSString *theTitle;
@property (assign, nonatomic) double keywordID;


@end
