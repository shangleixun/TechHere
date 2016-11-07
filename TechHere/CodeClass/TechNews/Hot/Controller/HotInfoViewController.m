//
//  HotInfoViewController.m
//  TechHere
//
//  Created by sam on 2016/10/6.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "HotInfoViewController.h"
#import <WebKit/WebKit.h>
#import "HotdetailCollectManager.h"
#import "MBProgressHUD.h"
@interface HotInfoViewController()<WKUIDelegate,WKNavigationDelegate,UIWebViewDelegate>

@property (nonatomic,strong) WKWebView *wkwebview;
@property (nonatomic,strong) UIWebView *webview;
@property (nonatomic,strong) UIView *coverView;
@property (nonatomic, strong) UIBarButtonItem  *saveItem;
@property (nonatomic, assign) BOOL isSave;
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation HotInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _wkwebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT)];
    [self.wkwebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_articleUrl]]];
    self.wkwebview.opaque = NO;
    self.wkwebview.backgroundColor = [UIColor whiteColor];
    self.wkwebview.UIDelegate = self;
    self.wkwebview.navigationDelegate = self;
    [self.view addSubview:_wkwebview];
   
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        [_wkwebview removeFromSuperview];
        _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT)];
        self.view.backgroundColor = [UIColor iOS7darkGrayColor];
        self.wkwebview.backgroundColor = [UIColor iOS7darkGrayColor];
        [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_articleUrl]]];
        self.webview.opaque = NO;
        self.webview.delegate = self;
        _coverView = [[UIView alloc]initWithFrame:LX_SCREENBOUNDS];
        _coverView.backgroundColor = [UIColor iOS7darkGrayColor];
        [self.view addSubview:_coverView];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
       
    }
    
    [self showHud:@"正在加载..."];
    
    UIImage *theCollect = [UIImage imageNamed:@"collect"];
    self.saveItem = [[UIBarButtonItem alloc] initWithImage:[self originImage:theCollect scaleToSize:CGSizeMake(20, 20)] style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = _saveItem;
    
    for (HotLangList_Data *data in [[HotdetailCollectManager defaultManager] selestData]) {
        if ([_data.aid isEqualToString:data.aid]) {
            
            [_saveItem setTintColor:[UIColor iOS7redColor]];
            
            _isSave = YES;
            break;
        }
    }
    if (_isSave == YES) {
        
    } else {
        [_saveItem setTintColor:[UIColor iOS7darkGrayColor]];
    }
    
    
}

-(void)saveAction{
    
    if (_isSave) {
        [[HotdetailCollectManager defaultManager]deleteDataWithDetailID: _data.aid];
         _saveItem.tintColor = [UIColor iOS7darkGrayColor];
    }
    else {
        [[HotdetailCollectManager defaultManager] createTable];
        [[HotdetailCollectManager defaultManager]insertDataWithMode:_data];
        _saveItem.tintColor = [UIColor iOS7redColor];
    }
    _isSave = !_isSave;
    
}

//加载提示框
-(void)showHud:(NSString*)str{
  
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        [_hud removeFromSuperview];
        _hud = [MBProgressHUD showHUDAddedTo:self.coverView animated:YES];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
    }
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置样式
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = str;
    
    
}


- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    [_hud hideAnimated:YES];
}



- (void)webViewDidFinishLoad:(UIWebView *)webView{
  
    [_hud hideAnimated:YES];
//     [_wkwebview stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='rgba(0,0,0,0)'"];
    [self.view addSubview:_webview];
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
