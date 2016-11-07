//
//  RadioViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "RadioViewController.h"


//  需要两个数组，分别装 keywords 下面的 list，以及 focusImages 下面的 list
@interface RadioViewController ()

@property (assign, nonatomic) CGFloat ratio;
@property (strong, nonatomic) UICollectionViewFlowLayout *mainFlowLayout;
@property (strong, nonatomic) NSMutableArray *keywordsArr;
@property (strong, nonatomic) NSMutableArray *focusImagesArr;
@property (strong, nonatomic) NSMutableArray *backgroundImagesArr;

@property (strong, nonatomic) SDCycleScrollView *headerCycleScrollView;
@property (strong, nonatomic) Total_BaseClass *baseClass;

@property (strong, nonatomic) UIBarButtonItem *leftBarButtonItem;


@end

@implementation RadioViewController

- (void)viewWillAppear:(BOOL)animated{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor iOS7darkGrayColor];
        self.leftBarButtonItem.tintColor = [UIColor blackColor];
        self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
        self.mainCollectionView.backgroundColor = [UIColor blackColor];
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]) {
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *news = [UIImage imageNamed:@"news1.jpg"];
    UIImage *smart = [UIImage imageNamed:@"smart1.jpg"];
    UIImage *digital = [UIImage imageNamed:@"digital1.jpg"];
    UIImage *science = [UIImage imageNamed:@"science1.jpg"];
    UIImage *creator = [UIImage imageNamed:@"innovation0.jpg"];
    UIImage *somethingdiff = [UIImage imageNamed:@"somethingdiff1.jpg"];
    UIImage *internetplus = [UIImage imageNamed:@"internet2.jpg"];
    UIImage *bigdata = [UIImage imageNamed:@"bigdata3.jpg"];
    
    self.backgroundImagesArr = [@[news, smart, digital, science, creator, somethingdiff, internetplus, bigdata] mutableCopy];
    
    //  NSString *str = [RADIOLIST stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //  NSLog(@"radiolist ___ %@", str);
    
    NSString *str = [ZIXUNDETAILRIGHTMORE stringByRemovingPercentEncoding];
    NSLog(@"ZIXUNDETAILRIGHTMORE ___ %@", str);
    
    //  NSLog(@"str ___ %@", [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    
    NSString *urlStr2 = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"str ___ %@", urlStr2);
    
    [self dataHandle];
    [self initMainCollectionView];
    [self initHeaderCycleScrollView];
}

- (void)initMainCollectionView {
    self.ratio = 300 / 640.0;
    NSLog(@"ratio ___ %f", _ratio);
    CGFloat minimumInteritemSpacing = 3;
    CGFloat itemSize = (LX_SCREENWIDTH - minimumInteritemSpacing) / 2;
    CGFloat minimumLineSpacing = minimumInteritemSpacing;
    CGFloat sectionInset = 0;
    
    self.mainFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    _mainFlowLayout.itemSize = CGSizeMake(itemSize, itemSize);
    _mainFlowLayout.minimumInteritemSpacing = minimumInteritemSpacing;
    _mainFlowLayout.minimumLineSpacing = minimumLineSpacing;
    _mainFlowLayout.sectionInset = UIEdgeInsetsMake(sectionInset, sectionInset, sectionInset, sectionInset);
    
    _mainFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _mainFlowLayout.headerReferenceSize = CGSizeMake(LX_SCREENWIDTH, LX_SCREENWIDTH * _ratio + 3); // 此处 + 10 是为了方便添加一个空白的间隔 view
    
    self.mainCollectionView = [[UICollectionView alloc] initWithFrame:LX_SCREENBOUNDS collectionViewLayout:_mainFlowLayout];
    [_mainCollectionView setBackgroundColor:[UIColor whiteColor]];
    _mainCollectionView.delegate = self;
    _mainCollectionView.dataSource = self;
    
    // 注册自定义 cell
    UINib *nib = [UINib nibWithNibName:@"RadioMainCollectionViewCell" bundle:[NSBundle mainBundle]];
    [_mainCollectionView registerNib:nib forCellWithReuseIdentifier:@"mainCell"];
    // 注册头视图，以便重用
    [_mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mainCell"];

    [self.view addSubview:_mainCollectionView];
    
}

- (void)initHeaderCycleScrollView {
    self.headerCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LX_SCREENWIDTH, LX_SCREENWIDTH * 300 / 640) delegate:self placeholderImage:[UIImage imageNamed:@"headerView.jpg"]];
}

- (void)dataHandle {
    
    NSString *url = @"http://mobile.ximalaya.com/mobile/discovery/v3/category/recommends?categoryId=18&contentType=album&device=iPhone&scale=2&statEvent=pageview%2Fcategory%40IT%E7%A7%91%E6%8A%80&statModule=IT%E7%A7%91%E6%8A%80&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB&version=5.4.33";
    [NetWorkRequest requestWithMethod:GET URL:url parameter:nil success:^(NSData *data) {
        NSDictionary *theDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        self.baseClass = [[Total_BaseClass alloc] initWithDictionary:theDic];
        self.keywordsArr = [NSMutableArray arrayWithArray:_baseClass.keywords.list];
        self.focusImagesArr = [NSMutableArray arrayWithArray:_baseClass.focusImages.list];
        NSMutableArray *imageURLArr = [NSMutableArray array];
        for (Total_List *list in _focusImagesArr) {
            [imageURLArr addObject:list.pic];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mainCollectionView reloadData];
            _headerCycleScrollView.imageURLStringsGroup = imageURLArr;
        });
        
    } error:^(NSError *error) {
        NSLog(@"请求错误");
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_keywordsArr) {
        return  _keywordsArr.count - 1;
    } else {
        return 8;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"mainCell" forIndexPath:indexPath];
        
        
        
        [header addSubview:_headerCycleScrollView];
        return header;
    }
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RadioMainCollectionViewCell *mainCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    mainCell.backgroundImageView.image = _backgroundImagesArr[indexPath.row];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        mainCell.titleLabel.textColor = [UIColor iOS7yellowColor];
    }
    
    if (_keywordsArr) {
        Total_List *list = _keywordsArr[indexPath.row];
        mainCell.titleLabel.text = list.keywordName;
        
        
    } else {
        mainCell.titleLabel.text = @"科技";
    }
    return mainCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    Total_List *list = _keywordsArr[indexPath.row];
    RadioListViewController *radioListVC = [RadioListViewController new];
    radioListVC.keywordID = list.keywordId;
    radioListVC.theTitle = list.keywordName;
    [self.navigationController pushViewController:radioListVC animated:YES];
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
