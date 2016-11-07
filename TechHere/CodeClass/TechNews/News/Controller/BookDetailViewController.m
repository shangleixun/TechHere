//
//  BookDetailViewController.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "BookDetailViewController.h"
#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
@interface BookDetailViewController ()<WKUIDelegate,WKNavigationDelegate>

@property (strong, nonatomic) UIView *backGroundView;
@property (strong, nonatomic) WKWebView *wkwebview;
@property (nonatomic, strong) MBProgressHUD    *hud;

@end

@implementation BookDetailViewController

#pragma - mark View 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
   
    [self initBackGroundView];
    
    
    
    
    
    
}

//判断数据源是从其一界面哪个分区传来的,不同的分区数据不一样
- (void)viewWillAppear:(BOOL)animated{

   
    if (_docId) {
        [self dataHandle];
    }else{
        _wkwebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, -89, LX_SCREENWIDTH - 10, LX_SCREENHEIGHT-35+89)];
        [self.wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
        _wkwebview.navigationDelegate = self;
        _wkwebview.UIDelegate = self;
        [self.backGroundView addSubview:_wkwebview];
        [self showHud:@"正在加载..."];
        [self initButten];
    }
    [self hideTabBar];
}


#pragma  - mark 加载UI

- (void)initBackGroundView{
    self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(5, 25, LX_SCREENWIDTH - 10, LX_SCREENHEIGHT-35)];
    self.backGroundView.backgroundColor =[UIColor whiteColor];
    self.backGroundView.layer.masksToBounds = YES;
    self.backGroundView.layer.cornerRadius = 7;
    self.backGroundView.userInteractionEnabled = YES;
    [self.view addSubview:_backGroundView];
}

- (void)initButten{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(LX_SCREENWIDTH-90, LX_SCREENHEIGHT-100, 50, 50)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    btn.clipsToBounds = YES;
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //设置butten阴影
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe=btn.layer.frame;
    fixframe.size.width=50;
    subLayer.frame=fixframe;
    subLayer.cornerRadius=25;
    subLayer.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    subLayer.masksToBounds=NO;
    subLayer.shadowColor=[UIColor blackColor].CGColor;
    subLayer.shadowOffset=CGSizeMake(3,5);
    subLayer.shadowOpacity=0.8;
    subLayer.shadowRadius=5;
    [self.view.layer insertSublayer:subLayer below:btn.layer];
    
    
 
}

    //隐藏底部tableBar
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
- (void)showHud:(NSString*)str{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置样式
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = str;
    
}



#pragma - mark 数据处理

- (void)dataHandle{
    NSString *urlStr = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/comment/comment_201403.php?id=%d&vs=iph391",(int)[_docId intValue]];
   
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                
                _wkwebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, -89, LX_SCREENWIDTH - 10, LX_SCREENHEIGHT-35+89)];
                [self.wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:dic[@"url"]]]];
                _wkwebview.navigationDelegate = self;
                _wkwebview.UIDelegate = self;
                [self.backGroundView addSubview:_wkwebview];
                [self showHud:@"正在加载..."];
                [self initButten];
                
            });
        }
        
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
    
}


- (void) webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [_hud hideAnimated:YES];
}

#pragma - mark 点击时间

- (void)back{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
