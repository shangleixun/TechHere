//
//  ZIXUNRIGHTMORE_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZIXUNRIGHTMORE_Data;

@interface ZIXUNRIGHTMORE_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double ret;
@property (nonatomic, strong) ZIXUNRIGHTMORE_Data *data;
@property (nonatomic, strong) NSString *msg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
