//
//  SpecialViewController.m
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SpecialViewController.h"
#import "HotInfoViewController.h"

#import "SpecialCell.h"
#import "MJRefresh.h"
#import "HotLangList_DataModels.h"

@interface SpecialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *moreDataArray;
@property(nonatomic, strong) HotLangList_BaseClass *baseClass;

@end

static  int page = 1;

@implementation SpecialViewController

-(NSMutableArray*)moreDataArray{
    if (!_moreDataArray) {
        _moreDataArray = [NSMutableArray array];
    }
    return _moreDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专题";
    
    _tableView = [[UITableView alloc]initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 100;
    UINib *nib = [UINib nibWithNibName: @"SpecialCell" bundle:nil];
    [_tableView registerNib: nib forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle = NO;
    [self.view addSubview: _tableView];
    
    [self dataHandle];
    [self updownFresh];

   
}

- (void)viewWillAppear:(BOOL)animated{
    [self hideTabBar];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        _tableView.backgroundColor = [UIColor iOS7darkGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _tableView.backgroundColor = [UIColor whiteColor];
        
    }
}


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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.moreDataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.data = _moreDataArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotInfoViewController *infoVC = [HotInfoViewController new];
    HotLangList_Data *data = _moreDataArray[indexPath.row];
    infoVC.articleUrl = data.url;
    infoVC.data = data;
    [self.navigationController pushViewController:infoVC animated:YES];
}



//添加刷新效果
- (void)updownFresh{
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_moreDataArray removeAllObjects];
        page = 1;
        [self dataHandle];
        
        
    }];
   [self.tableView.mj_header beginRefreshing];
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        page= page + 1;
        [self dataHandle];
        
        
        
    }];
    
}


- (void)dataHandle{
    NSString *urlStr = [NSString stringWithFormat:@"http://www.qidianlife.com/Singular/index.php?m=App&c=OtherTag&a=getTagArticle&fid=%d&uid=(null)&page=%d&pagesize=10",[_fidStr intValue],(int)page];
    
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _baseClass  = [HotLangList_BaseClass modelObjectWithDictionary:dic];
            for (HotLangList_Data *data in _baseClass.data) {
                [_moreDataArray addObject:data];
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _tableView.separatorStyle = YES;
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
                
            });
        }
        
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
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
