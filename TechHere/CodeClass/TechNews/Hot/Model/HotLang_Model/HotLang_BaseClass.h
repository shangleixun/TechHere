//
//  HotLang_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotLang_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *random;
@property (nonatomic, strong) NSArray *article;
@property (nonatomic, strong) NSArray *folder;
@property (nonatomic, strong) NSArray *category;
@property (nonatomic, strong) NSArray *banner;
@property (nonatomic, strong) NSArray *hotarticle;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *misarticle;
@property (nonatomic, strong) NSArray *headline;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
