//
//  AudioCollectionTableViewController.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/13.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AudioCollectionTableViewController.h"

@interface AudioCollectionTableViewController ()

@property (nonatomic, strong) NSMutableArray *audioCollectionArray;

@end

@implementation AudioCollectionTableViewController

-(void)viewWillAppear:(BOOL)animated{
    self.audioCollectionArray = [NSMutableArray arrayWithArray:[[AudioItemCollectionDataBaseManager theManager] selectData]];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[defaults objectForKey:@"states"] isEqualToString:@"night"]) {
        self.view.backgroundColor = [UIColor iOS7darkGrayColor];
        self.tableView.separatorColor = [UIColor darkGrayColor];
        
    } else if([[defaults objectForKey:@"states"] isEqualToString:@"day"]){
        self.view.backgroundColor = [UIColor whiteColor];
        self.tableView.separatorColor = [UIColor iOS7lightGrayColor];
        
    }
    [self.tableView reloadData];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.audioCollectionArray = [NSMutableArray arrayWithArray:[[AudioItemCollectionDataBaseManager theManager] selectData]];
    [self.tableView reloadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AudioCollectCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"audioCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    
    [self.tableView setEstimatedRowHeight:80];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _audioCollectionArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AudioCollectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"audioCell" forIndexPath:indexPath];
    ZIXUNRIGHT_List *list = _audioCollectionArray[indexPath.row];
    cell.coverImageView.yy_imageURL = [NSURL URLWithString:list.coverMiddle];
    cell.titleLabel.text = list.title;
    cell.durationLabel.text = [NSString stringWithFormat:@"%.2d:%.2d", (int)(list.duration / 60.0), ((int)list.duration) % 60];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        ZIXUNRIGHT_List *list = _audioCollectionArray[indexPath.row];
        [[AudioItemCollectionDataBaseManager theManager] deleteDataWithAudioTrackID:list.trackId];
        [_audioCollectionArray removeObject:list];
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AudioPlayerViewController *apVC = [AudioPlayerViewController new];
    apVC.selectedIndex = indexPath.row;
    apVC.audioItemsArray = _audioCollectionArray;
    
    apVC.refreshTableBlock = ^(){
        self.audioCollectionArray = [NSMutableArray arrayWithArray:[[AudioItemCollectionDataBaseManager theManager] selectData]];
        [self.tableView reloadData];
    };
    
    [self.navigationController pushViewController:apVC animated:YES];
    
}

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
