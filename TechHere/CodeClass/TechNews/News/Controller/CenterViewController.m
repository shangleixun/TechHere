//
//  CenterViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "CenterViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "NewsCollectionViewCell.h"
#import "BookListViewController.h"
#import "SmartListViewController.h"
#import "PGIndexBannerSubiew.h"
#import "NewPagedFlowView.h"

@interface CenterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,NewPagedFlowViewDelegate, NewPagedFlowViewDataSource>{
    UIBarButtonItem *_leftBarButtonItem;
}
@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) NewPagedFlowView *pageFlowView;
@property (nonatomic, strong) NSMutableArray *bookArray;
@property (nonatomic, strong) NSMutableArray *smartArray;
@property (nonatomic, strong) NSMutableArray *hotArray;
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initButtonItem];
    [self initCollectionView];
    [self dataHandle];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
        
        self.tabBarController.tabBar.barTintColor = [UIColor iOS7blackGradientEndColor];
        _collectionV.backgroundColor = [UIColor iOS7darkGrayColor];
        
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
        
        self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        _collectionV.backgroundColor = [UIColor whiteColor];
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






#pragma -mark 加载UI

//加载轮播图
- (void)initFlowView{
    _pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH,LX_SCREENWIDTH * 200 / 320)];
    _pageFlowView.delegate = self;
    _pageFlowView.dataSource = self;
    _pageFlowView.minimumPageAlpha = 0.4;
    _pageFlowView.minimumPageScale = 0.85;
    _pageFlowView.orginPageCount = self.smartArray.count;
    _pageFlowView.isOpenAutoScroll = NO;
    //初始化pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _pageFlowView.frame.size.height - 24 - 8, LX_SCREENWIDTH, 8)];
    _pageFlowView.pageControl = pageControl;
    
    [_pageFlowView addSubview:pageControl];
}


//加载collectionview
-(void)initCollectionView{
    
    //创建一个布局集合视图的类
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    flow.scrollDirection =  UICollectionViewScrollDirectionVertical;
    
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, LX_SCREENWIDTH,LX_SCREENHEIGHT-44) collectionViewLayout:flow];
    _collectionV.backgroundColor = [UIColor whiteColor];
    
    _collectionV.pagingEnabled = NO;
    //代理
    _collectionV.delegate = self;
    _collectionV.dataSource = self ;
    [self.view addSubview:_collectionV];
    //注册cell
    UINib *nib = [UINib nibWithNibName:@"NewsCollectionViewCell" bundle:nil];
    [_collectionV registerNib:nib forCellWithReuseIdentifier:@"cell"];
    //头视图
    
    [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadV"];
    
}


#pragma - mark collectionView分区头的设置

//分区头视图的高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(LX_SCREENWIDTH,LX_SCREENWIDTH * 200 / 320 + 50);
        
    }
    else {
        return CGSizeMake(LX_SCREENWIDTH,50);
    }
    
}


