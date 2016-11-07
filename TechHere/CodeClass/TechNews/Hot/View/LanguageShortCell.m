//
//  LanguageShortCell.m
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "LanguageShortCell.h"

@implementation LanguageShortCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(HotLangList_Data *)data{
    _imageV.yy_imageURL = [NSURL URLWithString:data.pic];
    _titleLab.text = data.title;
    _viewLab.text = data.view;
    _likeLab.text = data.praise;
}

-(void)setFrame:(CGRect)frame
{
    
    _imageV.layer.shadowColor = [UIColor grayColor].CGColor;//shadowColor阴影颜色
    _imageV.layer.shadowOffset = CGSizeMake(2,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    _imageV.layer.shadowOpacity = 0.5;//阴影透明度，默认0
    _imageV.layer.shadowRadius = 4;
    [super setFrame:frame];
}

@end
