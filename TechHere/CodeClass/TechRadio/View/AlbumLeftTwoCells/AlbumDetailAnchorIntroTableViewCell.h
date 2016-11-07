//
//  AlbumDetailAnchorIntroTableViewCell.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/8.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumDetailAnchorIntroTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *aboutTheAnchorLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likedCountsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isVerified;
@property (weak, nonatomic) IBOutlet UILabel *introContentLabel;

@end
