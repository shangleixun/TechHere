//
//  BookListViewController.h
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookListViewController : BaseViewController
@property (nonatomic, strong) NSString *Classid;
@property (nonatomic, assign) BOOL isBook;
@property (nonatomic, strong) NSString *dataStr;

@end
