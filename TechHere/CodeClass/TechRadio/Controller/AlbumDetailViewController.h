//
//  AlbumDetailViewController.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/30.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RadioList_DataModels.h"

#import "ZIXUNRIGHT_DataModels.h"
#import "ZIXUNLEFT_DataModels.h"
#import "ZIXUNRIGHTMORE_DataModels.h"

#import "RadioStationHeader.h"
#import "AlbumDetailContentIntroTableViewCell.h"
#import "AlbumDetailAnchorIntroTableViewCell.h"
#import "RadioDetailTableViewCell.h"

#import "AudioPlayerViewController.h"

@interface AlbumDetailViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) RadioList_List *theList;
@property (strong, nonatomic) UITableView *rightTabelView;

@end
