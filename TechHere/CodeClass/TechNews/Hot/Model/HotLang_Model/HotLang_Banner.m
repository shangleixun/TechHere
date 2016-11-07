//
//  HotLang_Banner.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Banner.h"


NSString *const kHotLang_BannerId = @"id";
NSString *const kHotLang_BannerEdittime = @"edittime";
NSString *const kHotLang_BannerUid = @"uid";
NSString *const kHotLang_BannerSlide = @"slide";
NSString *const kHotLang_BannerUrl = @"url";
NSString *const kHotLang_BannerSource = @"source";
NSString *const kHotLang_BannerPic = @"pic";
NSString *const kHotLang_BannerAutor = @"autor";
NSString *const kHotLang_BannerTag = @"tag";
NSString *const kHotLang_BannerCtime = @"ctime";
NSString *const kHotLang_BannerPraise = @"praise";
NSString *const kHotLang_BannerComment = @"comment";
NSString *const kHotLang_BannerTitle = @"title";
NSString *const kHotLang_BannerView = @"view";
NSString *const kHotLang_BannerType = @"type";
NSString *const kHotLang_BannerAid = @"aid";
NSString *const kHotLang_BannerStatus = @"status";


@interface HotLang_Banner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Banner

@synthesize bannerIdentifier = _bannerIdentifier;
@synthesize edittime = _edittime;
@synthesize uid = _uid;
@synthesize slide = _slide;
@synthesize url = _url;
@synthesize source = _source;
@synthesize pic = _pic;
@synthesize autor = _autor;
@synthesize tag = _tag;
@synthesize ctime = _ctime;
@synthesize praise = _praise;
@synthesize comment = _comment;
@synthesize title = _title;
@synthesize view = _view;
@synthesize type = _type;
@synthesize aid = _aid;
@synthesize status = _status;


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
            self.bannerIdentifier = [self objectOrNilForKey:kHotLang_BannerId fromDictionary:dict];
            self.edittime = [self objectOrNilForKey:kHotLang_BannerEdittime fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_BannerUid fromDictionary:dict];
            self.slide = [self objectOrNilForKey:kHotLang_BannerSlide fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_BannerUrl fromDictionary:dict];
            self.source = [self objectOrNilForKey:kHotLang_BannerSource fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_BannerPic fromDictionary:dict];
            self.autor = [self objectOrNilForKey:kHotLang_BannerAutor fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHotLang_BannerTag fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_BannerCtime fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_BannerPraise fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_BannerComment fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_BannerTitle fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_BannerView fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHotLang_BannerType fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_BannerAid fromDictionary:dict];
            self.status = [self objectOrNilForKey:kHotLang_BannerStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.bannerIdentifier forKey:kHotLang_BannerId];
    [mutableDict setValue:self.edittime forKey:kHotLang_BannerEdittime];
    [mutableDict setValue:self.uid forKey:kHotLang_BannerUid];
    [mutableDict setValue:self.slide forKey:kHotLang_BannerSlide];
    [mutableDict setValue:self.url forKey:kHotLang_BannerUrl];
    [mutableDict setValue:self.source forKey:kHotLang_BannerSource];
    [mutableDict setValue:self.pic forKey:kHotLang_BannerPic];
    [mutableDict setValue:self.autor forKey:kHotLang_BannerAutor];
    [mutableDict setValue:self.tag forKey:kHotLang_BannerTag];
    [mutableDict setValue:self.ctime forKey:kHotLang_BannerCtime];
    [mutableDict setValue:self.praise forKey:kHotLang_BannerPraise];
    [mutableDict setValue:self.comment forKey:kHotLang_BannerComment];
    [mutableDict setValue:self.title forKey:kHotLang_BannerTitle];
    [mutableDict setValue:self.view forKey:kHotLang_BannerView];
    [mutableDict setValue:self.type forKey:kHotLang_BannerType];
    [mutableDict setValue:self.aid forKey:kHotLang_BannerAid];
    [mutableDict setValue:self.status forKey:kHotLang_BannerStatus];

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

    self.bannerIdentifier = [aDecoder decodeObjectForKey:kHotLang_BannerId];
    self.edittime = [aDecoder decodeObjectForKey:kHotLang_BannerEdittime];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_BannerUid];
    self.slide = [aDecoder decodeObjectForKey:kHotLang_BannerSlide];
    self.url = [aDecoder decodeObjectForKey:kHotLang_BannerUrl];
    self.source = [aDecoder decodeObjectForKey:kHotLang_BannerSource];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_BannerPic];
    self.autor = [aDecoder decodeObjectForKey:kHotLang_BannerAutor];
    self.tag = [aDecoder decodeObjectForKey:kHotLang_BannerTag];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_BannerCtime];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_BannerPraise];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_BannerComment];
    self.title = [aDecoder decodeObjectForKey:kHotLang_BannerTitle];
    self.view = [aDecoder decodeObjectForKey:kHotLang_BannerView];
    self.type = [aDecoder decodeObjectForKey:kHotLang_BannerType];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_BannerAid];
    self.status = [aDecoder decodeObjectForKey:kHotLang_BannerStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bannerIdentifier forKey:kHotLang_BannerId];
    [aCoder encodeObject:_edittime forKey:kHotLang_BannerEdittime];
    [aCoder encodeObject:_uid forKey:kHotLang_BannerUid];
    [aCoder encodeObject:_slide forKey:kHotLang_BannerSlide];
    [aCoder encodeObject:_url forKey:kHotLang_BannerUrl];
    [aCoder encodeObject:_source forKey:kHotLang_BannerSource];
    [aCoder encodeObject:_pic forKey:kHotLang_BannerPic];
    [aCoder encodeObject:_autor forKey:kHotLang_BannerAutor];
    [aCoder encodeObject:_tag forKey:kHotLang_BannerTag];
    [aCoder encodeObject:_ctime forKey:kHotLang_BannerCtime];
    [aCoder encodeObject:_praise forKey:kHotLang_BannerPraise];
    [aCoder encodeObject:_comment forKey:kHotLang_BannerComment];
    [aCoder encodeObject:_title forKey:kHotLang_BannerTitle];
    [aCoder encodeObject:_view forKey:kHotLang_BannerView];
    [aCoder encodeObject:_type forKey:kHotLang_BannerType];
    [aCoder encodeObject:_aid forKey:kHotLang_BannerAid];
    [aCoder encodeObject:_status forKey:kHotLang_BannerStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Banner *copy = [[HotLang_Banner alloc] init];
    
    if (copy) {

        copy.bannerIdentifier = [self.bannerIdentifier copyWithZone:zone];
        copy.edittime = [self.edittime copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.slide = [self.slide copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.autor = [self.autor copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.praise = [self.praise copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.view = [self.view copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.aid = [self.aid copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
