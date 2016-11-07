//
//  ZIXUNLEFT_Data.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZIXUNLEFT_Detail, ZIXUNLEFT_Recs, ZIXUNLEFT_User;

@interface ZIXUNLEFT_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL showFeedButton;
@property (nonatomic, strong) ZIXUNLEFT_Detail *detail;
@property (nonatomic, strong) ZIXUNLEFT_Recs *recs;
@property (nonatomic, strong) ZIXUNLEFT_User *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
