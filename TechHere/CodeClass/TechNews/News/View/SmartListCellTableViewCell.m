//
//  SmartListCellTableViewCell.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SmartListCellTableViewCell.h"

@implementation SmartListCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

//重写cell的大小框架
-(void)setFrame:(CGRect)frame
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.layer.shadowRadius = 4;//阴影半径，默认3
    frame.origin.x =10;//这里间距为10，可以根据自己的情况调整
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 2 * frame.origin.x;
    [super setFrame:frame];
}

- (void)setList:(NewsSmartList_List *)list{
    _imageV.yy_imageURL = [NSURL URLWithString:list.imgsrc2];
    _titleLab.text = list.stitle;
    _commentLa.text =[NSString stringWithFormat:@"%d",(int)list.commentNum] ;
}

@end
