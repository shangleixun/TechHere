//
//  AudioItemCollectionDataBaseManager.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZIXUNRIGHT_DataModels.h"

@interface AudioItemCollectionDataBaseManager : NSObject

@property (nonatomic, strong) FMDatabase *db;

+ (instancetype)theManager;

- (void)createTable;
- (void)insertDataWithMode:(ZIXUNRIGHT_List *)model;
- (void)deleteDataWithAudioTrackID:(double)trackID ;
- (NSArray<ZIXUNRIGHT_List *> *)selectData;

@end
