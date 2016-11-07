//
//  LeftViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController () {
    NSMutableArray *_iconArr;
    NSMutableArray *_titleArr;
    UILabel *_techHereLabel;
}

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor iOS7lightGrayColor];
    _iconArr = [@[[UIImage imageNamed:@"techNews"], [UIImage imageNamed:@"techRadio"], [UIImage imageNamed:@"myCollection"], [UIImage imageNamed:@"settings"]] mutableCopy];
    _titleArr = [@[@"资讯", @"电台", @"收藏", @"设置"] mutableCopy];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _techHereLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 17, 200, 64)];
    _techHereLabel.text = @"TechHere";
    _techHereLabel.font = [UIFont boldSystemFontOfSize:20];
    _techHereLabel.textColor = [UIColor iOS7redColor];

    _techHereLabel.textAlignment = NSTextAlignmentCenter;
    
    _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, LX_SCREENWIDTH, LX_SCREENHEIGHT) style:UITableViewStylePlain];

    _tabelView.bounces = NO;
    _tabelView.bouncesZoom = NO;
    [_tabelView registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    _tabelView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
    
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    
    [self.view addSubview:_techHereLabel];
    [self.view addSubview:_tabelView];
    
}


-(void)viewWillAppear:(BOOL)animated{
//    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor:)  name:@"changeColor" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        _tabelView.backgroundColor = [UIColor blackColor];
        _techHereLabel.backgroundColor = [UIColor blackColor];
        _techHereLabel.textColor = [UIColor yellowColor];
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _tabelView.backgroundColor = [UIColor iOS7lightGrayColor];
        _techHereLabel.backgroundColor = [UIColor whiteColor];
        _techHereLabel.textColor = [UIColor iOS7redColor];
        
    }
    [_tabelView reloadData];
    
}

//- (void)changeColor:(NSNotification*)nati{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
//        _tabelView.backgroundColor = [UIColor darkGrayColor];
//        _techHereLabel.backgroundColor = [UIColor iOS7darkGrayColor];
////        _techHereLabel.textColor = [UIColor whiteColor];
//    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
//        _tabelView.backgroundColor = [UIColor iOS7lightGrayColor];
//        _techHereLabel.backgroundColor = [UIColor whiteColor];
////        _techHereLabel.textColor = [UIColor iOS7redColor];
//    }
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _iconArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.iconImageView.image = _iconArr[indexPath.row];
    cell.titleLabel.text = _titleArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        cell.backgroundColor = [UIColor blackColor];
        cell.titleLabel.textColor = [UIColor iOS7lightGrayColor];
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        cell.backgroundColor = [UIColor whiteColor];
        cell.titleLabel.textColor = [UIColor blackColor];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            CenterViewController *centerVC = [CenterViewController new];
            UINavigationController *centerNavi = [[UINavigationController alloc] initWithRootViewController:centerVC];
            centerNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[self handleTabImage:@"newsNormal"] selectedImage:[self handleTabImage:@"newsHighlight"]];
            
            ReviewViewController *reviewVC = [ReviewViewController new];
            UINavigationController *reviewNavi = [[UINavigationController alloc] initWithRootViewController:reviewVC];
            reviewNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"评测" image:[self handleTabImage:@"reviewNormal"] selectedImage:[self handleTabImage:@"reviewHighlight"]];
            
            HotViewController *hotVC = [HotViewController new];
            UINavigationController *hotNavi = [[UINavigationController alloc] initWithRootViewController:hotVC];
            hotNavi.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"学习" image:[self handleTabImage:@"hotNormal"] selectedImage:[self handleTabImage:@"hotHighlight"]];
            
            UITabBarController *tabBarController = [[UITabBarController alloc] init];
            //  默认高度为 49
            tabBarController.viewControllers = @[centerNavi, reviewNavi, hotNavi];
            
            //  这个改变的是选中后的颜色
            tabBarController.tabBar.tintColor = [UIColor iOS7redColor];
            //  这个改变的背景色
            //  tabBarController.tabBar.barTintColor = [UIColor redColor];
            
            //  tabBarController.tabBar.backgroundColor = [UIColor magentaColor];
            //  设置透明度
            tabBarController.tabBar.translucent = NO;
            
            [self.mm_drawerController setCenterViewController:tabBarController withCloseAnimation:YES completion:nil];
        }
            
            break;
        case 1: {
            RadioViewController *radioVC = [RadioViewController new];
            UINavigationController *radioNavi = [[UINavigationController alloc] initWithRootViewController:radioVC];
            [self.mm_drawerController setCenterViewController:radioNavi withCloseAnimation:YES completion:nil];
        }
            break;
            
        case 2: {
            CollectionViewController *collectionVC = [CollectionViewController new];
            UINavigationController *collectionNavi = [[UINavigationController alloc] initWithRootViewController:collectionVC];
            [self.mm_drawerController setCenterViewController:collectionNavi withCloseAnimation:YES completion:nil];
        }
            break;
            
        case 3: {
            SettingsViewController *settingsVC = [SettingsViewController new];
            UINavigationController *settingsNavi = [[UINavigationController alloc] initWithRootViewController:settingsVC];
            [self.mm_drawerController setCenterViewController:settingsNavi withCloseAnimation:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
}

- (UIImage*)originImage:(UIImage *)image scaleToSize:(CGSize)size {
    //  下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
    //  返回的就是已经改变的图片
}

- (UIImage *)handleTabImage:(NSString *)imageName {
    UIImage *image0 = [UIImage imageNamed:imageName];
    UIImage *image1 = [self originImage:image0 scaleToSize:CGSizeMake(24, 24)];
    UIImage *image2 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image2;
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
