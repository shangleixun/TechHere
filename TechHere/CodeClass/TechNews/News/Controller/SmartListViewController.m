//
//  SmartListViewController.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SmartListViewController.h"
#import "SmartListViewController.h"
#import "SmartListCellTableViewCell.h"
#import "SmartDeitailViewController.h"
#import "MJRefresh.h"
#import "NewsSmartList_DataModels.h"
@interface SmartListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *moreDataArray;
@property (nonatomic, strong)NewsSmartList_BaseClass *baseClass;

@end
static int page = 1;
@implementation SmartListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.separatorStyle = NO;
    _tableView = [[UITableView alloc]initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor iOS7lightGrayColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = LX_SCREENWIDTH/438*300;
    UINib *nib = [UINib nibWithNibName:@"SmartListCellTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    [self.view addSubview: self.tableView];
    
    [self dataHandle];
    [self updownFresh];
    
    
    
    
 
}

- (void)viewWillAppear:(BOOL)animated{
    [self hideTabBar];
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




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.moreDataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  SmartListCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.list = _moreDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SmartDeitailViewController *smartDetailVC = [SmartDeitailViewController new];
    NewsSmartList_List *list =_moreDataArray[indexPath.row];
    smartDetailVC.urlStr = list.url;
    [self.navigationController pushViewController:smartDetailVC animated:YES];

}
#pragma - mark 数据处理
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
    NSString *urlStr = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/ipj/docList/?v=10.0&class_id=%d&ep_id=&ep_time=&isReviewing=NO&last_time=2016-9-02%2015%3A05&page=%d&retina=1&vs=iph471",(int)[_classId intValue],(int)page];
    
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"_+_+_+_+_+_+_+_%@",dic);
            _baseClass  = [NewsSmartList_BaseClass modelObjectWithDictionary:dic];
            for (NewsSmartList_BaseClass *list in _baseClass.list) {
                [_moreDataArray addObject:list];
                
                
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

- (NSMutableArray*)moreDataArray{
    if (!_moreDataArray) {
        _moreDataArray = [NSMutableArray array];
    }
    return _moreDataArray;
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
