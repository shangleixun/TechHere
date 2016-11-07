//
//  AudioItemCollectionDataBaseManager.m
//  TechHere
//
//  Created by 尚雷勋 on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "AudioItemCollectionDataBaseManager.h"

@implementation AudioItemCollectionDataBaseManager

+ (instancetype)theManager {
    static dispatch_once_t onceToken;
    static AudioItemCollectionDataBaseManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[AudioItemCollectionDataBaseManager alloc]init];
    });
    return manager;
}


- (id)init {
    self = [super init];
    if (self) {
        NSString *dbPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/AudioItemCollection.sqlite"];
        NSLog(@"数据库地址 ___ %@",dbPath);
        _db = [FMDatabase databaseWithPath:dbPath];
        if (![_db open]) {
            NSLog(@"打开数据库失败");
            [_db open];
        }
    }
    return self;
}

- (void)createTable {
    
    [self.db open];
    NSString *createTable = @"create table if not exists AudioItemCollection (coverLarge text, coverMiddle text, theTitle text, playPathAacv164 text, duration text, trackID text)";
    BOOL result = [self.db executeUpdate:createTable];
    if (result) {
        NSLog(@"创建表成功");
        
    }
    else {
        NSLog(@"创建表失败");
    }
    [self.db close];
}

- (void)insertDataWithMode:(ZIXUNRIGHT_List *)model {
    [self.db open];
    BOOL result = [self.db executeUpdate:@"insert into AudioItemCollection (coverLarge, coverMiddle, theTitle, playPathAacv164, duration, trackID) values (?, ?, ?, ?, ?, ?)", model.coverLarge, model.coverMiddle, model.title, model.playPathAacv164, [NSString stringWithFormat:@"%f", model.duration], [NSString stringWithFormat:@"%f", model.trackId]];
    if (result) {
        NSLog(@"添加成功");
    }
    else {
        NSLog(@"添加失败");
    }
    [self.db close];
}

#pragma mark - 删除数据库
-(void)deleteDataWithAudioTrackID:(double)trackID {
    [self.db open];
    NSString *track = [NSString stringWithFormat:@"%f", trackID];
    
    if ([self.db executeUpdate:@"delete from AudioItemCollection where trackID = ?", track]) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
    [self.db close];
}

//  查询
- (NSArray<ZIXUNRIGHT_List *> *)selectData {
    [self.db open];
    FMResultSet *results = [self.db executeQuery:@"select * from AudioItemCollection"];
    //  while() loop
    NSMutableArray *modelArray = [NSMutableArray array];
    while ([results next]) {
        ZIXUNRIGHT_List *list = [ZIXUNRIGHT_List new];
        list.coverLarge = [results objectForColumnName:@"coverLarge"];
        list.coverMiddle = [results objectForColumnName:@"coverMiddle"];
        list.title = [results objectForColumnName:@"theTitle"];
        list.playPathAacv164 = [results objectForColumnName:@"playPathAacv164"];
        list.duration = [[results objectForColumnName:@"duration"] doubleValue];;
        list.trackId = [[results objectForColumnName:@"trackID"] doubleValue];
        [modelArray addObject: list];
    }
    
    [self.db close];
    NSArray *array = [NSArray arrayWithArray:modelArray];
    return array;
}

@end
