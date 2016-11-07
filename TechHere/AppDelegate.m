//
//  AppDelegate.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"

#import "CenterViewController.h"
#import "ReviewViewController.h"
#import "HotViewController.h"

#import "MMExampleDrawerVisualStateManager.h"

@interface AppDelegate ()

@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, assign) UIBackgroundTaskIdentifier bgTaskId;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LeftViewController *leftSideDrawerViewController = [[LeftViewController alloc] init];
    
//    CenterViewController *centerViewController = [[CenterViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
//    [navigationController setRestorationIdentifier:@"CenterNavigationControllerRestorationKey"];
    
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
    
    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:tabBarController
                             leftDrawerViewController:leftSideDrawerViewController
                             rightDrawerViewController:nil];
    [self.drawerController setShowsShadow:YES];
    [self.drawerController setShadowColor:[UIColor blackColor]];
    [self.drawerController setShadowOpacity:0.3];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumLeftDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
#pragma - mark 抽屉动画样式的设置
//    [self.drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//         MMDrawerControllerDrawerVisualStateBlock block;
//         block = [[MMExampleDrawerVisualStateManager sharedManager]
//                  drawerVisualStateBlockForDrawerSide:drawerSide];
//         if(block){
//             block(drawerController, drawerSide, percentVisible);
//         }
//     }];
//    
//    [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeNone];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIColor *tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
    [self.window setRootViewController:self.drawerController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //  开启后台处理多媒体事件
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    //  后台播放
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    //  这样做，可以在按 home 键进入后台后，播放一段时间，几分钟吧，但是不能持续播放网络歌曲，若需要持续播放网络歌曲，还需要申请后台任务id，具体做法是：
//    _bgTaskId = [AppDelegate backgroundPlayerID:_bgTaskId];
    //  其中的 _bgTaskId 是后台任务 UIBackgroundTaskIdentifier _bgTaskId;
}

//+ (UIBackgroundTaskIdentifier)backgroundPlayerID:(UIBackgroundTaskIdentifier)backTaskId {
//    //  设置并激活音频会话类别
//    AVAudioSession *session = [AVAudioSession sharedInstance];
//    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
//    [session setActive:YES error:nil];
//    //  允许应用程序接收远程控制
//    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    //  设置后台任务 ID
//    UIBackgroundTaskIdentifier newTaskId = UIBackgroundTaskInvalid;
//    newTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
//    if (newTaskId != UIBackgroundTaskInvalid && backTaskId != UIBackgroundTaskInvalid) {
//        [[UIApplication sharedApplication] endBackgroundTask:backTaskId];
//    }
//    return newTaskId;
//}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
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


@end
