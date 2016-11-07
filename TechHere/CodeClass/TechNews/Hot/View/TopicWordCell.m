//
//  TopicWordCell.m
//  TechHere
//
//  Created by sam on 2016/10/9.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "TopicWordCell.h"

@implementation TopicWordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        frame.size.height -= 10;
        self.backgroundColor = [UIColor iOS7lightGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.backgroundColor = [UIColor whiteColor];
    }
    
    [super setFrame:frame];
}

-(void)setData:(HotTopicDetail_Data *)data{
    _headPic.yy_imageURL = [NSURL URLWithString:data.pimg];
    _nameLab.text = data.username;
    _conntentLab.text = data.content;
    
  
    NSTimeInterval time=[data.ctime doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
   
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    _timeLab.text = currentDateStr;
}

@end
