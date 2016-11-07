//
//  CollectionViewCell.m
//  TechHere
//
//  Created by sam on 2016/10/6.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setCategory:(HotLang_Category *)category{
    _imageV.yy_imageURL = [NSURL URLWithString:category.image];
    _nameLab.text = category.name;
}

-(void)setData:(HotSpecial_Data *)data{
    _imageV.yy_imageURL = [NSURL URLWithString:data.image];
    _nameLab.text = data.name;
}

-(void)setTopicData:(HotTopic_Data *)topicData{
    _imageV.yy_imageURL = [NSURL URLWithString:topicData.image];
    _nameLab.text = topicData.name;
}



@end
