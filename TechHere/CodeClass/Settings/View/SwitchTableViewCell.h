//
//  SwitchTableViewCell.h
//  TechHere
//
//  Created by sam on 2016/10/21.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UISwitch *ColorSwitch;

@end
