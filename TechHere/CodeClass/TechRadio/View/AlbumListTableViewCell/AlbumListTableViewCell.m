//
//  AlbumListTableViewCell.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/14.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AlbumListTableViewCell.h"

@implementation AlbumListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect {
    
}

- (void)setFrame:(CGRect)frame {
    self.outsideView.layer.shadowColor = [UIColor blackColor].CGColor;
    //  shadowColor阴影颜色
    self.outsideView.layer.shadowOffset = CGSizeMake(1, 3);
    //  shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.outsideView.layer.shadowOpacity = 0.2;
    //  阴影透明度，默认0
    self.outsideView.layer.shadowRadius = 3.0;
    //  阴影半径，默认3
    
//    self.outsideSubView.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.outsideSubView.layer.shadowOffset = CGSizeMake(- 1, - 1);
//    self.outsideSubView.layer.shadowOpacity = 0.2;
//    self.outsideSubView.layer.shadowRadius = 3.0;
    
    //    frame.origin.x = 10;//这里间距为10，可以根据自己的情况调整
    //    frame.size.width -= 2 * frame.origin.x;
    //    frame.size.height -= 2 * frame.origin.x;
    
    [super setFrame:frame];
}

@end
