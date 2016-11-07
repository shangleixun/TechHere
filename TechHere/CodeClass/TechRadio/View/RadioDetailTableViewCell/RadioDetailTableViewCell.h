//
//  RadioDetailTableViewCell.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/8.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *frontgroudView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountsLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountsLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@end
