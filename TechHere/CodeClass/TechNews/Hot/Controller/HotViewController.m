//
//  HotViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "HotViewController.h"
#import "CollectionViewCell.h"
#import "HotTableViewCell.h"
#import "HotInfoViewController.h"
#import "LanguageViewController.h"
#import "TopicViewController.h"
#import "SpecialViewController.h"
#import "HotLang_DataModels.h"
#import "HotSpecial_DataModels.h"
#import "HotTopic_DataModels.h"
#import "HotLangList_DataModels.h"

@interface HotViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource>{
    
    UIBarButtonItem *_leftBarButtonItem;
    
}

@property(nonatomic, strong) UICollectionView *collectionV;
@property(nonatomic, strong) UITableView *tabelView;

@property(nonatomic, strong) HotLang_BaseClass *baseClass;
@property(nonatomic, strong) HotSpecial_BaseClass *specialBaseClass;
@property(nonatomic, strong) HotTopic_BaseClass *topicBaseClass;
@property(nonatomic, strong) HotLangList_Data *data;
@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    

    //加载左侧按钮
    [self initLeftButtonItem];
    
    //加载collectionView
    [self initCollectionView];
    
    //数据处理
    [self languageDatahandle];
    [self specialDatahandle];
    [self topicDatahandle];
    
    
}


- (void)viewWillAppear:(BOOL)animated{
    [self showTabBar];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
        self.tabBarController.tabBar.barTintColor = [UIColor iOS7blackGradientEndColor];
        _collectionV.backgroundColor = [UIColor iOS7darkGrayColor];
        _tabelView.backgroundColor = [UIColor iOS7darkGrayColor];
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
         self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        _collectionV.backgroundColor = [UIColor whiteColor];
        _tabelView.backgroundColor = [UIColor whiteColor];
        
       
        
        
    }

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

//加载左侧抽屉按钮
-(void)initLeftButtonItem{
    _leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
}


//加载collectionview
-(void)initCollectionView{
    
    //创建一个布局集合视图的类
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    
    //设置每个item的大小.
    flow.itemSize = CGSizeMake((LX_SCREENWIDTH-50)/4, (LX_SCREENWIDTH-50)/4);
    
    //设置每个Item的间距(默认10)
    flow.minimumInteritemSpacing =10;
    //    //行间距
    flow.minimumLineSpacing = 10;
    
    //设置UIcollection的Item的距离屏幕上左下右的间距
    flow.sectionInset = UIEdgeInsetsMake(10,10, 10, 10);
    //控制collectionview的滑动方向
    flow.scrollDirection =  UICollectionViewScrollDirectionVertical;
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, LX_SCREENWIDTH,LX_SCREENHEIGHT) collectionViewLayout:flow];
    _collectionV.backgroundColor = [UIColor whiteColor];
    
    _collectionV.pagingEnabled = NO;
    //代理
    _collectionV.delegate = self;
    _collectionV.dataSource = self ;
    [self.view addSubview:_collectionV];
    //注册cell
    UINib *nib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [_collectionV registerNib:nib forCellWithReuseIdentifier:@"cell"];
    //头视图
 
    [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadV"];
    //尾视图

    [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FootV"];
    

    
    
}


//底部tabelView
-(void)initTabelView{
    _tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, LX_SCREENWIDTH, LX_SCREENHEIGHT-40) style:UITableViewStylePlain];
    _tabelView.delegate = self;
    _tabelView.dataSource = self;
    _tabelView.rowHeight = 90;
    _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tabelView.separatorColor = [UIColor blackColor];
    
    UINib *nib = [UINib nibWithNibName:@"HotTableViewCell" bundle:nil];
    [_tabelView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        _tabelView.backgroundColor = [UIColor iOS7lightGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _tabelView.backgroundColor = [UIColor whiteColor];
    }
    
}




#pragma - mark collectionView的代理
//分区头视图的高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(LX_SCREENWIDTH,LX_SCREENWIDTH * 1080 / 1920 + 40);
        
    }
    else {
        return CGSizeMake(LX_SCREENWIDTH,40);
    }
    
}

