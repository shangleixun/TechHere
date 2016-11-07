//
//  HotLang_Misarticle.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Misarticle.h"


NSString *const kHotLang_MisarticleMid = @"mid";
NSString *const kHotLang_MisarticleIscollect = @"iscollect";
NSString *const kHotLang_MisarticleUid = @"uid";
NSString *const kHotLang_MisarticleMname = @"mname";
NSString *const kHotLang_MisarticleUrl = @"url";
NSString *const kHotLang_MisarticlePic = @"pic";
NSString *const kHotLang_MisarticleTitle = @"title";
NSString *const kHotLang_MisarticleComment = @"comment";
NSString *const kHotLang_MisarticleCtime = @"ctime";
NSString *const kHotLang_MisarticleIspraise = @"ispraise";
NSString *const kHotLang_MisarticleView = @"view";
NSString *const kHotLang_MisarticlePraise = @"praise";
NSString *const kHotLang_MisarticleAid = @"aid";


@interface HotLang_Misarticle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Misarticle

@synthesize mid = _mid;
@synthesize iscollect = _iscollect;
@synthesize uid = _uid;
@synthesize mname = _mname;
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
            self.mid = [self objectOrNilForKey:kHotLang_MisarticleMid fromDictionary:dict];
            self.iscollect = [self objectOrNilForKey:kHotLang_MisarticleIscollect fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_MisarticleUid fromDictionary:dict];
            self.mname = [self objectOrNilForKey:kHotLang_MisarticleMname fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_MisarticleUrl fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_MisarticlePic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_MisarticleTitle fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_MisarticleComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_MisarticleCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLang_MisarticleIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_MisarticleView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_MisarticlePraise fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_MisarticleAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mid forKey:kHotLang_MisarticleMid];
    [mutableDict setValue:self.iscollect forKey:kHotLang_MisarticleIscollect];
    [mutableDict setValue:self.uid forKey:kHotLang_MisarticleUid];
    [mutableDict setValue:self.mname forKey:kHotLang_MisarticleMname];
    [mutableDict setValue:self.url forKey:kHotLang_MisarticleUrl];
    [mutableDict setValue:self.pic forKey:kHotLang_MisarticlePic];
    [mutableDict setValue:self.title forKey:kHotLang_MisarticleTitle];
    [mutableDict setValue:self.comment forKey:kHotLang_MisarticleComment];
    [mutableDict setValue:self.ctime forKey:kHotLang_MisarticleCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLang_MisarticleIspraise];
    [mutableDict setValue:self.view forKey:kHotLang_MisarticleView];
    [mutableDict setValue:self.praise forKey:kHotLang_MisarticlePraise];
    [mutableDict setValue:self.aid forKey:kHotLang_MisarticleAid];

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

    self.mid = [aDecoder decodeObjectForKey:kHotLang_MisarticleMid];
    self.iscollect = [aDecoder decodeObjectForKey:kHotLang_MisarticleIscollect];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_MisarticleUid];
    self.mname = [aDecoder decodeObjectForKey:kHotLang_MisarticleMname];
    self.url = [aDecoder decodeObjectForKey:kHotLang_MisarticleUrl];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_MisarticlePic];
    self.title = [aDecoder decodeObjectForKey:kHotLang_MisarticleTitle];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_MisarticleComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_MisarticleCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLang_MisarticleIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLang_MisarticleView];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_MisarticlePraise];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_MisarticleAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mid forKey:kHotLang_MisarticleMid];
    [aCoder encodeObject:_iscollect forKey:kHotLang_MisarticleIscollect];
    [aCoder encodeObject:_uid forKey:kHotLang_MisarticleUid];
    [aCoder encodeObject:_mname forKey:kHotLang_MisarticleMname];
    [aCoder encodeObject:_url forKey:kHotLang_MisarticleUrl];
    [aCoder encodeObject:_pic forKey:kHotLang_MisarticlePic];
    [aCoder encodeObject:_title forKey:kHotLang_MisarticleTitle];
    [aCoder encodeObject:_comment forKey:kHotLang_MisarticleComment];
    [aCoder encodeObject:_ctime forKey:kHotLang_MisarticleCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLang_MisarticleIspraise];
    [aCoder encodeObject:_view forKey:kHotLang_MisarticleView];
    [aCoder encodeObject:_praise forKey:kHotLang_MisarticlePraise];
    [aCoder encodeObject:_aid forKey:kHotLang_MisarticleAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Misarticle *copy = [[HotLang_Misarticle alloc] init];
    
    if (copy) {

        copy.mid = [self.mid copyWithZone:zone];
        copy.iscollect = [self.iscollect copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.mname = [self.mname copyWithZone:zone];
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
