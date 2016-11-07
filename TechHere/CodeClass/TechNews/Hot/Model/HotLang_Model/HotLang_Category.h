//
//  HotLang_Category.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotLang_Category : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, strong) NSString *categoryIdentifier;
@property (nonatomic, strong) NSString *originimage;
@property (nonatomic, strong) NSString *followcount;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *articlecount;
@property (nonatomic, strong) NSString *tpimg;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
