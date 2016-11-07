//
//  HotTopicDetail_Data.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotTopicDetail_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *pimg;
@property (nonatomic, assign) id ispraise;
@property (nonatomic, strong) NSString *praise;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *view;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, assign) id sign;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
