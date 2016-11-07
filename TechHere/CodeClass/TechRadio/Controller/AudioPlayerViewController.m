//
//  AudioPlayerViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AudioPlayerViewController.h"

@interface AudioPlayerViewController ()

@property (nonatomic, strong) AudioPlayerManager *playManager;
@property (nonatomic, strong) UIBarButtonItem *collect;
@property (assign, nonatomic, getter=isCollected) BOOL collected;
@property (strong, nonatomic) AudioItemCollectionDataBaseManager *dbManager;
@property (strong, nonatomic) NSArray *allCollectedAudioItem;
@property (strong, nonatomic) NSTimer *theTimer;
@property (assign, nonatomic) BOOL isDraggingTheSlider;

@property (assign, nonatomic) NSInteger first;

@end

@implementation AudioPlayerViewController

- (void)setupUISliderAppearence {
    UIImage *minImage = [[UIImage imageNamed:@"minimumTrackImageHighLighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20) resizingMode:UIImageResizingModeStretch];
    
    UIImage *image1 = [UIImage imageNamed:@"sliderThumbNormal"];
    UIImage *image2 = [UIImage imageNamed:@"sliderThumbHighlighted"];
    [[UISlider appearance] setThumbImage:[self originImage:image1 scaleToSize:CGSizeMake(10, 10)] forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:[self originImage:image2 scaleToSize:CGSizeMake(32, 32)] forState:UIControlStateHighlighted];
    
    [[UISlider appearance] setMinimumTrackTintColor:[UIColor iOS7darkGrayColor]];
    [[UISlider appearance] setMaximumTrackTintColor:[UIColor iOS7lightGrayColor]];
    [[UISlider appearance] setMinimumTrackImage:minImage forState:UIControlStateHighlighted];
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

//  从后台关掉应用时会走这个方法
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    
    [_theTimer invalidate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    NSUserDefaults *theDefaults = [NSUserDefaults standardUserDefaults];
    if ([[theDefaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor blackColor];
        self.currentTimeLabel.textColor = [UIColor iOS7yellowColor];
        self.totalTimeLabel.textColor = [UIColor iOS7yellowColor];
    }
    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUISliderAppearence];
    
    //  设置封面图片的切换
    [self setTheCoverAndTotalTime];
    //  设置播放进度条归零及最大值
    [self handleTheProgressSlider];
    
    self.playManager = [AudioPlayerManager defaultManager];
    _playManager.selectIndex = _selectedIndex;
    _playManager.audioItemsArray = _audioItemsArray;
    
    [self initCurrentTimeLabelText];
    
    UIImage *theCollect = [UIImage imageNamed:@"collect"];
    self.collect = [[UIBarButtonItem alloc] initWithImage:[self originImage:theCollect scaleToSize:CGSizeMake(20, 20)] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonAction)];
    
    self.dbManager = [AudioItemCollectionDataBaseManager theManager];
    self.allCollectedAudioItem = [_dbManager selectData];
    if (_allCollectedAudioItem.count > 0) {
        [self isThisAudioInCollection];
    } else {
        [self setRightBarButtonItemColor:[UIColor iOS7darkGrayColor]];
    }
    
    //  处理中断事件的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInterreption:) name:AVAudioSessionInterruptionNotification object:[AVAudioSession sharedInstance]];
    //  处理播放结束的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    self.first = 1;
}


- (void)initCurrentTimeLabelText {
    CGFloat realCurrentTimeValue = _playManager.player.currentItem.currentTime.value / _playManager.player.currentItem.currentTime.timescale;
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(realCurrentTimeValue / 60.0), (int)realCurrentTimeValue % 60];
}


#pragma mark - 进度条处理和 action
- (void)handleTheProgressSlider {
    ZIXUNRIGHT_List *list = _audioItemsArray[_selectedIndex];
    [_playProgressSlider setValue:0];
    [_playProgressSlider setMaximumValue:list.duration];
}

//  拖动有两种，一种是播放时拖动，一种是暂停时拖动
- (IBAction)tapSliderAction:(UISlider *)sender {
    [_theTimer setFireDate:[NSDate distantFuture]];
    CGFloat currentValue = sender.value;
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(currentValue / 60.0), (int)currentValue % 60];
}

