//
//  HotLang_Headline.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Headline.h"


NSString *const kHotLang_HeadlineSign = @"sign";
NSString *const kHotLang_HeadlineIscollect = @"iscollect";
NSString *const kHotLang_HeadlineBiaoqian = @"biaoqian";
NSString *const kHotLang_HeadlineUid = @"uid";
NSString *const kHotLang_HeadlineFid = @"fid";
NSString *const kHotLang_HeadlineUrl = @"url";
NSString *const kHotLang_HeadlineArea = @"area";
NSString *const kHotLang_HeadlinePic = @"pic";
NSString *const kHotLang_HeadlineTitle = @"title";
NSString *const kHotLang_HeadlineComment = @"comment";
NSString *const kHotLang_HeadlineCtime = @"ctime";
NSString *const kHotLang_HeadlineIspraise = @"ispraise";
NSString *const kHotLang_HeadlineView = @"view";
NSString *const kHotLang_HeadlinePraise = @"praise";
NSString *const kHotLang_HeadlineUsername = @"username";
NSString *const kHotLang_HeadlinePimg = @"pimg";
NSString *const kHotLang_HeadlineGender = @"gender";
NSString *const kHotLang_HeadlineAid = @"aid";


@interface HotLang_Headline ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Headline

@synthesize sign = _sign;
@synthesize iscollect = _iscollect;
@synthesize biaoqian = _biaoqian;
@synthesize uid = _uid;
@synthesize fid = _fid;
@synthesize url = _url;
@synthesize area = _area;
@synthesize pic = _pic;
@synthesize title = _title;
@synthesize comment = _comment;
@synthesize ctime = _ctime;
@synthesize ispraise = _ispraise;
@synthesize view = _view;
@synthesize praise = _praise;
@synthesize username = _username;
@synthesize pimg = _pimg;
@synthesize gender = _gender;
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
            self.sign = [self objectOrNilForKey:kHotLang_HeadlineSign fromDictionary:dict];
            self.iscollect = [self objectOrNilForKey:kHotLang_HeadlineIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotLang_HeadlineBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_HeadlineUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLang_HeadlineFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_HeadlineUrl fromDictionary:dict];
            self.area = [self objectOrNilForKey:kHotLang_HeadlineArea fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_HeadlinePic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_HeadlineTitle fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_HeadlineComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_HeadlineCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLang_HeadlineIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_HeadlineView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_HeadlinePraise fromDictionary:dict];
            self.username = [self objectOrNilForKey:kHotLang_HeadlineUsername fromDictionary:dict];
            self.pimg = [self objectOrNilForKey:kHotLang_HeadlinePimg fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotLang_HeadlineGender fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_HeadlineAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sign forKey:kHotLang_HeadlineSign];
    [mutableDict setValue:self.iscollect forKey:kHotLang_HeadlineIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotLang_HeadlineBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotLang_HeadlineUid];
    [mutableDict setValue:self.fid forKey:kHotLang_HeadlineFid];
    [mutableDict setValue:self.url forKey:kHotLang_HeadlineUrl];
    [mutableDict setValue:self.area forKey:kHotLang_HeadlineArea];
    [mutableDict setValue:self.pic forKey:kHotLang_HeadlinePic];
    [mutableDict setValue:self.title forKey:kHotLang_HeadlineTitle];
    [mutableDict setValue:self.comment forKey:kHotLang_HeadlineComment];
    [mutableDict setValue:self.ctime forKey:kHotLang_HeadlineCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLang_HeadlineIspraise];
    [mutableDict setValue:self.view forKey:kHotLang_HeadlineView];
    [mutableDict setValue:self.praise forKey:kHotLang_HeadlinePraise];
    [mutableDict setValue:self.username forKey:kHotLang_HeadlineUsername];
    [mutableDict setValue:self.pimg forKey:kHotLang_HeadlinePimg];
    [mutableDict setValue:self.gender forKey:kHotLang_HeadlineGender];
    [mutableDict setValue:self.aid forKey:kHotLang_HeadlineAid];

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

    self.sign = [aDecoder decodeObjectForKey:kHotLang_HeadlineSign];
    self.iscollect = [aDecoder decodeObjectForKey:kHotLang_HeadlineIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotLang_HeadlineBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_HeadlineUid];
    self.fid = [aDecoder decodeObjectForKey:kHotLang_HeadlineFid];
    self.url = [aDecoder decodeObjectForKey:kHotLang_HeadlineUrl];
    self.area = [aDecoder decodeObjectForKey:kHotLang_HeadlineArea];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_HeadlinePic];
    self.title = [aDecoder decodeObjectForKey:kHotLang_HeadlineTitle];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_HeadlineComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_HeadlineCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLang_HeadlineIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLang_HeadlineView];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_HeadlinePraise];
    self.username = [aDecoder decodeObjectForKey:kHotLang_HeadlineUsername];
    self.pimg = [aDecoder decodeObjectForKey:kHotLang_HeadlinePimg];
    self.gender = [aDecoder decodeObjectForKey:kHotLang_HeadlineGender];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_HeadlineAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sign forKey:kHotLang_HeadlineSign];
    [aCoder encodeObject:_iscollect forKey:kHotLang_HeadlineIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotLang_HeadlineBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotLang_HeadlineUid];
    [aCoder encodeObject:_fid forKey:kHotLang_HeadlineFid];
    [aCoder encodeObject:_url forKey:kHotLang_HeadlineUrl];
    [aCoder encodeObject:_area forKey:kHotLang_HeadlineArea];
    [aCoder encodeObject:_pic forKey:kHotLang_HeadlinePic];
    [aCoder encodeObject:_title forKey:kHotLang_HeadlineTitle];
    [aCoder encodeObject:_comment forKey:kHotLang_HeadlineComment];
    [aCoder encodeObject:_ctime forKey:kHotLang_HeadlineCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLang_HeadlineIspraise];
    [aCoder encodeObject:_view forKey:kHotLang_HeadlineView];
    [aCoder encodeObject:_praise forKey:kHotLang_HeadlinePraise];
    [aCoder encodeObject:_username forKey:kHotLang_HeadlineUsername];
    [aCoder encodeObject:_pimg forKey:kHotLang_HeadlinePimg];
    [aCoder encodeObject:_gender forKey:kHotLang_HeadlineGender];
    [aCoder encodeObject:_aid forKey:kHotLang_HeadlineAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Headline *copy = [[HotLang_Headline alloc] init];
    
    if (copy) {

        copy.sign = [self.sign copyWithZone:zone];
        copy.iscollect = [self.iscollect copyWithZone:zone];
        copy.biaoqian = [self.biaoqian copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.ispraise = [self.ispraise copyWithZone:zone];
        copy.view = [self.view copyWithZone:zone];
        copy.praise = [self.praise copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.pimg = [self.pimg copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.aid = [self.aid copyWithZone:zone];
    }
    
    return copy;
}


@end
