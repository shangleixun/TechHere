//
//  LanguageHeadView.m
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "LanguageHeadView.h"

@implementation LanguageHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setCategory:(HotLang_Category *)category{
    _imagV.yy_imageURL = [NSURL URLWithString:category.image];
    _backimageView.yy_imageURL = [NSURL URLWithString:category.originimage];
    _titleLab.text = category.introduction;
    _coutlab.text = [NSString stringWithFormat:@"共有%@篇文章",category.articlecount];
    _typeLab.text = [NSString stringWithFormat:@"%@ /",category.name];
    
    
}

@end
