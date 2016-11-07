//
//  BaseViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (){
    UIBarButtonItem *_backBarButtonItem;
}

@end

@implementation BaseViewController

- (instancetype)init {
    if (self = [super init]) {
        _backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back03"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction)];
        _backBarButtonItem.tintColor = [UIColor iOS7pinkColor];
        self.navigationItem.leftBarButtonItem = _backBarButtonItem;
        
          NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            _backBarButtonItem.tintColor = [UIColor blackColor];
            
        }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
            _backBarButtonItem.tintColor = [UIColor iOS7pinkColor];
            
        }
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor:)  name:@"changeColor" object:nil];
        
    }
    return self;
    
}
    
- (void)leftBarButtonItemAction {
        [self.navigationController popViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
 
    


- (void)changeColor:(NSNotification*)natiction{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        _backBarButtonItem.tintColor = [UIColor blackColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _backBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    }
  
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
