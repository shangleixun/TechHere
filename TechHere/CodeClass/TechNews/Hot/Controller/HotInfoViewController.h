//
//  HotInfoViewController.h
//  TechHere
//
//  Created by sam on 2016/10/6.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotLangList_Data.h"

@interface HotInfoViewController : BaseViewController

@property (nonatomic, strong) NSString *articleUrl;
@property (nonatomic, strong) HotLangList_Data *data;
@end
