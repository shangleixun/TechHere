//
//  NewsHotList_List.h
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsHotList_List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double commentNum;
@property (nonatomic, strong) NSString *stitle;
@property (nonatomic, strong) NSString *imgsrc2;
@property (nonatomic, strong) NSString *sdate;
@property (nonatomic, strong) NSString *joinPeople;
@property (nonatomic, assign) double liveNum;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
