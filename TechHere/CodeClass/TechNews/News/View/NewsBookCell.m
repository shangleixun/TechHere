//
//  NewsBookCell.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "NewsBookCell.h"

@implementation NewsBookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7;
        
        
    }
    return self;
}




- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 7;
    }
    return self;
}

- (void)setList:(NewsBookList_List *)list{
    
    _imageV.yy_imageURL = [NSURL URLWithString:list.pic];
    _titleLab.text = list.title;
}

- (void)setHotList:(NewsHotList_List *)hotList{
    _imageV.yy_imageURL = [NSURL URLWithString:hotList.imgsrc];
    _titleLab.text = hotList.stitle;
}
@end
