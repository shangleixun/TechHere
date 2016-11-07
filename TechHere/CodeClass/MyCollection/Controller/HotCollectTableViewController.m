//
//  HotCollectTableViewController.m
//  TechHere
//
//  Created by sam on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "HotCollectTableViewController.h"


@interface HotCollectTableViewController ()
@property (nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation HotCollectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"HotCollectionCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"articleCell"];
    
    self.tableView.rowHeight = 100;
    self.tableView.tableFooterView = [[UIView alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.modelArray = [NSMutableArray arrayWithArray:[[HotdetailCollectManager defaultManager] selestData]];
    [self.tableView reloadData];
    
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
            self.view.backgroundColor = [UIColor iOS7darkGrayColor];
            self.tableView.separatorColor = [UIColor iOS7lightGrayColor];
            
        }else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
            self.view.backgroundColor = [UIColor whiteColor];
             self.tableView.separatorColor = [UIColor iOS7lightGrayColor];
   
        }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"articleCell" forIndexPath:indexPath];
    HotLangList_Data *data =self.modelArray[indexPath.row];
    cell.data = data;
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotInfoViewController *infoVC = [HotInfoViewController new];
    HotLangList_Data *data = _modelArray[indexPath.row];
    infoVC.articleUrl = data.url;
    infoVC.data = data;
    [self.navigationController pushViewController:infoVC animated:YES];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        HotLangList_Data *data = _modelArray[indexPath.row] ;
        [[HotdetailCollectManager defaultManager]deleteDataWithDetailID:data.aid];
        [_modelArray removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
    
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
