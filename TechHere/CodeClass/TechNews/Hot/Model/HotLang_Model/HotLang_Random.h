//
//  HotLang_Random.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotLang_Random : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sign;
@property (nonatomic, assign) id iscollect;
@property (nonatomic, strong) NSString *biaoqian;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, assign) id ispraise;
@property (nonatomic, strong) NSString *view;
@property (nonatomic, strong) NSString *praise;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *pimg;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *aid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
