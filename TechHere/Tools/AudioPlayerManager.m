//
//  AudioPlayerManager.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AudioPlayerManager.h"

@interface AudioPlayerManager () {
    ZIXUNRIGHT_List *_list;
    AVPlayerItem *_currentItem;
}

@end

@implementation AudioPlayerManager

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    static AudioPlayerManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[AudioPlayerManager alloc] init];
    });
    return manager;
}

- (id)init {
    self = [super init];
    if (self ) {
        _audioItemsArray = [NSMutableArray array];
    }
    return self;
}

- (void)setAudioItemsArray:(NSMutableArray *)audioItemsArray {
    
    // 初始化音乐播放器 AVPlayer
    // 拿出播放的 URL
    
    _list = audioItemsArray[self.selectIndex];
    _currentItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:_list.playPathAacv164]];
    
    if (_player) {
        [_player replaceCurrentItemWithPlayerItem:_currentItem];
    } else {
        _player = [[AVPlayer alloc] initWithPlayerItem:_currentItem];
    }
    _audioItemsArray = audioItemsArray;
    
}

// 播放
- (void)play {
    [_player play];
    _isPlay = YES;
}

// 暂停
- (void)pause {
    [_player pause];
    _isPlay = NO;
}

// 跳到某个位置去播放
- (void)seekToTime:(CGFloat)seconds {
    [_player pause];
    [_player seekToTime:CMTimeMakeWithSeconds(seconds, _player.currentTime.timescale)];
    if (_isPlay) {
        [_player play];
    }
}

- (void)changeAudioItem {
    ZIXUNRIGHT_List *list = self.audioItemsArray[_selectIndex];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:list.playPathAacv164]];
    [_player replaceCurrentItemWithPlayerItem:item];
}

- (void)lastAudioItem {
    _selectIndex -= 1;
    if (_selectIndex < 0) {
        _selectIndex = _audioItemsArray.count - 1;
    }
    [self changeAudioItem];
}

- (void)nextAudioItem {
    _selectIndex += 1;
    _selectIndex = _selectIndex % _audioItemsArray.count;
    [self changeAudioItem];
}

- (CGFloat)currentTime {
    CGFloat time = _player.currentTime.value / _player.currentTime.timescale;
    return time;
}

- (CGFloat)totalTime {
    if (!_player.currentItem.duration.timescale) {
        NSLog(@"这里没有东西");
        return 0;
    } else {
        NSLog(@"这里有东西");
        CGFloat time = _player.currentItem.duration.value / _player.currentItem.duration.timescale;
        return time;
    }
}


@end
