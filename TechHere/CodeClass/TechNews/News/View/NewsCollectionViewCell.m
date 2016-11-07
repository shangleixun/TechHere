//
//  NewsCollectionViewCell.m
//  TechHere
//
//  Created by sam on 2016/10/9.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "NewsCollectionViewCell.h"

@implementation NewsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//-(void)setFrame:(CGRect)frame
//{
//    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//    self.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
//    self.layer.shadowRadius = 4;//阴影半径，默认3
// 
//    [super setFrame:frame];
//}


- (void)setDic:(NSDictionary *)dic{

    _imageV.image = [UIImage imageNamed:dic[@"pic"]];
    _titleLab.text = dic[@"name"];
}
@end
