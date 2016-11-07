//
//  AlbumDetailViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/30.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AlbumDetailViewController.h"

@interface AlbumDetailViewController () {
    RadioStationHeader *_theHeader;
    ZIXUNRIGHT_BaseClass *_rightBaseClass;
    ZIXUNRIGHT_Album *_theAlbum;
    NSMutableArray *_trackListArr;
    
    ZIXUNLEFT_BaseClass *_leftBaseClass;
    ZIXUNLEFT_Detail *_contentIntro;
    ZIXUNLEFT_User *_anchorIntro;
    
    UISegmentedControl *_doubleTitle;
    int _pageID;
}

@end

@implementation AlbumDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor darkGrayColor];
        self.rightTabelView.backgroundColor = [UIColor blackColor];
        _theHeader.backgroundColor = [UIColor blackColor];
        _theHeader.seperatorView.backgroundColor = [UIColor darkGrayColor];
        
        _theHeader.titleLabel.textColor = [UIColor iOS7yellowColor];
        _theHeader.anchorLabel.textColor = [UIColor iOS7lightGrayColor];
        _theHeader.playCountsLabel.textColor = [UIColor iOS7lightGrayColor];
        _theHeader.categoryLabel.textColor = [UIColor iOS7lightGrayColor];
        
        [_doubleTitle setTintColor:[UIColor iOS7lightGrayColor]];
        [_doubleTitle setBackgroundColor:[UIColor blackColor]];
    
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    _pageID = 1;
    
    [self leftDataHandle];
    [self rightDataHandle];
    
//    self.navigationController.hidesBarsOnSwipe = YES;
    self.navigationItem.title = @"专辑详情";
    NSString *jiemu = [NSString stringWithFormat:@"节目（%d）", (int)_theList.tracks];
    _doubleTitle = [[UISegmentedControl alloc] initWithItems:@[@"详情", jiemu]];
    [_doubleTitle setBackgroundColor:[UIColor whiteColor]];
    [_doubleTitle setTintColor:[UIColor iOS7redColor]];
    [_doubleTitle addTarget:self action:@selector(segmentedPressed:) forControlEvents:UIControlEventValueChanged];
    [_doubleTitle setSelectedSegmentIndex:1];
    
    [self initRightTableView];
}

- (void)segmentedPressed:(UISegmentedControl *)segmentControl {
    if (segmentControl.selectedSegmentIndex == 0) {
        if (_leftBaseClass) {
            [_rightTabelView reloadData];
        } else {
            [self leftDataHandle];
        }
        
    } else if (segmentControl.selectedSegmentIndex == 1) {
        if (_trackListArr) {
            [_rightTabelView reloadData];
        } else {
            [self rightDataHandle];
        }
    }
}

