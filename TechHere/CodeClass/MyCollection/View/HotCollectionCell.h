//
//  HotCollectionCell.h
//  TechHere
//
//  Created by sam on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLangList_DataModels.h"
@interface HotCollectionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (nonatomic, strong) HotLangList_Data *data;

@end
