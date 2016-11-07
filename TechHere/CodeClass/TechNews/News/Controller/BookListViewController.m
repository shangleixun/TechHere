//
//  BookListViewController.m
//  TechHere
//
//  Created by sam on 2016/10/11.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "BookListViewController.h"
#import "BookDetailViewController.h"

#import "NewsBookCell.h"

#import "NewsBookList_DataModels.h"
#import "NewsHotList_DataModels.h"

#import "EvernoteFlowLayout.h"
#import "EvernoteTransition.h"
#import "MJRefresh.h"

#import "MBProgressHUD.h"



@interface BookListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) EvernoteTransition * transition;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *moreDataArray;

@property (nonatomic, strong) NewsBookList_BaseClass *baseClass;

@property (nonatomic, strong) NewsHotList_BaseClass *hotBaseClass;

@property (nonatomic, strong) MBProgressHUD *hud;

@end


static int page = 1;

@implementation BookListViewController

#pragma - mark View的生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.view.backgroundColor = [UIColor iOS7lightGrayColor];
	
    [self initCollectionView];
    
    [self showHud:@"正在加载..."];
    
    [self initButten];
    

	if (_isBook ==NO) {
		[self bookDataHandle];
	}else{
		[self hotDataHandle];
	}
		[self updownFresh];
    
    
    
	
}

- (void)viewWillAppear:(BOOL)animated{
	[self hideTabBar];
}


#pragma - mark 加载UI

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

- (void)initCollectionView{
    
    EvernoteFlowLayout *flow = [[EvernoteFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,14, LX_SCREENWIDTH,LX_SCREENHEIGHT-14) collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor iOS7lightGrayColor];
    _collectionView.pagingEnabled = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self ;
    
    UINib *nib = [UINib nibWithNibName:@"NewsBookCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
 
    
    
    
    
    
}

-(void)initButten{
    
    //返回的圆形按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(LX_SCREENWIDTH-90, LX_SCREENHEIGHT-100, 50, 50)];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    btn.clipsToBounds = YES;
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    //设置按钮阴影
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe=btn.layer.frame;
    fixframe.size.width=50;
    subLayer.frame=fixframe;
    subLayer.cornerRadius=25;
    subLayer.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    subLayer.masksToBounds=NO;
    subLayer.shadowColor=[UIColor blackColor].CGColor;
    subLayer.shadowOffset=CGSizeMake(3,5);
    subLayer.shadowOpacity=0.8;
    subLayer.shadowRadius=5;
    [self.view.layer insertSublayer:subLayer below:btn.layer];
    [self.view addSubview:btn];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor iOS7darkGrayColor];
        _collectionView.backgroundColor = [UIColor darkGrayColor];
        btn.backgroundColor = [UIColor iOS7lightGrayColor];
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        self.view.backgroundColor = [UIColor whiteColor];
        _collectionView.backgroundColor = [UIColor iOS7lightGrayColor];
        btn.backgroundColor = [UIColor whiteColor];
    }

    
}

//加载提示框
- (void)showHud:(NSString*)str{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置样式
    _hud.mode = MBProgressHUDModeText;
    _hud.label.text = str;
    
}



#pragma - mark 数据处理
//添加刷新效果
-(void)updownFresh{
	self.collectionView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
		[_moreDataArray removeAllObjects];
		page = 1;
        if (_isBook ==NO) {
            [self bookDataHandle];
            
        }else{
            [self hotDataHandle];}
	}];
    //[self.collectionView.mj_header beginRefreshing];
	// 上拉刷新
	self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
		
		page= page + 1;
		
		if (_isBook ==NO) {
			[self bookDataHandle];
			
		}else{
			[self hotDataHandle];
			
		}
	}];
}



-(void)hotDataHandle{

    
	   	NSString *url = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/ipj/docList/?v=10.0&class_id=8&hotClass=0&hotLoop=%@&isReviewing=NO&page=%d&retina=1&vs=iph471",_dataStr,page];
    NSLog(@"===========%@",url);
    
	
	[NetWorkRequest requestWithMethod:GET URL:url parameter:nil success:^(NSData *data) {
		
		if(data){
			
			NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
			_hotBaseClass  = [NewsHotList_BaseClass modelObjectWithDictionary:dic];
			for (NewsBookList_BaseClass *List in _hotBaseClass.list) {
				[_moreDataArray addObject:List];
				
			}
			
			dispatch_async(dispatch_get_main_queue(), ^{
				[_hud hideAnimated:YES];
				[self.collectionView reloadData];
				
			});
		}
		
	} error:^(NSError *error) {
		
		NSLog(@"请求失败");
	}];
	
}


-(void)bookDataHandle{
	NSString *urlStr = [NSString stringWithFormat:@"http://lib.wap.zol.com.cn/ipj/rss/rssArticleList/?v=4.0&mediaId=%d&page=%d&version=iph471",[_Classid intValue] ,page];
	NSLog(@"<>?><>??<>?<>?<?%@",urlStr);
	
	[NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
		
		if(data){
			
			NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
			_baseClass  = [NewsBookList_BaseClass modelObjectWithDictionary:dic];
			for (NewsBookList_BaseClass *List in _baseClass.list) {
				[_moreDataArray addObject:List];
				
			}
			
			dispatch_async(dispatch_get_main_queue(), ^{
                [_hud hideAnimated:YES];
				[self.collectionView.mj_header endRefreshing];
				[self.collectionView.mj_footer endRefreshing];
				[self.collectionView reloadData];
				
			});
		}
		
	} error:^(NSError *error) {
		
		NSLog(@"请求失败");
	}];
	
}



#pragma -mark collectionVIew代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.moreDataArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    NewsBookCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
      
        cell.backgroundColor = [UIColor iOS7darkGrayColor];
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        cell.backgroundColor = [UIColor whiteColor];
    }
	
	if (_isBook ==NO) {
		cell.list = _moreDataArray[indexPath.section];
	}else{
		cell.hotList = _moreDataArray[indexPath.section];

	}
    cell.tag = indexPath.section;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsBookCell * selectedCell = (NewsBookCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray * visibleCells = collectionView.visibleCells;
    
    BookDetailViewController *VC = [BookDetailViewController new];
    int offset = 25
    ;
    CGRect finalFrame = CGRectMake(14, collectionView.contentOffset.y + offset,  ScreenW - 28, ScreenH - offset - 10);
    
    [self.transition evernoteTransitionWithSelectCell:selectedCell visibleCells:visibleCells originFrame:selectedCell.frame finalFrame:finalFrame panViewController:VC listViewController:self];
    VC.transitioningDelegate = self.transition;
	if (_isBook ==NO) {
		VC.docId = [_moreDataArray[indexPath.section] docId];
	}else{
		NewsHotList_List *list =_moreDataArray[indexPath.section];
		VC.urlStr =list.url;
		
	}
    VC.delegate = self.transition;
    [self presentViewController:VC animated:YES completion:^{
        
    }];
    
}




#pragma - mark 点击事件

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma- mark 懒加载

- (EvernoteTransition *)transition {
    if (!_transition) {
        _transition = [[EvernoteTransition alloc] init];
    }
    return _transition;
}

- (NSMutableArray *)moreDataArray{
	if ((!_moreDataArray)) {
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