//分区尾视图的高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(LX_SCREENWIDTH,LX_SCREENHEIGHT);
        
    }
    else {
        return CGSizeMake( 0, 0);
    }
    
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //需要判断返回头部视图还是尾部视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    
        UICollectionReusableView *Heav = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeadV" forIndexPath:indexPath];
        UILabel *lab = [[UILabel alloc]initWithFrame:Heav.bounds];
        UIView *divisionView = [[UIView alloc]init];
        divisionView.frame = CGRectMake(10, 35, LX_SCREENWIDTH-20 , 2);
        divisionView.backgroundColor = [UIColor iOS7darkGrayColor];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            
            lab.backgroundColor = [UIColor darkGrayColor];
            divisionView.frame = CGRectMake(0, 35, LX_SCREENWIDTH ,2);
            
        }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
            lab.backgroundColor = [UIColor whiteColor];
            divisionView.frame = CGRectMake(10, 35, LX_SCREENWIDTH-20 ,2);
        }
       

        for (UIView *view in Heav.subviews) {
            if (view) {
                [view removeFromSuperview];
            }
        }
        
        switch (indexPath.section) {
            case 0:
            {   UIImageView *headImageV= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH, LX_SCREENWIDTH * 1080 / 1920)];
                UILabel *headLab = [[UILabel alloc]initWithFrame:CGRectMake(0, LX_SCREENWIDTH*1080 / 1920 , LX_SCREENWIDTH, 40)];
                headImageV.image = [UIImage imageNamed:@"hotHeader.jpg"];
                [Heav addSubview:headImageV];
                headLab.text = @"  >>语言";
                headLab.font = [UIFont boldSystemFontOfSize:17];
                [Heav addSubview:headLab];
            
                UIView *divisionView = [[UIView alloc]init];
                divisionView.frame =CGRectMake(10, LX_SCREENWIDTH * 1080 / 1920 + 35, LX_SCREENWIDTH -20, 2);
                
                divisionView.backgroundColor = [UIColor iOS7darkGrayColor];
                [Heav addSubview:divisionView];
                
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    
                    headLab.backgroundColor = [UIColor darkGrayColor];
                    headLab.text = @"  语言";
                    headLab.textColor = [UIColor iOS7lightGrayColor];
                    divisionView.frame =CGRectMake(0, LX_SCREENWIDTH * 1080 / 1920 + 35, LX_SCREENWIDTH , 2);
                    
                }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                    headLab.backgroundColor = [UIColor whiteColor];
                    headLab.text = @"  >>语言";
                    headLab.textColor = [UIColor blackColor];
                     divisionView.frame =CGRectMake(10, LX_SCREENWIDTH * 1080 / 1920 + 35, LX_SCREENWIDTH -20, 2);
                }
                
            }
                break;
                
            case 1:
                lab.text = @"  >>专题";
                lab.font = [UIFont boldSystemFontOfSize:17];
                 [Heav addSubview: lab];
                 [Heav addSubview:divisionView];
                
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    lab.text = @"  专题";
                    lab.textColor = [UIColor iOS7lightGrayColor];
                    
                }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                    lab.text = @"  >>专题";
                    lab.textColor = [UIColor blackColor];
                }
                
                break;
                
            case 2:
               
                if (lab.text) {
                    lab.text = nil;
                }
                lab.text = @"  >>话题";
                lab.font = [UIFont boldSystemFontOfSize:17];
                 [Heav addSubview: lab];
                 [Heav addSubview:divisionView];
                if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                    lab.text = @"  话题";
                    lab.textColor = [UIColor iOS7lightGrayColor];
                    
                }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                    lab.text = @"  >>话题";
                    lab.textColor = [UIColor darkGrayColor];
                    
                }
                break;
            default:
                break;
        }
        
        return Heav;
    }
    
    else{
              UICollectionReusableView *FootV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FootV" forIndexPath:indexPath];
            FootV.backgroundColor = [UIColor lightGrayColor];
        
        if (indexPath.section == 2) {
            
            UIView *view = [[UIView alloc]initWithFrame: CGRectMake(0, 0, LX_SCREENWIDTH, 40)];
            
            UIView *divisionView = [[UIView alloc]initWithFrame:CGRectMake(0, 35, LX_SCREENWIDTH , 2)];
            divisionView.backgroundColor = [UIColor iOS7darkGrayColor];
            
            
            UILabel *lab = [[UILabel alloc]initWithFrame:view.bounds];
            lab.text = @"  >>精选";
            lab.font = [UIFont boldSystemFontOfSize:17];
            [view addSubview: lab];
            [view addSubview:divisionView];
            [FootV addSubview:view];
            
            
            [self initTabelView];
            [FootV addSubview:_tabelView];
            
            view.backgroundColor = [UIColor whiteColor];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                lab.text = @"  精选";
                lab.textColor = [UIColor iOS7lightGrayColor];
                view.backgroundColor = [UIColor darkGrayColor];
                
            }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                lab.text = @"  >>精选";
                lab.textColor = [UIColor blackColor];
                view.backgroundColor = [UIColor whiteColor];
                
            }
            
            
        }
            return FootV;
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }else {
        return 10;
    }
    
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
       cell.layer.borderWidth = 1;
       cell.layer.borderColor =[UIColor iOS7lightGrayColor].CGColor;
    

    
    if (cell.imageV.image||cell.nameLab.text) {
        cell.imageV.image = nil;
        cell.nameLab.text = nil;
        cell.imageV.layer.cornerRadius = 0;
        cell.imageV.clipsToBounds = NO;
    }
  
    
    switch (indexPath.section) {
            
        case 0:{
            cell.category = _baseClass.category[indexPath.row];
            cell.imageV.layer.cornerRadius = 20;
            cell.imageV.clipsToBounds = YES;
        }
            break;
            
        case 1:{
            cell.imageV.layer.cornerRadius = 0;
            cell.imageV.clipsToBounds = NO;
            cell.data = _specialBaseClass.data[indexPath.row];
        }
            break;
            
        case 2:
            
            cell.topicData = _topicBaseClass.data[indexPath.row];
            break;
            
        default:
            break;
    }

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.section) {
            
        case 0:{
            LanguageViewController *languageVC = [LanguageViewController new];
            languageVC.category = _baseClass.category[indexPath.row];
            [self.navigationController pushViewController:languageVC animated:YES];
        }
            break;
            
        case 1:{
            SpecialViewController *specialVC = [SpecialViewController new];
            specialVC.fidStr = [_specialBaseClass.data[indexPath.row] dataIdentifier];
            [self.navigationController pushViewController:specialVC animated:YES];
        }
            break;
            
        case 2:{
            TopicViewController *topicVC = [TopicViewController new];
             topicVC.fidStr = [_topicBaseClass.data[indexPath.row] dataIdentifier];
            [self.navigationController pushViewController:topicVC animated:YES];
        }
            break;
            
        default:
            break;
    }
  
}


