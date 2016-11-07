//
//  ReTableViewCell.h
//  TechHere
//
//  Created by sam on 2016/9/29.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReList_DataModels.h"

@interface ReTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *commentLab;


@property (nonatomic, strong) ReList_List *list;

@end
