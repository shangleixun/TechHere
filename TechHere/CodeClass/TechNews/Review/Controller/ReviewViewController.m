//
//  ReviewViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "ReviewViewController.h"
#import "ReTableViewController.h"

#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "ReCollectionViewCell.h"

#import "ReMenu_DataModels.h"

@interface ReviewViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSArray *categoriesArr;
@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) ReMenu_BaseClass *baseClass;
@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, assign) BOOL isShaw;
@property (nonatomic, strong) ReTableViewController *reTableVC;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
@property (nonatomic, strong) UICollectionView *collectionV;

@end

@implementation ReviewViewController



- (void)viewDidLoad {
    _isShaw = NO;
    
    [self initMenuItem];
    [super viewDidLoad];
    [self initBarButten];
    [self dataHandle];
    [_reTableVC.view addSubview:_rightView];

    
}
#pragma mark - 加载UI
-(void)initMenuItem{
    self.titleSizeNormal = 15;
    self.titleSizeSelected = 18;
    self.titleColorNormal = [UIColor darkGrayColor];
    self.titleColorSelected = [UIColor iOS7redColor];
    self.menuViewStyle = WMMenuViewStyleLine;
    self.menuItemWidth = 80;
    self.menuHeight = 45;
    self.progressWidth = 30;
    self.progressViewIsNaughty = YES;
    self.viewFrame = CGRectMake(0,64, LX_SCREENWIDTH, LX_SCREENHEIGHT);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor iOS7darkGrayColor];
        self.menuBGColor = [UIColor darkTextColor];
        self.titleColorSelected = [UIColor iOS7darkGrayColor];
        self.titleColorNormal = [UIColor iOS7lightGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        self.menuBGColor = [UIColor whiteColor];
        self.titleColorSelected = [UIColor iOS7redColor];
        self.titleColorNormal = [UIColor darkGrayColor];
        
    }
   
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor iOS7darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
        _rightBarButtonItem.tintColor = [UIColor blackColor];
        self.tabBarController.tabBar.barTintColor = [UIColor iOS7blackGradientEndColor];
        _collectionV.backgroundColor = [UIColor iOS7darkGrayColor];
       
        
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
        _rightBarButtonItem.tintColor = [UIColor iOS7pinkColor];
        self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        _collectionV.backgroundColor = [UIColor iOS7lightGrayColor];
    }
    
}


-(void)initBarButten{
   
    _leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftItemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
    
   _rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"go"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
   _rightBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.rightBarButtonItem = _rightBarButtonItem;
    
}


- (void)rightItemAction{
    _isShaw = !_isShaw;
    if (_isShaw == YES) {
        [self.view viewWithTag:self.selectIndex+1000].hidden = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
           [self.view viewWithTag:self.selectIndex+10] .frame = CGRectMake(120, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT-109-44);
            _rightBarButtonItem.image = [UIImage imageNamed:@"return"];
         }];
        
        
    }else{
        _rightBarButtonItem.image = [UIImage imageNamed:@"go"];
        [UIView animateWithDuration:0.5 animations:^{
            [self.view viewWithTag:self.selectIndex+10] .frame = CGRectMake(LX_SCREENWIDTH, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT-109-44);
        }];
        [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(hideAction) userInfo:nil repeats:NO];
     
    }
    

}

-(void)hideAction{
    [self.view viewWithTag:self.selectIndex+1000].hidden = YES;
}


- (void)leftItemAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark - 数据处理

-(void)dataHandle{
  [NetWorkRequest requestWithMethod:GET URL:@"http://lib.wap.zol.com.cn/ipj/docList/?v=10.0&class_id=2&isReviewing=NO&last_time=&page=1&retina=1&subClass=0&vs=iph470" parameter:nil success:^(NSData *data) {
      NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
      _baseClass = [ReMenu_BaseClass modelObjectWithDictionary:dic];
      
      dispatch_async(dispatch_get_main_queue(), ^{
          [self reloadData];
      });
      
  } error:^(NSError *error) {
      
  }];
    
}