//区头文字以及视图的布置
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //需要判断返回头部视图还是尾部视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *Heav = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeadV" forIndexPath:indexPath];
       
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 11, LX_SCREENWIDTH, 40)];
        
        

        UILabel *headLab = [[UILabel alloc]initWithFrame:CGRectMake(0, LX_SCREENWIDTH * 200 / 320+11, LX_SCREENWIDTH, 40)];
     
        
        UIView *divisionView = [[UIView alloc]initWithFrame:CGRectMake(10, 21, 3, 18)];
        divisionView.backgroundColor = [UIColor orangeColor];
        UIView *longView = [[UIView alloc]initWithFrame:CGRectMake(0,0, LX_SCREENWIDTH, 10)];
         longView.backgroundColor = [UIColor iOS7lightGrayColor];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            longView.backgroundColor = [UIColor darkGrayColor];
        }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
            longView.backgroundColor = [UIColor iOS7lightGrayColor];
            
        }
        
        for (UIView *view in Heav.subviews) {
            if (view) {
                [view removeFromSuperview];
            }
        }
        
        switch (indexPath.section) {
            case 0:
            {

                
                [self initFlowView];
                [Heav addSubview:_pageFlowView];
                
                
                headLab.text = @"       热点";
                [Heav addSubview:headLab];
                UIView *longView = [[UIView alloc]initWithFrame:CGRectMake(0, LX_SCREENWIDTH * 200 / 320, LX_SCREENWIDTH, 10)];
                longView.backgroundColor = [UIColor iOS7lightGrayColor];
                
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    longView.backgroundColor = [UIColor darkGrayColor];
                }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                    longView.backgroundColor = [UIColor iOS7lightGrayColor];
                    
                }
                
                [Heav addSubview:longView];
                
                UIView *divisionView = [[UIView alloc]initWithFrame:CGRectMake(11, LX_SCREENWIDTH * 200 / 320 + 22, 3, 18)];
                divisionView.backgroundColor = [UIColor orangeColor];
                [Heav addSubview:divisionView];
                
                
            }
                break;
                
            case 1:
                lab.text = @"     智能";
                [Heav addSubview: lab];
                [Heav addSubview:divisionView];
                [Heav addSubview:longView];
                break;
                
            case 2:
                
                if (lab.text) {
                    lab.text = nil;
                }
                lab.text = @"     周刊";
                [Heav addSubview: lab];
                [Heav addSubview:divisionView];
                [Heav addSubview:longView];
                break;
            default:
                break;
        }
        
        return Heav;
    }
    
    return nil;
}



#pragma -mark 各个分区布局的设置

//设置每个item的大小.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.section) {
        case 0:
            return CGSizeMake((LX_SCREENWIDTH - 60)/3,(LX_SCREENWIDTH - 60)/6);
            break;
        case 1:
            return CGSizeMake((LX_SCREENWIDTH - 45)/2,(LX_SCREENWIDTH - 45)/3.5);
            break;
        default:
            break;
    }
   
    
    return CGSizeMake((LX_SCREENWIDTH - 75)/4, (LX_SCREENWIDTH - 75)/4);
}

//设置UIcollection的Item的距离分区上左下右的间距
- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout  insetForSectionAtIndex: (NSInteger)section{
    
    switch (section) {
        case 0:
            return UIEdgeInsetsMake(0, 20, 20, 20);
            break;
        case 1:
            return  UIEdgeInsetsMake(0, 15, 20, 15);
            break;
        default:
            break;
    }
     return UIEdgeInsetsMake(0, 15, 20, 15);

}

//设置每个Item的左右间距
- (CGFloat)collectionView: (UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex: (NSInteger)section{
    switch (section) {
        case 0:
            return 10;
            break;
        case 1:
            return  15;
            break;
        default:
            break;
    }
     return 15;
 }


//设置每个Item的上下间距
- (CGFloat)collectionView: (UICollectionView *)collectionView layout: (UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 0:
            return 10;
            break;
        case 1:
            return  15;
            break;
        default:
            break;
    }
    return 15;
}







