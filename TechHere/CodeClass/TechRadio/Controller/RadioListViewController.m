//
//  RadioListViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/29.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "RadioListViewController.h"

@interface RadioListViewController ()

@property (strong, nonatomic) RadioList_BaseClass *baseClass;
@property (strong, nonatomic) NSMutableArray *radioListArr;
@property (assign, nonatomic) int pageID;

@end

@implementation RadioListViewController

- (void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.mainTableView.backgroundColor = [UIColor blackColor];
        
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]) {
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageID = 1;
    self.navigationItem.title = _theTitle;
    [self dataHandle];
    [self initMainTableView];
}

- (void)initMainTableView {
    self.mainTableView = [[UITableView alloc] initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    [_mainTableView setBackgroundColor:[UIColor whiteColor]];
    [_mainTableView setEstimatedRowHeight:100];
    [_mainTableView setRowHeight:UITableViewAutomaticDimension];
    
    [_mainTableView setDelegate:self];
    [_mainTableView setDataSource:self];
    [_mainTableView registerNib:[UINib nibWithNibName:@"AlbumListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"mainCell"];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dataHandle];
    }];;
    _mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        _pageID += 1;
        [self moreDataHandle];
    }];
    [self.view addSubview:_mainTableView];
}



- (void)dataHandle {
    NSString *radioList = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v2/category/keyword/albums?calcDimension=hot&categoryId=18&device=iPhone&keywordId=%d&pageId=1&pageSize=20&statEvent=pageview/category@IT科技&statModule=IT科技&statPage=tab@发现_分类&status=0&version=5.4.33", (int)_keywordID];
    NSString *radioListURL = [radioList stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [NetWorkRequest requestWithMethod:GET URL:radioListURL parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.baseClass = [[RadioList_BaseClass alloc] initWithDictionary:theDic];
        self.radioListArr = [NSMutableArray arrayWithArray:_baseClass.list];
        NSLog(@"radioListArr ___ %ld", _radioListArr.count);
        
        [_mainTableView.mj_header endRefreshing];
        dispatch_async(dispatch_get_main_queue(), ^{
            _mainTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            [_mainTableView reloadData];
        });
    } error:^(NSError *error) {
        NSLog(@"请求错误");
    }];
}

- (void)moreDataHandle {
    NSString *radioList = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v2/category/keyword/albums?calcDimension=hot&categoryId=18&device=iPhone&keywordId=%d&pageId=%d&pageSize=20&statEvent=pageview/category@IT科技&statModule=IT科技&statPage=tab@发现_分类&status=0&version=5.4.33", (int)_keywordID, _pageID];
    NSString *radioListURL = [radioList stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [NetWorkRequest requestWithMethod:GET URL:radioListURL parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        RadioList_BaseClass *theBaseClass = [[RadioList_BaseClass alloc] initWithDictionary:theDic];
        NSMutableArray *newListArr = [NSMutableArray arrayWithArray:theBaseClass.list];
        [_mainTableView.mj_footer endRefreshing];
        for (RadioList_List *list in newListArr) {
            [_radioListArr addObject:list];
        }
        NSLog(@"radioListArr ___ %ld", _radioListArr.count);
        dispatch_async(dispatch_get_main_queue(), ^{
            [_mainTableView reloadData];
        });
    } error:^(NSError *error) {
        NSLog(@"请求错误");
    }];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.radioListArr) {
        return _radioListArr.count;
    } else {
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AlbumListTableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    mainCell.backgroundColor = [UIColor clearColor];
    mainCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (_radioListArr) {
        RadioList_List *list = _radioListArr[indexPath.row];
        mainCell.coverImageView.yy_imageURL = [NSURL URLWithString:list.coverMiddle];
        mainCell.titleLabel.text = list.title;
        mainCell.introLabel.text = list.intro;
        mainCell.playCountsLabel.text = [NSString stringWithFormat:@"%.1f 万", list.playsCounts / 10000.0];
        mainCell.tracksLabel.text = [NSString stringWithFormat:@"%.0f 集", list.tracks];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            mainCell.titleLabel.textColor = [UIColor iOS7yellowColor];
            mainCell.introLabel.textColor = [UIColor iOS7lightGrayColor];
            mainCell.playCountsLabel.textColor = [UIColor iOS7lightGrayColor];
            mainCell.tracksLabel.textColor = [UIColor iOS7lightGrayColor];
        }
        
    } else {
        mainCell.textLabel.text = @"";
    }
    return mainCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AlbumDetailViewController *albumDetailVC = [AlbumDetailViewController new];
    RadioList_List *list = _radioListArr[indexPath.row];
    albumDetailVC.theList = list;
    [self.navigationController pushViewController:albumDetailVC animated:YES];
    
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
