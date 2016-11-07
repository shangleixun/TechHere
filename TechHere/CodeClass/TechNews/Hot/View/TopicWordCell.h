//
//  TopicWordCell.h
//  TechHere
//
//  Created by sam on 2016/10/9.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotTopicDetail_Data.h"

@interface TopicWordCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *headPic;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@property (weak, nonatomic) IBOutlet UILabel *conntentLab;

@property (nonatomic, strong) HotTopicDetail_Data *data;
@end