- (IBAction)tapSliderUp:(UISlider *)sender
{
    NSLog(@"sender.value_____%.f", sender.value);
    [_playManager seekToTime:sender.value];
    [_theTimer setFireDate:[NSDate date]];
    //  这里拉动进度条完成后 touchUpInside 需要重新配置
    [self configNowPlayingInfoCenter];
}

#pragma mark - 上一首 下一首 播放、暂停
- (IBAction)lastItem:(id)sender {
    
    
    [_playManager lastAudioItem];
    [self initCurrentTimeLabelText];

    if (_playManager.isPlay == YES) {
        [_playManager play];
    } else {
        [_playManager pause];
    }
    
    _selectedIndex -= 1;
    if (_selectedIndex < 0) {
        _selectedIndex = _audioItemsArray.count - 1;
    }
    [self setTheCoverAndTotalTime];
    [self isThisAudioInCollection];
    [self handleTheProgressSlider];
    
    dispatch_queue_t queue = dispatch_queue_create("kkk", DISPATCH_QUEUE_CONCURRENT);
    // 异步，创建了一个分线程
    dispatch_async(queue, ^{
        
        [self configNowPlayingInfoCenter];
        
        NSLog(@"currentThread__%@", [NSThread currentThread]);
        NSLog(@"1111___%d",[NSThread isMainThread]);
    });
}

- (IBAction)nextItem:(id)sender {
    
    
    
    [_playManager nextAudioItem];
    [self initCurrentTimeLabelText];
    
    if (_playManager.isPlay == YES) {
        [_playManager play];
    } else {
        [_playManager pause];
    }
    
    _selectedIndex += 1;
    if (_selectedIndex > _audioItemsArray.count - 1) {
        _selectedIndex = 0;
    }
    [self setTheCoverAndTotalTime];
    [self isThisAudioInCollection];
    [self handleTheProgressSlider];
    
    dispatch_queue_t queue = dispatch_queue_create("kkk", DISPATCH_QUEUE_CONCURRENT);
    // 异步，创建了一个分线程
    dispatch_async(queue, ^{
        
        [self configNowPlayingInfoCenter];
        
        NSLog(@"currentThread__%@", [NSThread currentThread]);
        NSLog(@"1111___%d",[NSThread isMainThread]);
    });
}

//  点击播放按钮时，有三种情况：直接播放，暂停后播放，拖动后播放
- (IBAction)playOrPause:(id)sender {
    
    dispatch_queue_t queue = dispatch_queue_create("kkk", DISPATCH_QUEUE_CONCURRENT);
    // 异步，创建了一个分线程
    dispatch_async(queue, ^{
    
        [self configNowPlayingInfoCenter];
        
        NSLog(@"currentThread__%@", [NSThread currentThread]);
        NSLog(@"1111___%d",[NSThread isMainThread]);
    });

    
    
    if (_playManager.isPlay == NO) {
        [_playOrPauseButton setImage:[UIImage imageNamed:@"thePause"] forState:UIControlStateNormal];
        [_playManager play];
        self.theTimer = [NSTimer timerWithTimeInterval:0.1f target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_theTimer forMode:NSDefaultRunLoopMode];
        
    } else if (_playManager.isPlay == YES) {
        [_playOrPauseButton setImage:[UIImage imageNamed:@"thePlay"] forState:UIControlStateNormal];
        [_theTimer invalidate];
        [_playManager pause];
    }
    
}

#pragma mark - 定时器的处理
- (void)timerHandle {
    [_playProgressSlider setValue:_playManager.currentTime];
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(_playManager.currentTime / 60.0), (int)_playManager.currentTime % 60];
}

#pragma mark - 便利的方法
- (void)rightBarButtonAction {
    if (_collected == YES) {
        [self setRightBarButtonItemColor:[UIColor iOS7darkGrayColor]];
        ZIXUNRIGHT_List *list = _audioItemsArray[_selectedIndex];
        [_dbManager deleteDataWithAudioTrackID:list.trackId];
    } else {
        [self setRightBarButtonItemColor:[UIColor iOS7redColor]];
        [_dbManager createTable];
        [_dbManager insertDataWithMode:_audioItemsArray[_selectedIndex]];
    }
    _collected = !_collected;
}

- (void)setRightBarButtonItemColor:(UIColor *)theColor {
    [_collect setTintColor:theColor];
    self.navigationItem.rightBarButtonItem = _collect;
}

