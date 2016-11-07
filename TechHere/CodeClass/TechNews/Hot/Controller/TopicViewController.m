//
//  TopicViewController.m
//  TechHere
//
//  Created by sam on 2016/10/7.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicWordCell.h"
#import "TopicImageCell.h"
#import "MJRefresh.h"
#import "HotTopicDetail_DataModels.h"
@interface TopicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *moreDataArray;
@property(nonatomic, strong)HotTopicDetail_BaseClass *baseClass;
@end

static int page = 1;
@implementation TopicViewController

- (NSMutableArray*)moreDataArray{
    if (!_moreDataArray) {
        _moreDataArray = [NSMutableArray array];
    }
    return _moreDataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initTableView];
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



- (void)initTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *wordNib = [UINib nibWithNibName:@"TopicWordCell" bundle:nil];
    [_tableView  registerNib:wordNib forCellReuseIdentifier:@"cell"];
    
    UINib *imageNib = [UINib nibWithNibName:@"TopicImageCell" bundle:nil];
    [_tableView  registerNib:imageNib forCellReuseIdentifier:@"imagecell"];
    [self.view addSubview:_tableView];
 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.moreDataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotTopicDetail_Data *data = _moreDataArray[indexPath.row];
    if (data.image.length == 0) {
        
        TopicWordCell *wordcell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        wordcell.data = data;
    
        return wordcell;

    }else{
        TopicImageCell *imagecell = [tableView dequeueReusableCellWithIdentifier:@"imagecell" forIndexPath:indexPath];
        imagecell.data = data;
        
        return imagecell;
    }
    
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
    NSString *urlStr = [NSString stringWithFormat:@"http://www.qidianlife.com/Singular/index.php?m=App&c=Discuss&a=findTypeDiscuss&uid=(null)&fid=%d&page=%d&pagesize=10",[_fidStr intValue],(int)page];
    
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _baseClass  = [HotTopicDetail_BaseClass modelObjectWithDictionary:dic];
            for (HotTopicDetail_Data *data in _baseClass.data) {
                [_moreDataArray addObject:data];
                
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.tableView.separatorStyle = YES;
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
