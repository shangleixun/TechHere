//
//  AudioCollectCell.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/14.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AudioCollectCell.h"

@implementation AudioCollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame {
    self.coverImageView.layer.cornerRadius = 31.5;
    self.coverImageView.layer.masksToBounds = YES;
    self.frontgroudView.layer.cornerRadius = 31.5;
    self.frontgroudView.layer.masksToBounds = YES;
    [super setFrame:frame];
}

@end
