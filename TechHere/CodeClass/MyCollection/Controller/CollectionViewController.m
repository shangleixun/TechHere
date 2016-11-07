//
//  CollectionViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "CollectionViewController.h"



@interface CollectionViewController (){
    UIBarButtonItem *_leftBarButtonItem;
}

@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) NSArray *categoriesArr;
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    
    [self initMenuItem];
    
    [super viewDidLoad];
    _leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
    
}


-(void)viewWillAppear:(BOOL)animated{
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
    
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
       
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
        
        
    }
}


-(void)initMenuItem{
    self.titleSizeNormal = 15;
    self.titleSizeSelected = 18;
    self.titleColorNormal = [UIColor iOS7darkGrayColor];
    self.titleColorSelected = [UIColor iOS7redColor];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.menuItemWidth = 80;
    self.menuHeight = 45;
    
    self.progressWidth = 30;
    self.progressViewIsNaughty = YES;
    self.viewFrame = CGRectMake(0,64, LX_SCREENWIDTH, LX_SCREENHEIGHT);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor iOS7darkGrayColor];
        self.menuBGColor = [UIColor darkTextColor];
        self.titleColorSelected = [UIColor whiteColor];
        self.titleColorNormal = [UIColor iOS7lightGrayColor];
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.menuBGColor = [UIColor iOS7lightGrayColor];
        self.titleColorSelected = [UIColor iOS7redColor];
        self.titleColorNormal = [UIColor darkGrayColor];
        
    }
}



#pragma mark - MMDrawerController的代理方法
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.categoriesArr.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index == 0) {
        HotCollectTableViewController *hotCollectVC = [[HotCollectTableViewController alloc] init];
        return hotCollectVC;
    } else {
        AudioCollectionTableViewController *acTC = [AudioCollectionTableViewController new];
        return acTC;
    }
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.categoriesArr[index];
}



- (NSArray *)categoriesArr {
    if (!_categoriesArr) {
        _categoriesArr = @[@"文章", @"音乐"];
    }
    return _categoriesArr;
}

- (void)itemAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
