//
//  SwitchTableViewCell.m
//  TechHere
//
//  Created by sam on 2016/10/21.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "SwitchTableViewCell.h"

@implementation SwitchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)switchMode:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.ColorSwitch.on == NO) {
        [defaults setObject:@"day" forKey:@"states"];
        
        
    }else{
        [defaults setObject:@"night" forKey:@"states"];
        
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
    self.ColorSwitch.on = !self.ColorSwitch.on ;
}

- (IBAction)switchMode2:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.ColorSwitch.on == NO) {
        [defaults setObject:@"day" forKey:@"states"];
        [self.ColorSwitch setOn:YES animated:YES];
      
        
    }else{
        [defaults setObject:@"night" forKey:@"states"];
        [self.ColorSwitch setOn:NO animated:YES];
       
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
  
}

@end
