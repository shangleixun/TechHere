//
//  LanguageHeadView.h
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLang_Category.h"

@interface LanguageHeadView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backimageView;

@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UILabel *coutlab;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *imagV;

@property (nonatomic, strong) HotLang_Category *category;

@end
