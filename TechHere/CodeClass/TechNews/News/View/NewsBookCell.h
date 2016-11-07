//
//  NewsBookCell.h
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsBookList_List.h"
#import "NewsHotList_List.h"

@interface NewsBookCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titileLeadingCons;
//@property (nonatomic , strong) NSLayoutConstraint * horizonallyCons;

@property (nonatomic, strong) NewsBookList_List *list;
@property (nonatomic, strong) NewsHotList_List *hotList;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end
