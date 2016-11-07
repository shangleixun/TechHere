//
//  AlbumListTableViewCell.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/14.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCountsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tracksLabel;
@property (weak, nonatomic) IBOutlet UIView *outsideSubView;
@property (weak, nonatomic) IBOutlet UIView *outsideView;

@end