//本地懒加载 
- (NSArray *)categoriesArr {
    if (!_categoriesArr) {
        _categoriesArr = @[@"手机", @"笔记本", @"平板电脑", @"台式整机", @"数码影像", @"显卡", @"主板",@"CPU", @"键鼠",@"耳机", @"硬盘", @"移动电源", @"移动储存", @"机箱电源", @"网络设备",@"游戏",@"音频", @"投影机", @"散热器", @"家电", @"液晶电视",@"液晶显示器"];
    }
    return _categoriesArr;
}


#pragma mark - MMDrawerController的代理方法
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.baseClass.classList.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    _reTableVC = [[ReTableViewController alloc] init];
    _reTableVC.subClass = [_baseClass.classList[index] classId];
    
    _rightView= [[UIView alloc]initWithFrame: CGRectMake(LX_SCREENWIDTH, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT)];
    _rightView.backgroundColor = [UIColor clearColor];
    _rightView.tag = index+10;
    
    _rightView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
   _rightView.layer.shadowOffset = CGSizeMake(-5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    _rightView.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    _rightView.layer.shadowRadius = 4;//阴影半径，默认3
    
    
    [self initCollectionView];
    _collectionV.tag = index+1000;
    _collectionV.hidden = YES;
    [_reTableVC.view addSubview:_rightView];
    return _reTableVC;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return [self.baseClass.classList[index] className];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info{
    
    [self.view viewWithTag:self.selectIndex +1000].hidden = YES;
   
    _isShaw = NO;
}



#pragma -mark righTableView

- (void)initCollectionView{
    //创建一个布局集合视图的类
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    //设置每个item的大小.
    if (LX_SCREENWIDTH ==320) {
        flow.itemSize = CGSizeMake((LX_SCREENWIDTH-30-120)/2, (LX_SCREENWIDTH-30-120)/5.8);
        //设置每个Item的间距
        flow.minimumInteritemSpacing =10;
        //行间距
        flow.minimumLineSpacing = 5;
        //设置UIcollection的Item的距离分区上左下右的间距
        flow.sectionInset = UIEdgeInsetsMake(10,10, 10, 10);
        //控制collectionview的滑动方向
        flow.scrollDirection =  UICollectionViewScrollDirectionVertical;
    }else{
        flow.itemSize = CGSizeMake((LX_SCREENWIDTH-40-120)/3, (LX_SCREENWIDTH-40-120)/6);
        //设置每个Item的间距
        flow.minimumInteritemSpacing =10;
        //行间距
        flow.minimumLineSpacing = 10;
        //设置UIcollection的Item的距离分区上左下右的间距
        flow.sectionInset = UIEdgeInsetsMake(50,10, 10, 10);
        //控制collectionview的滑动方向
        flow.scrollDirection =  UICollectionViewScrollDirectionVertical;
    }
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, LX_SCREENWIDTH-120,LX_SCREENHEIGHT) collectionViewLayout:flow];
    _collectionV.backgroundColor = [UIColor iOS7lightGrayColor];
    _collectionV.pagingEnabled = NO;
    _collectionV.delegate = self;
    _collectionV.dataSource = self ;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {

        _collectionV.backgroundColor = [UIColor iOS7darkGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        _collectionV.backgroundColor = [UIColor iOS7lightGrayColor];
    }

    
    UINib *nib = [UINib nibWithNibName:@"ReCollectionViewCell" bundle:nil];
    [_collectionV registerNib:nib forCellWithReuseIdentifier:@"cell"];
    [_rightView addSubview:_collectionV];
 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoriesArr.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ReCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.titleLab.layer.cornerRadius =10;
    cell.titleLab.clipsToBounds = YES;
    cell.titleLab.layer.borderWidth = 1;
    cell.titleLab.text = self.categoriesArr[indexPath.row];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        cell.titleLab.layer.borderColor =[UIColor iOS7lightGrayColor].CGColor;
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        
        cell.titleLab.layer.borderColor =[UIColor iOS7redColor].CGColor;
    }
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = (int)indexPath.row;
    _isShaw = NO;
    [self.view viewWithTag:self.selectIndex+10] .frame = CGRectMake(LX_SCREENWIDTH, 0, LX_SCREENWIDTH, LX_SCREENHEIGHT-109-44);
    _rightBarButtonItem.image = [UIImage imageNamed:@"go"];
    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self.view viewWithTag:indexPath.row+1000].hidden = YES;
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
