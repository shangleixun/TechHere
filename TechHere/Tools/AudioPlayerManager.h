//
//  AudioPlayerManager.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ZIXUNRIGHT_List.h"

@interface AudioPlayerManager : NSObject

@property (nonatomic, assign) BOOL                  isPlay;
@property (nonatomic, strong) AVPlayer              *player;
@property (nonatomic, strong) NSMutableArray        *audioItemsArray;
@property (assign, nonatomic) NSInteger             selectIndex;
@property (assign, nonatomic) CGFloat               currentTime;
@property (assign, nonatomic) CGFloat               totalTime;

+ (instancetype)defaultManager;

// 播放、暂停、跳到某个时间点播放
- (void)play;
- (void)pause;
- (void)seekToTime:(CGFloat) seconds;

// 上一首、下一首
- (void)lastAudioItem;
- (void)nextAudioItem;

@end
