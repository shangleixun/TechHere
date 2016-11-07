//
//  HotLang_Article.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Article.h"


NSString *const kHotLang_ArticleIscollect = @"iscollect";
NSString *const kHotLang_ArticleBiaoqian = @"biaoqian";
NSString *const kHotLang_ArticleUid = @"uid";
NSString *const kHotLang_ArticleFid = @"fid";
NSString *const kHotLang_ArticleUrl = @"url";
NSString *const kHotLang_ArticlePic = @"pic";
NSString *const kHotLang_ArticleTitle = @"title";
NSString *const kHotLang_ArticleComment = @"comment";
NSString *const kHotLang_ArticleCtime = @"ctime";
NSString *const kHotLang_ArticleIspraise = @"ispraise";
NSString *const kHotLang_ArticleView = @"view";
NSString *const kHotLang_ArticlePraise = @"praise";
NSString *const kHotLang_ArticleAid = @"aid";


@interface HotLang_Article ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Article

@synthesize iscollect = _iscollect;
@synthesize biaoqian = _biaoqian;
@synthesize uid = _uid;
@synthesize fid = _fid;
@synthesize url = _url;
@synthesize pic = _pic;
@synthesize title = _title;
@synthesize comment = _comment;
@synthesize ctime = _ctime;
@synthesize ispraise = _ispraise;
@synthesize view = _view;
@synthesize praise = _praise;
@synthesize aid = _aid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.iscollect = [self objectOrNilForKey:kHotLang_ArticleIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotLang_ArticleBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_ArticleUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLang_ArticleFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_ArticleUrl fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_ArticlePic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_ArticleTitle fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_ArticleComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_ArticleCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLang_ArticleIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_ArticleView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_ArticlePraise fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_ArticleAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.iscollect forKey:kHotLang_ArticleIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotLang_ArticleBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotLang_ArticleUid];
    [mutableDict setValue:self.fid forKey:kHotLang_ArticleFid];
    [mutableDict setValue:self.url forKey:kHotLang_ArticleUrl];
    [mutableDict setValue:self.pic forKey:kHotLang_ArticlePic];
    [mutableDict setValue:self.title forKey:kHotLang_ArticleTitle];
    [mutableDict setValue:self.comment forKey:kHotLang_ArticleComment];
    [mutableDict setValue:self.ctime forKey:kHotLang_ArticleCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLang_ArticleIspraise];
    [mutableDict setValue:self.view forKey:kHotLang_ArticleView];
    [mutableDict setValue:self.praise forKey:kHotLang_ArticlePraise];
    [mutableDict setValue:self.aid forKey:kHotLang_ArticleAid];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.iscollect = [aDecoder decodeObjectForKey:kHotLang_ArticleIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotLang_ArticleBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_ArticleUid];
    self.fid = [aDecoder decodeObjectForKey:kHotLang_ArticleFid];
    self.url = [aDecoder decodeObjectForKey:kHotLang_ArticleUrl];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_ArticlePic];
    self.title = [aDecoder decodeObjectForKey:kHotLang_ArticleTitle];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_ArticleComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_ArticleCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLang_ArticleIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLang_ArticleView];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_ArticlePraise];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_ArticleAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_iscollect forKey:kHotLang_ArticleIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotLang_ArticleBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotLang_ArticleUid];
    [aCoder encodeObject:_fid forKey:kHotLang_ArticleFid];
    [aCoder encodeObject:_url forKey:kHotLang_ArticleUrl];
    [aCoder encodeObject:_pic forKey:kHotLang_ArticlePic];
    [aCoder encodeObject:_title forKey:kHotLang_ArticleTitle];
    [aCoder encodeObject:_comment forKey:kHotLang_ArticleComment];
    [aCoder encodeObject:_ctime forKey:kHotLang_ArticleCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLang_ArticleIspraise];
    [aCoder encodeObject:_view forKey:kHotLang_ArticleView];
    [aCoder encodeObject:_praise forKey:kHotLang_ArticlePraise];
    [aCoder encodeObject:_aid forKey:kHotLang_ArticleAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Article *copy = [[HotLang_Article alloc] init];
    
    if (copy) {

        copy.iscollect = [self.iscollect copyWithZone:zone];
        copy.biaoqian = [self.biaoqian copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.ispraise = [self.ispraise copyWithZone:zone];
        copy.view = [self.view copyWithZone:zone];
        copy.praise = [self.praise copyWithZone:zone];
        copy.aid = [self.aid copyWithZone:zone];
    }
    
    return copy;
}


@end