#pragma - mark TabelView的代理
 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _baseClass.hotarticle.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.article = _baseClass.hotarticle[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotInfoViewController *hotVC = [HotInfoViewController new];
    HotLang_Hotarticle *hotarticle =_baseClass.hotarticle[indexPath.row];
    hotVC.articleUrl = hotarticle.url;
    _data = [HotLangList_Data new];
    _data.aid = hotarticle.aid;
    _data.pic = hotarticle.pic;
    _data.title = hotarticle.title;
    _data.biaoqian = hotarticle.biaoqian;
    _data.url = hotarticle.url;
    hotVC.data = _data;
    [self.navigationController pushViewController:hotVC animated:YES];
}



#pragma - mark 数据处理

-(void)languageDatahandle{
    NSString *urlStr =@"http://www.qidianlife.com/Singular/index.php?m=App&c=Index&a=index&uid=(null)&page=1&pagesize=6";
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            _baseClass = [HotLang_BaseClass modelObjectWithDictionary:dic];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _tabelView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
                [self.collectionV reloadData];
                
            });
        }
        
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
}

-(void)specialDatahandle{
    NSString *urlStr =@"http://www.qidianlife.com/Singular/index.php?m=App&c=OtherTag&a=getMoreTag&uid=(null)&page=1&pagesize=10";
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _specialBaseClass = [HotSpecial_BaseClass modelObjectWithDictionary:dic];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.collectionV reloadData];
                
            });
        }
        
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
}

-(void)topicDatahandle{
    NSString *urlStr =@"http://www.qidianlife.com/Singular/index.php?m=App&c=TopicCategory&a=getMoreTopic&uid=(null)&page=1&pagesize=10";
    [NetWorkRequest requestWithMethod:GET URL:urlStr parameter:nil success:^(NSData *data) {
        
        if(data){
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            _topicBaseClass = [HotTopic_BaseClass modelObjectWithDictionary:dic];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.collectionV reloadData];
                
            });
        }
        
    } error:^(NSError *error) {
        
        NSLog(@"请求失败");
    }];
}







#pragma -mark 点击方法

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
