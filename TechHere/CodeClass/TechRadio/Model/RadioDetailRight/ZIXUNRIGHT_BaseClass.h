//
//  ZIXUNRIGHT_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZIXUNRIGHT_Data;

@interface ZIXUNRIGHT_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) ZIXUNRIGHT_Data *data;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
