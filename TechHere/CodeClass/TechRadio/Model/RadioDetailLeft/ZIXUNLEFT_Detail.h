//
//  ZIXUNLEFT_Detail.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZIXUNLEFT_Detail : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *introRich;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *intro;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
