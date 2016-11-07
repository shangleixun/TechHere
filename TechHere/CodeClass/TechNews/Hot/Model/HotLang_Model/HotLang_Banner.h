//
//  HotLang_Banner.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotLang_Banner : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *bannerIdentifier;
@property (nonatomic, strong) NSString *edittime;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *slide;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *autor;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, strong) NSString *praise;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *view;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
