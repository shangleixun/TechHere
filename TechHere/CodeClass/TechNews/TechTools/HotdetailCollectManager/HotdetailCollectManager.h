//
//  HotdetailCollectManager.h
//  TechHere
//
//  Created by sam on 2016/10/12.
//  Copyright © 2016年 samike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "HotLangList_Data.h"
@interface HotdetailCollectManager : NSObject
@property(nonatomic,strong)FMDatabase *db;
+(instancetype)defaultManager;
-(void)createTable;
-(void)insertDataWithMode:(HotLangList_Data*)model;
-(void)deleteDataWithDetailID:(NSString*)detailID;
-(NSArray<HotLangList_Data*>*)selestData;

@end
