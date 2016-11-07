//
//  HotLang_Hotarticle.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Hotarticle.h"


NSString *const kHotLang_HotarticleIscollect = @"iscollect";
NSString *const kHotLang_HotarticleBiaoqian = @"biaoqian";
NSString *const kHotLang_HotarticleUid = @"uid";
NSString *const kHotLang_HotarticleFid = @"fid";
NSString *const kHotLang_HotarticleUrl = @"url";
NSString *const kHotLang_HotarticlePic = @"pic";
NSString *const kHotLang_HotarticleTitle = @"title";
NSString *const kHotLang_HotarticleComment = @"comment";
NSString *const kHotLang_HotarticleCtime = @"ctime";
NSString *const kHotLang_HotarticleIspraise = @"ispraise";
NSString *const kHotLang_HotarticleView = @"view";
NSString *const kHotLang_HotarticlePraise = @"praise";
NSString *const kHotLang_HotarticleAid = @"aid";


@interface HotLang_Hotarticle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Hotarticle

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
            self.iscollect = [self objectOrNilForKey:kHotLang_HotarticleIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotLang_HotarticleBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_HotarticleUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLang_HotarticleFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_HotarticleUrl fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_HotarticlePic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_HotarticleTitle fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_HotarticleComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_HotarticleCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLang_HotarticleIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_HotarticleView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_HotarticlePraise fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_HotarticleAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.iscollect forKey:kHotLang_HotarticleIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotLang_HotarticleBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotLang_HotarticleUid];
    [mutableDict setValue:self.fid forKey:kHotLang_HotarticleFid];
    [mutableDict setValue:self.url forKey:kHotLang_HotarticleUrl];
    [mutableDict setValue:self.pic forKey:kHotLang_HotarticlePic];
    [mutableDict setValue:self.title forKey:kHotLang_HotarticleTitle];
    [mutableDict setValue:self.comment forKey:kHotLang_HotarticleComment];
    [mutableDict setValue:self.ctime forKey:kHotLang_HotarticleCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLang_HotarticleIspraise];
    [mutableDict setValue:self.view forKey:kHotLang_HotarticleView];
    [mutableDict setValue:self.praise forKey:kHotLang_HotarticlePraise];
    [mutableDict setValue:self.aid forKey:kHotLang_HotarticleAid];

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

    self.iscollect = [aDecoder decodeObjectForKey:kHotLang_HotarticleIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotLang_HotarticleBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_HotarticleUid];
    self.fid = [aDecoder decodeObjectForKey:kHotLang_HotarticleFid];
    self.url = [aDecoder decodeObjectForKey:kHotLang_HotarticleUrl];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_HotarticlePic];
    self.title = [aDecoder decodeObjectForKey:kHotLang_HotarticleTitle];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_HotarticleComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_HotarticleCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLang_HotarticleIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLang_HotarticleView];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_HotarticlePraise];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_HotarticleAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_iscollect forKey:kHotLang_HotarticleIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotLang_HotarticleBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotLang_HotarticleUid];
    [aCoder encodeObject:_fid forKey:kHotLang_HotarticleFid];
    [aCoder encodeObject:_url forKey:kHotLang_HotarticleUrl];
    [aCoder encodeObject:_pic forKey:kHotLang_HotarticlePic];
    [aCoder encodeObject:_title forKey:kHotLang_HotarticleTitle];
    [aCoder encodeObject:_comment forKey:kHotLang_HotarticleComment];
    [aCoder encodeObject:_ctime forKey:kHotLang_HotarticleCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLang_HotarticleIspraise];
    [aCoder encodeObject:_view forKey:kHotLang_HotarticleView];
    [aCoder encodeObject:_praise forKey:kHotLang_HotarticlePraise];
    [aCoder encodeObject:_aid forKey:kHotLang_HotarticleAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Hotarticle *copy = [[HotLang_Hotarticle alloc] init];
    
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
