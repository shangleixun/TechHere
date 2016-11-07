//
//  BookDetailViewController.h
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EvernoteDetailControllerDelegate <NSObject>

- (void)detailGoBack;

@end
@interface BookDetailViewController : UIViewController

@property (nonatomic ,weak) id<EvernoteDetailControllerDelegate>delegate;

@property (nonatomic, strong) NSString *docId;

@property (nonatomic, strong) NSString *urlStr;

@end
