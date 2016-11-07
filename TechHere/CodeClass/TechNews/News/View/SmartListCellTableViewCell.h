//
//  SmartListCellTableViewCell.h
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsSmartList_List.h"

@interface SmartListCellTableViewCell : UITableViewCell

@property (nonatomic, strong)NewsSmartList_List *list;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *commentLa;

@end
