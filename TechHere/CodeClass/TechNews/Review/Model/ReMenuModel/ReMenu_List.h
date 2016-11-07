//
//  ReMenu_List.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReMenu_List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *joinPeople;
@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *stitle;
@property (nonatomic, strong) NSString *listIdentifier;
@property (nonatomic, strong) NSString *imgsrc2;
@property (nonatomic, assign) double commentNum;
@property (nonatomic, strong) NSString *sdate;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
