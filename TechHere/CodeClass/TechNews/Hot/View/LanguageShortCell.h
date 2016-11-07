//
//  LanguageShortCell.h
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLangList_Data.h"

@interface LanguageShortCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *viewLab;

@property (weak, nonatomic) IBOutlet UILabel *likeLab;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;



@property(nonatomic,strong)HotLangList_Data *data;
@end
