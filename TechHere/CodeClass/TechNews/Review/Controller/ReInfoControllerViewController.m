//
//  ReInfoControllerViewController.m
//  TechHere
//
//  Created by sam on 2016/9/29.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "ReInfoControllerViewController.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"

@interface ReInfoControllerViewController ()<WKNavigationDelegate>

@property(nonatomic,strong)WKWebView *wkwebview;
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation ReInfoControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",_articleUrl);
    self.automaticallyAdjustsScrollViewInsets = NO;

    _wkwebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, -69, LX_SCREENWIDTH, LX_SCREENHEIGHT +69)];
    [self.wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_articleUrl]]];
    self.wkwebview.navigationDelegate = self;
    [self.view addSubview:_wkwebview];
    [self showHud:@"正在加载..."];
    
}


//隐藏底部栏
- (void)viewWillAppear:(BOOL)animated{
    [self hideTabBar];
}



- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}

//加载提示框
-(void)showHud:(NSString*)str{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置样式
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = str;
    
    
}


- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    [_hud hideAnimated:YES];
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
