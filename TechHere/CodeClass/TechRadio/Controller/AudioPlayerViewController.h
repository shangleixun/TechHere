//
//  AudioPlayerViewController.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CoreGraphics/CoreGraphics.h>

#import "ZIXUNRIGHT_DataModels.h"
#import "AudioPlayerManager.h"
#import "AudioItemCollectionDataBaseManager.h"

typedef void(^refreshBlock)();

@interface AudioPlayerViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UISlider *playProgressSlider;
@property (weak, nonatomic) IBOutlet UIButton *theLastButton;
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseButton;
@property (weak, nonatomic) IBOutlet UIButton *theNextButton;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalTimeLabel;

@property (copy, nonatomic) refreshBlock refreshTableBlock;

@property (strong, nonatomic) NSMutableArray *audioItemsArray;
@property (strong, nonatomic) ZIXUNRIGHT_List *selectedItem;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) NSString *theAlbum;

@end