- (void)setTheCoverAndTotalTime {
    ZIXUNRIGHT_List *list = _audioItemsArray[_selectedIndex];
    self.navigationItem.title = list.title;
    _coverImageView.yy_imageURL = [NSURL URLWithString:list.coverLarge];
    _totalTimeLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(list.duration / 60.0), ((int)list.duration) % 60];
}

- (void)isThisAudioInCollection {
    self.collected = NO;
    ZIXUNRIGHT_List *list = _audioItemsArray[_selectedIndex];
    for (ZIXUNRIGHT_List *allList in _allCollectedAudioItem) {
        if (allList.trackId == list.trackId) {
            _collected = YES;
            break;
        }
    }
    if (_collected == YES) {
        [self setRightBarButtonItemColor:[UIColor iOS7redColor]];
    } else {
        [self setRightBarButtonItemColor:[UIColor iOS7darkGrayColor]];
        _collected = NO;
    }
}

- (void)leftBarButtonItemAction {
    [self.navigationController popViewControllerAnimated:YES];
    if (self.refreshTableBlock) {
        self.refreshTableBlock();
    }
}

#pragma mark - 以下是远程控制和锁屏界面的处理
//  接受远程控制
- (void)remoteControlReceivedWithEvent:(UIEvent *)receivedEvent {
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        switch (receivedEvent.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                [self playOrPause:receivedEvent];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                [self nextItem:receivedEvent];
                [self configNowPlayingInfoCenter];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                [self lastItem:receivedEvent];
                [self configNowPlayingInfoCenter];
                break;
            case UIEventSubtypeRemoteControlPlay:
                [self playOrPause:receivedEvent];
                [self configNowPlayingInfoCenter];
                break;
            case UIEventSubtypeRemoteControlPause: {
                [self playOrPause:receivedEvent];
                [self configNowPlayingInfoCenter];
            }
                break;
            default:
                break;
        }
    }
}

//  处理中断事件
- (void)handleInterreption:(NSNotification *)sender {
    if (_playManager.isPlay) {
        [_playManager pause];
    } else {
        [_playManager play];
    }
}
//  处理播放完成
- (void)handlePlayToEnd:(NSNotification *)sender {
    [self nextItem:sender];
    [self configNowPlayingInfoCenter];
}
//  配置现在正在播放中心的信息
- (void)configNowPlayingInfoCenter {
    
    ZIXUNRIGHT_List *list = _audioItemsArray[_selectedIndex];
    
    dispatch_queue_t queue = dispatch_queue_create("kkk", DISPATCH_QUEUE_CONCURRENT);
    
    // 异步，创建了一个分线程
    
    dispatch_async(queue, ^{
        
        UIImage *theCover = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:list.coverLarge]]];
        
        NSLog(@"currentThread__%@", [NSThread currentThread]);
        NSLog(@"1111___%d",[NSThread isMainThread]);
        
        if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
            NSLog(@"如果进来这里了，打印一个");
            NSMutableDictionary *playingInfo = [NSMutableDictionary dictionary];
            //  音频标题
            [playingInfo setObject:list.title forKey:MPMediaItemPropertyTitle];
            //  专辑标题
            [playingInfo setObject:_theAlbum forKey:MPMediaItemPropertyAlbumTitle];
            //  专辑艺术家
            [playingInfo setObject:list.nickname forKey:MPMediaItemPropertyArtist];
            //  专辑封面
            MPMediaItemArtwork *artWork = [[MPMediaItemArtwork alloc] initWithImage:theCover];
            [playingInfo setObject:artWork forKey:MPMediaItemPropertyArtwork];
            //  音频的时间长度，单位为秒，可以是 double float integer
            [playingInfo setObject:@(list.duration) forKey:MPMediaItemPropertyPlaybackDuration];
            //  音频已经播放的时间长度，单位为秒
            [playingInfo setObject:@(_playManager.currentTime) forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
            //  页面更新信息，据说有的通过这个显示歌词，一秒一更新
            [playingInfo setObject:@(1) forKey:MPNowPlayingInfoPropertyPlaybackRate];
            [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:playingInfo];
        }
        
        
        
    });


    
//    UIImageWriteToSavedPhotosAlbum(<#UIImage * _Nonnull image#>, <#id  _Nullable completionTarget#>, <#SEL  _Nullable completionSelector#>, <#void * _Nullable contextInfo#>)
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}















@end