#pragma - mark collectionView的代理

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return _bookArray.count;
            break;
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
 
    
    
    
    
    switch (indexPath.section) {
            
        case 0:{
           
            cell.layer.cornerRadius = 5;
            cell.clipsToBounds = YES;
            cell.dic = _hotArray[indexPath.row];
        }
            break;
            
        case 1:{

            cell.layer.cornerRadius = 0;
            cell.clipsToBounds = NO;
            cell.dic = _smartArray[indexPath.row];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            cell.titleLab.text =[_smartArray[indexPath.row][@"name"] substringFromIndex:1];
            }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                
        
            }
          
        }
            break;
            
        case 2:
        {
            cell.layer.cornerRadius = 7;
            cell.clipsToBounds = YES;
            
            cell.dic = _bookArray[indexPath.row];
            

        }
            break;
       
        default:
            break;
    }
    

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        { BookListViewController *bookVC = [[BookListViewController alloc] init];
            bookVC.isBook = YES;
            UInt64 timestamp = (UInt64)[[NSDate date]timeIntervalSince1970];
            
            if (indexPath.row ==0) {
                
                timestamp=timestamp-259200;
             
            }else if(indexPath.row == 1){
                timestamp=timestamp-604800;
               
            }else{
                timestamp=timestamp-2592000;
          
            }
           
            NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:timestamp];
            NSLog(@"date:%@",[detaildate description]);
            //实例化一个NSDateFormatter对象
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString *DateStr = [dateFormatter stringFromDate: detaildate];
            bookVC.dataStr = DateStr;
            [self presentViewController:bookVC animated:YES completion:nil];
        }
            break;
        case 1:
        {  SmartListViewController*smartVC = [SmartListViewController new];
            smartVC.classId = _smartArray[indexPath.row][@"fid"];
            [self.navigationController pushViewController:smartVC animated:YES];
        }

            break;
        case 2:
           { BookListViewController *bookVC = [BookListViewController new];
            bookVC.Classid = _bookArray[indexPath.row][@"fid"];
             bookVC.isBook =NO;
            NSLog(@"&&&&&&&&&&&&&%@",bookVC.Classid)
            [self presentViewController:bookVC animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
    
    
    
}




- (void)initButtonItem{
    _leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
}

#pragma -mark 轮播图的代理
//  NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(LX_SCREENWIDTH - 110, (LX_SCREENWIDTH - 110) * 9 / 16);
}

//- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
//    
//    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
//    
//    
//}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    
    return self.smartArray.count;
}

- (UIView *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    
    PGIndexBannerSubiew *bannerView = (PGIndexBannerSubiew *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGIndexBannerSubiew alloc] initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH - 84, (LX_SCREENWIDTH - 84) * 9 / 16)];
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    
    //在这里下载网络图片
    //[bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = [UIImage imageNamed:self.smartArray[index][@"pic"]];
    
    return bannerView;
}




#pragma -mark 数据处理

- (void)dataHandle{
    
    _bookArray = [NSMutableArray arrayWithObjects:
                  @{@"fid":@"4",@"name":@"爱范儿",@"pic":@"4.png"},
                  @{@"fid":@"1",@"name":@"虎嗅",@"pic":@"1.png"},
                  @{@"fid":@"5",@"name":@"创见",@"pic":@"5.png"},
                  @{@"fid":@"6",@"name":@"Tech",@"pic":@"6.png"},
                  @{@"fid":@"7",@"name":@"钛",@"pic":@"7.png"},
                  @{@"fid":@"8",@"name":@"极客",@"pic":@"8.png"},
                  @{@"fid":@"11",@"name":@"雷锋",@"pic":@"11.png"},
                  @{@"fid":@"13",@"name":@"快科技",@"pic":@"13.png"},
                  @{@"fid":@"20",@"name":@"蓝鲸",@"pic":@"20.png"},
                  @{@"fid":@"21",@"name":@"电科技",@"pic":@"21.png"},
                  @{@"fid":@"22",@"name":@"速图",@"pic":@"22.png"},
                  @{@"fid":@"19",@"name":@"美通社",@"pic":@"19.png"},
                  nil];
    _smartArray = [NSMutableArray arrayWithObjects:
                   @{@"fid":@"353",@"name":@"#外设",@"pic":@"苹果汇.jpg"},
                   @{@"fid":@"210",@"name":@"#电脑",@"pic":@"电脑.jpg"},
                   @{@"fid":@"300",@"name":@"#平板",@"pic":@"平板.jpg"},
                   @{@"fid":@"200",@"name":@"#人工智能",@"pic":@"家电.png"},
                   
                   nil];
    
    _hotArray =[NSMutableArray arrayWithObjects:
                @{@"fid":@(4),@"name":@"三日热榜",@"pic":@"苹果汇.jpg"},
                @{@"fid":@(4),@"name":@"一周热榜",@"pic":@"电脑.jpg"},
                @{@"fid":@(300),@"name":@"一月热榜",@"pic":@"平板.jpg"},
                nil];
}



- (void)dealloc {
    
    /****************************
     在dealloc或者返回按钮里停止定时器
     ****************************/
    
        [self.pageFlowView stopTimer];
}



- (void)itemAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
