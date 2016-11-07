//
//  NewsBookList_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsBookList_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *subNum;
@property (nonatomic, strong) NSString *isSub;
@property (nonatomic, strong) NSString *mediaLogo;
@property (nonatomic, strong) NSString *mediaName;
@property (nonatomic, assign) double mediaId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSString *totalNum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
