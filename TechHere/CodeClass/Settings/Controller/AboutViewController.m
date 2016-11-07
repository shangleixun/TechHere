//
//  AboutViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/14.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)viewWillAppear:(BOOL)animated{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor darkGrayColor];
        _titleLab.textColor = [UIColor lightGrayColor];
        _contentLab.textColor = [UIColor iOS7darkGrayColor];
        

    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        self.view.backgroundColor = [UIColor whiteColor];
         _titleLab.textColor = [UIColor iOS7redColor];
         _contentLab.textColor = [UIColor blackColor];
        
    }
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
