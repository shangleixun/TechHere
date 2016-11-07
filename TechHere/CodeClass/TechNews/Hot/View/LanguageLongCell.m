//
//  LanguageLongCell.m
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "LanguageLongCell.h"

@implementation LanguageLongCell

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
    [_picImage setTintColor:[UIColor whiteColor]];
}
//重写cell的大小框架
//-(void)setFrame:(CGRect)frame
//{
////    frame.origin.x =10;//这里间距为10，可以根据自己的情况调整
////    frame.size.width -= 2 * frame.origin.x;
//    frame.size.height -= 5;
//    [super setFrame:frame];
//}


@end
