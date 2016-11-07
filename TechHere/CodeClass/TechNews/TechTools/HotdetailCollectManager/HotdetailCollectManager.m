//
//  HotdetailCollectManager.m
//  TechHere
//
//  Created by sam on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import "HotdetailCollectManager.h"

@implementation HotdetailCollectManager

+(instancetype)defaultManager{
    static dispatch_once_t onceToken;
    static HotdetailCollectManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[HotdetailCollectManager alloc]init];
    });
    return manager;
}


-(id)init{
    self = [super init];
    if (self) {
        NSString *dbPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/Project.sqlite"];
        NSLog(@"%@",dbPath);
        _db = [FMDatabase databaseWithPath:dbPath];
        if (![_db open]) {
            NSLog(@"打开数据库失败");
            [_db open];
        }
        
        
    }
    return self;
}


-(void)createTable{
    
    [self.db open];
    NSString *salstr = @"create table if not exists HotDetail (detailID text, title text,pic text, biaoqian text, contentUrl text)";
    BOOL result =   [self.db executeUpdate:salstr];
    if (result) {
        NSLog(@"创建表成功");
    }
    else{
        NSLog(@"创建表失败");
    }
    [self.db close];
    
    
    
}

-(void)insertDataWithMode:(HotLangList_Data*)model {
    
    [self.db open];
    BOOL result =  [self.db executeUpdate:@"insert into HotDetail (detailID,title,pic,biaoqian,contentUrl) values (?,?,?,?,?)",model.aid,model.title,model.pic,model.biaoqian,model.url];
    if (result) {
        NSLog(@"添加成功");
    }
    else{
        NSLog(@"添加失败");
    }
    [self.db close];
    
    
    
    
    
}

-(void)deleteDataWithDetailID:(NSString*)detailID{
    [self.db open];
    if ([self.db executeUpdate:@"delete from HotDetail where detailID = ?",detailID]) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
    [self.db close];
    
    
}

//查询
-(NSArray<HotLangList_Data*>*)selestData{
    [self.db open];
    FMResultSet *results = [self.db executeQuery:@"select * from HotDetail"];
    //while() loop
    NSMutableArray *modelArray = [NSMutableArray array];
    while ([results next]) {
        NSString *detailID = [results objectForColumnName:@"detailID"];
        NSString *title = [results objectForColumnName:@"title"];
        NSString *pic = [results objectForColumnName:@"pic"];
        NSString *biaoqian = [results objectForColumnName:@"biaoqian"];
        NSString *contenturl = [results objectForColumnName:@"contentUrl"];
        
        
        HotLangList_Data *model = [HotLangList_Data new];
        model.aid = detailID;
        model.title = title;
        model.pic = pic;
        model.biaoqian = biaoqian;
        model.url = contenturl;
        [modelArray addObject: model];
    }
    
    [self.db close];
    NSArray *array = [NSArray arrayWithArray:modelArray];
    return array;
    
}








@end
