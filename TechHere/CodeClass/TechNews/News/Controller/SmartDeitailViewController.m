//
//  SmartDeitailViewController.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SmartDeitailViewController.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
@interface SmartDeitailViewController ()<WKUIDelegate,WKNavigationDelegate>


@property (strong, nonatomic) WKWebView *wkwebview;
@property (nonatomic, strong) MBProgressHUD    *hud;

@end

@implementation SmartDeitailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _wkwebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, -69, LX_SCREENWIDTH , LX_SCREENHEIGHT+69)];
    [self.wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    _wkwebview.navigationDelegate = self;
    _wkwebview.UIDelegate = self;
    [self.view addSubview:_wkwebview];
    [self showHud:@"正在加载..."];
}

//加载提示框
- (void)showHud:(NSString*)str{
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
