//
//  HotTableViewCell.h
//  TechHere
//
//  Created by sam on 2016/10/6.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLang_Article.h"

@interface HotTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *timesLab;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;


@property(nonatomic, strong) HotLang_Article *article;

@end
