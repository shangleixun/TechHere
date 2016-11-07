//
//  SettingsViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SettingsViewController.h"
#import "SwitchTableViewCell.h"
@interface SettingsViewController (){
    SwitchTableViewCell *_switchCell;
    UIBarButtonItem *_leftBarButtonItem;
}
  




@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"========%@",[defaults objectForKey:@"states"]);
    _leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(itemAction)];
    _leftBarButtonItem.tintColor = [UIColor iOS7pinkColor];
    
    self.navigationItem.leftBarButtonItem = _leftBarButtonItem;
    
    self.mainTableView = [[UITableView alloc] initWithFrame:LX_SCREENBOUNDS style:UITableViewStylePlain];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mainCell"];
    _mainTableView.tableFooterView = [[UITableViewHeaderFooterView alloc] init];
//    _mainTableView.backgroundColor = [UIColor whiteColor];
    
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"SwitchTableViewCell" bundle:nil];
    [_mainTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_mainTableView];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeColor:)  name:@"changeColor" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        
        _mainTableView.backgroundColor = [UIColor darkGrayColor];
        self.navigationController.navigationBar.barTintColor = [UIColor iOS7darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
        
       
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _mainTableView.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
        _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
       
    }
}

-(void)changeColor:(NSNotification*)aaa{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        _mainTableView.backgroundColor = [UIColor darkGrayColor];
         self.navigationController.navigationBar.barTintColor = [UIColor iOS7darkGrayColor];
        _leftBarButtonItem.tintColor = [UIColor blackColor];
      
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _mainTableView.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
         _leftBarButtonItem.tintColor = [UIColor iOS7redColor];
    }
    [_mainTableView reloadData];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        cell.textLabel.textColor = [UIColor iOS7lightGrayColor];
        
    }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        _mainTableView.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
        
    }
    
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"清除缓存";
            return cell;
        }
            break;
        case 1: {
            
            cell.textLabel.text = @"关于此应用";
            return cell;
        }
            break;
        case 2: {
            if(cell){
                [cell removeFromSuperview];
            }
            _switchCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            _switchCell.backgroundColor = [UIColor clearColor];
            _switchCell.selectionStyle = UITableViewCellSelectionStyleNone;
            _switchCell.ColorSwitch.onTintColor = [UIColor iOS7darkGrayColor];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
                _switchCell.ColorSwitch.on = YES;
                _switchCell.titleLab.textColor = [UIColor iOS7lightGrayColor];
                
            }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
                _switchCell.ColorSwitch.on = NO;
                _switchCell.titleLab.textColor = [UIColor blackColor];
            }
            return _switchCell;
        }
            break;
            
        default:
            cell.textLabel.text = @"";
            break;
    }
    

    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        [self tapCleanCell];
    } else if (indexPath.row == 1) {
        AboutViewController *aVC = [AboutViewController new];
        [self.navigationController pushViewController:aVC animated:YES];
    }else{
        
    }
    
}


- (void)itemAction {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)tapCleanCell {
    NSString *dbPath1 = [NSHomeDirectory() stringByAppendingString:@"/Library/Caches"];
    NSString *dbPath2 = [NSHomeDirectory() stringByAppendingString:@"/Library/ScrollCache"];
    CGFloat size = [self folderSizeAtPath:dbPath1] + [self folderSizeAtPath:dbPath2];
    
    NSString *message = size > 1 ? [NSString stringWithFormat:@"缓存 %.2f MB，要清除吗？", size] : [NSString stringWithFormat:@"缓存 %.2f KB，要清除吗？", size * 1024.0];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的"
                                                     style:(UIAlertActionStyleDefault)
                                                   handler:^(UIAlertAction *action) {
                                                       [self cleanCaches:dbPath1];
                                                       [self cleanCaches:dbPath2];
                                                   }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action];
    [alert addAction:cancel];
    [self showDetailViewController:alert sender:nil];
}

- (CGFloat)folderSizeAtPath:(NSString *)path{
    //  利用NSFileManager实现对文件的管理
    NSFileManager *manager = [NSFileManager defaultManager];
    CGFloat size = 0;
    if ([manager fileExistsAtPath:path]) {
        //  获取该目录下的文件，计算其大小
        NSArray *childrenFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childrenFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;
        }
        //  将大小转化为 MB
        return size / 1024.0 / 1024.0;
    }
    return 0;
}

// 根据路径删除文件
- (void)cleanCaches:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        // 获取该路径下面的文件名
        NSArray *childrenFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childrenFiles) {
            // 拼接路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 将文件删除
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    
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
