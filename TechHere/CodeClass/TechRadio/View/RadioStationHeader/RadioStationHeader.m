//
//  RadioStationHeader.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/8.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "RadioStationHeader.h"

@implementation RadioStationHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setFrame:(CGRect)frame {
    self.backgroundView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.backgroundView.layer.shadowOffset = CGSizeMake(1, 3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backgroundView.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.backgroundView.layer.shadowRadius = 3.0;//阴影半径，默认3
    [super setFrame:frame];
}

+ (instancetype)radioStationHeader {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
