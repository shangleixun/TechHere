//
//  ReTableViewController.m
//  TechHere
//
//  Created by sam on 2016/9/29.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "ReTableViewController.h"
#import "ReInfoControllerViewController.h"
#import "ReTableViewCell.h"
#import "ReList_DataModels.h"
#import "MJRefresh.h"
#import "ScrollImage.h"


static  int page = 1;
@interface ReTableViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollImageDelegate>

@property (nonatomic, strong) ReList_BaseClass *baseClass;
@property(nonatomic, strong) NSMutableArray *moreDataArray;
@property(nonatomic, strong) NSMutableArray *picArray;
@property(nonatomic, strong) NSMutableArray *picDataArray;
@property(nonatomic, assign) NSInteger index;

@end

@implementation ReTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _moreDataArray = [NSMutableArray array];
  
    [self initTableView];
    [self dataHandle];
    [self updownFresh];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        _tableView.backgroundColor = [UIColor iOS7darkGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self showTabBar];
   
}

- (void)showTabBar

{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}




-(void)initTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT-108-44) style:UITableViewStylePlain];
    _tableView.rowHeight = 100;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"ReTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    _tableView.separatorStyle = NO;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
  
}


//添加轮播图
-(void)scrollAction{
    
    
    ScrollImage *scrollVC = [[ScrollImage alloc]initWithCurrentController:self urlString:_picArray viewFrame:CGRectMake(0, 0, LX_SCREENWIDTH, (LX_SCREENWIDTH)*330/440) placeholderImage:nil startAnimated:YES];
    scrollVC.delegate = self;
    
    self.tableView.tableHeaderView =scrollVC.view;
}


//添加刷新效果
-(void)updownFresh{
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_moreDataArray removeAllObjects];
        page = 1;
        [self dataHandle];
     
        
    }];
   //[self.tableView.mj_header beginRefreshing];
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
       page= page + 1;
        [self dataHandle];
        
        
        
    }];
    
}


-(void)dataHandle{
    NSString *urlStr = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/ipj/docList/?v=10.0&class_id=2&isReviewing=NO&last_time=&page=%d&retina=1&subClass=%d&vs=iph470",(int)page,[_subClass intValue]];
   
        [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
            
            if(data){
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                _baseClass  = [ReList_BaseClass modelObjectWithDictionary:dic];
                for (ReList_List *List in _baseClass.list) {
                    [_moreDataArray addObject:List];
                    
                    if (_baseClass.list.count>8) {
                        _picArray = [NSMutableArray arrayWithObjects:[_baseClass.list[5] imgsrc2],[_baseClass.list[3] imgsrc2],[_baseClass.list[6] imgsrc2] ,[_baseClass.list[0] imgsrc2], nil];
                        _picDataArray =[NSMutableArray arrayWithObjects:_baseClass.list[5]    ,_baseClass.list[3],_baseClass.list[6],_baseClass.list[0] , nil];
                    }

                }
            
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (_baseClass.list.count>8) {
                            [self scrollAction];
                    }
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



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return _moreDataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     ReList_List *List =_moreDataArray[indexPath.row];
    
    cell.list = List;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
       cell.timeLab.textColor = [UIColor iOS7lightGrayColor];
         cell.commentLab.textColor = [UIColor iOS7lightGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        cell.timeLab.textColor = [UIColor iOS7darkGrayColor];
        cell.commentLab.textColor = [UIColor iOS7darkGrayColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ReInfoControllerViewController *reInfoVC= [ReInfoControllerViewController new];
    ReList_List *list =_moreDataArray[indexPath.row];
    reInfoVC.articleUrl = list.url ;
    
    [self.navigationController pushViewController:reInfoVC animated:YES];
}



- (void)scrollImage:(ScrollImage *)scrollImage clickedAtIndex:(NSInteger)index{
    ReInfoControllerViewController *reInfoVC= [ReInfoControllerViewController new];
   
   
    if (index < _picDataArray.count + 1 + 3000) {
        ReList_List *list =_picDataArray[index-3001];
        reInfoVC.articleUrl = list.url;
    }else{
        ReList_List *list = _picDataArray[0];
        reInfoVC.articleUrl = list.url;
    }
    

  
    [self.navigationController pushViewController:reInfoVC animated:YES];
    
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
