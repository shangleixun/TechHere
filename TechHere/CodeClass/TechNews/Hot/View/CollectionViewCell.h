//
//  CollectionViewCell.h
//  TechHere
//
//  Created by sam on 2016/10/6.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLang_Category.h"
#import "HotSpecial_Data.h"
#import "HotTopic_DataModels.h"

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@property (nonatomic, strong)HotLang_Category *category;
@property (nonatomic, strong)HotSpecial_Data *data;
@property (nonatomic, strong)HotTopic_Data *topicData;
@end
