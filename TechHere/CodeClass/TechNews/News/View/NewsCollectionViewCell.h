//
//  NewsCollectionViewCell.h
//  TechHere
//
//  Created by sam on 2016/10/9.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) NSDictionary *dic;
@end