- (void)initRightTableView {
    
    self.rightTabelView = [[UITableView alloc] initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    
    [_rightTabelView setBackgroundColor:[UIColor whiteColor]];
    
    _theHeader = [RadioStationHeader radioStationHeader];
    _theHeader.frame = CGRectMake(0, 60, LX_SCREENWIDTH, 150);
    _theHeader.coverImageView.yy_imageURL = [NSURL URLWithString:_theList.coverLarge];
    _theHeader.titleLabel.text = _theList.title;
    _theHeader.anchorLabel.text = [NSString stringWithFormat:@"主播： %@", _theList.nickname];
    _theHeader.playCountsLabel.text = [NSString stringWithFormat:@"播放： %.1f 万", (_theList.playsCounts / 10000.0)];
    _theHeader.categoryLabel.text = [NSString stringWithFormat:@"分类： IT 科技"];
    
    _rightTabelView.tableHeaderView = _theHeader;
    
    [_rightTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"originalCell"];
    [_rightTabelView registerNib:[UINib nibWithNibName:@"RadioDetailTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"mainCell"];
    [_rightTabelView registerNib:[UINib nibWithNibName:@"AlbumDetailContentIntroTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"leftCellA"];
    [_rightTabelView registerNib:[UINib nibWithNibName:@"AlbumDetailAnchorIntroTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"leftCellB"];
    
    [_rightTabelView setEstimatedRowHeight:80];
    [_rightTabelView setDelegate:self];
    [_rightTabelView setDataSource:self];
    
    _rightTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _rightTabelView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _pageID += 1;
        [self moreRightDataHandle];
    }];
    
    [self.view addSubview:_rightTabelView];
}

- (void)rightDataHandle {
    
    NSString *rightData = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album?albumId=%d&device=iPhone&pageSize=20&source=5&statEvent=pageview/album@4624324&statModule=IT科技_资讯&statPage=categorytag@IT科技_资讯&statPosition=1&trackId=21159128", (int)_theList.albumId];
    NSString *rightDataURL = [rightData stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [NetWorkRequest requestWithMethod:GET URL:rightDataURL parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _rightBaseClass = [[ZIXUNRIGHT_BaseClass alloc] initWithDictionary:theDic];
        _trackListArr = [NSMutableArray arrayWithArray:_rightBaseClass.data.tracks.list];
        _theAlbum = _rightBaseClass.data.album;
        
        [_rightTabelView.mj_header endRefreshing];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            _rightTabelView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            [_rightTabelView reloadData];
        });
    } error:^(NSError *error) {
        NSLog(@"请求错误");
    }];
    
}

- (void)moreRightDataHandle {
    NSString *rightData = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album/track?albumId=%d&device=iPhone&isAsc=true&pageId=%d&pageSize=20&statEvent=pageview/album@4624324&statModule=IT科技_资讯&statPage=categorytag@IT科技_资讯&statPosition=1", (int)_theList.albumId, _pageID];
    NSString *rightDataURL = [rightData stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [NetWorkRequest requestWithMethod:GET URL:rightDataURL parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dataDic = theDic[@"data"];
        NSArray *arr = dataDic[@"list"];
        [_rightTabelView.mj_footer endRefreshing];
        for (NSDictionary *subDic in arr) {
            ZIXUNRIGHT_List *list = [ZIXUNRIGHT_List modelObjectWithDictionary:subDic];
            [_trackListArr addObject:list];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [_rightTabelView reloadData];
        });
    } error:^(NSError *error) {
        NSLog(@"请求错误");
    }];
    
}

- (void)leftDataHandle {
    
    NSString *leftData = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/album/detail?albumId=%d&device=iPhone&statEvent=pageview/album@4624324&statModule=IT科技_资讯&statPage=categorytag@IT科技_资讯&statPosition=1", (int)_theList.albumId];
    NSString *leftDataURL = [leftData stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [NetWorkRequest requestWithMethod:GET URL:leftDataURL parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _leftBaseClass = [[ZIXUNLEFT_BaseClass alloc] initWithDictionary:theDic];
        _contentIntro = _leftBaseClass.data.detail;
        _anchorIntro = _leftBaseClass.data.user;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_rightTabelView reloadData];
        });
        
    } error:^(NSError *error) {
        NSLog(@"请求错误"); 
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma -mark 设置 section 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: {
            return 35;
        }
            break;
        default:
            return 35;
            break;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return _doubleTitle;
            break;
        default:
            return _doubleTitle;
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_doubleTitle.selectedSegmentIndex == 0) {
        return 2;
    } else if (_trackListArr) {
        return _trackListArr.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    switch (_doubleTitle.selectedSegmentIndex) {
        case 0: {
            if (indexPath.row == 0) {
                AlbumDetailContentIntroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCellA" forIndexPath:indexPath];
                cell.backgroundColor = [UIColor clearColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.introContentLabel.text = _contentIntro.intro;
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    cell.aboutTheContentLabel.textColor = [UIColor iOS7yellowColor];
                }
                
                return cell;
            } else {
                AlbumDetailAnchorIntroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCellB" forIndexPath:indexPath];
                
                cell.backgroundColor = [UIColor clearColor];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.coverImageView.yy_imageURL = [NSURL URLWithString:_anchorIntro.smallLogo];
                cell.titleLabel.text = _anchorIntro.nickname;
                cell.likedCountsLabel.text = [NSString stringWithFormat:@"已被 %d 人关注", (int)_anchorIntro.followers];
                if (!_anchorIntro.isVerified) {
                    cell.isVerified.hidden = YES;
                }
                cell.introContentLabel.text = _anchorIntro.personalSignature;
                
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    cell.aboutTheAnchorLabel.textColor = [UIColor iOS7yellowColor];
                    cell.titleLabel.textColor = [UIColor whiteColor];
                }
                return cell;
            }
        }
            break;
            
        case 1: {
            RadioDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            if (_trackListArr) {
                ZIXUNRIGHT_List *trackList = _trackListArr[indexPath.row];
                cell.coverImageView.yy_imageURL = [NSURL URLWithString:trackList.coverMiddle];
                cell.titleLabel.text = trackList.title;
                cell.playCountsLabel.text = [NSString stringWithFormat:@"%d", (int)trackList.playtimes];
                cell.commentCountsLabel.text = [NSString stringWithFormat:@"%d", (int)trackList.comments];
                cell.durationLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(trackList.duration / 60.0), ((int)trackList.duration) % 60];
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    cell.titleLabel.textColor = [UIColor iOS7yellowColor];
                }
            } else {
                cell.textLabel.text = @"";
            }
            return cell;
        }
            break;
        default: {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"originalCell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"";
            return cell;
        }
            break;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (_doubleTitle.selectedSegmentIndex) {
        case 0: {
            // nothing happen here
        }
            break;
        case 1: {
            AudioPlayerViewController *playerVC = [AudioPlayerViewController new];
            playerVC.audioItemsArray = _trackListArr;
            playerVC.selectedItem = _trackListArr[indexPath.row];
            playerVC.selectedIndex = indexPath.row;
            playerVC.theAlbum = _theList.title;
            
            [self.navigationController pushViewController:playerVC animated:YES];
        }
            break;
        default:
            break;
    }
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
