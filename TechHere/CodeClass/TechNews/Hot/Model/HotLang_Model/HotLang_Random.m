//
//  HotLang_Random.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Random.h"


NSString *const kHotLang_RandomSign = @"sign";
NSString *const kHotLang_RandomIscollect = @"iscollect";
NSString *const kHotLang_RandomBiaoqian = @"biaoqian";
NSString *const kHotLang_RandomUid = @"uid";
NSString *const kHotLang_RandomFid = @"fid";
NSString *const kHotLang_RandomUrl = @"url";
NSString *const kHotLang_RandomArea = @"area";
NSString *const kHotLang_RandomPic = @"pic";
NSString *const kHotLang_RandomTitle = @"title";
NSString *const kHotLang_RandomComment = @"comment";
NSString *const kHotLang_RandomCtime = @"ctime";
NSString *const kHotLang_RandomIspraise = @"ispraise";
NSString *const kHotLang_RandomView = @"view";
NSString *const kHotLang_RandomPraise = @"praise";
NSString *const kHotLang_RandomUsername = @"username";
NSString *const kHotLang_RandomPimg = @"pimg";
NSString *const kHotLang_RandomGender = @"gender";
NSString *const kHotLang_RandomAid = @"aid";


@interface HotLang_Random ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Random

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
            self.sign = [self objectOrNilForKey:kHotLang_RandomSign fromDictionary:dict];
            self.iscollect = [self objectOrNilForKey:kHotLang_RandomIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotLang_RandomBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLang_RandomUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLang_RandomFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLang_RandomUrl fromDictionary:dict];
            self.area = [self objectOrNilForKey:kHotLang_RandomArea fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLang_RandomPic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLang_RandomTitle fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLang_RandomComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_RandomCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLang_RandomIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLang_RandomView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLang_RandomPraise fromDictionary:dict];
            self.username = [self objectOrNilForKey:kHotLang_RandomUsername fromDictionary:dict];
            self.pimg = [self objectOrNilForKey:kHotLang_RandomPimg fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotLang_RandomGender fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLang_RandomAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sign forKey:kHotLang_RandomSign];
    [mutableDict setValue:self.iscollect forKey:kHotLang_RandomIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotLang_RandomBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotLang_RandomUid];
    [mutableDict setValue:self.fid forKey:kHotLang_RandomFid];
    [mutableDict setValue:self.url forKey:kHotLang_RandomUrl];
    [mutableDict setValue:self.area forKey:kHotLang_RandomArea];
    [mutableDict setValue:self.pic forKey:kHotLang_RandomPic];
    [mutableDict setValue:self.title forKey:kHotLang_RandomTitle];
    [mutableDict setValue:self.comment forKey:kHotLang_RandomComment];
    [mutableDict setValue:self.ctime forKey:kHotLang_RandomCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLang_RandomIspraise];
    [mutableDict setValue:self.view forKey:kHotLang_RandomView];
    [mutableDict setValue:self.praise forKey:kHotLang_RandomPraise];
    [mutableDict setValue:self.username forKey:kHotLang_RandomUsername];
    [mutableDict setValue:self.pimg forKey:kHotLang_RandomPimg];
    [mutableDict setValue:self.gender forKey:kHotLang_RandomGender];
    [mutableDict setValue:self.aid forKey:kHotLang_RandomAid];

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

    self.sign = [aDecoder decodeObjectForKey:kHotLang_RandomSign];
    self.iscollect = [aDecoder decodeObjectForKey:kHotLang_RandomIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotLang_RandomBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotLang_RandomUid];
    self.fid = [aDecoder decodeObjectForKey:kHotLang_RandomFid];
    self.url = [aDecoder decodeObjectForKey:kHotLang_RandomUrl];
    self.area = [aDecoder decodeObjectForKey:kHotLang_RandomArea];
    self.pic = [aDecoder decodeObjectForKey:kHotLang_RandomPic];
    self.title = [aDecoder decodeObjectForKey:kHotLang_RandomTitle];
    self.comment = [aDecoder decodeObjectForKey:kHotLang_RandomComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_RandomCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLang_RandomIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLang_RandomView];
    self.praise = [aDecoder decodeObjectForKey:kHotLang_RandomPraise];
    self.username = [aDecoder decodeObjectForKey:kHotLang_RandomUsername];
    self.pimg = [aDecoder decodeObjectForKey:kHotLang_RandomPimg];
    self.gender = [aDecoder decodeObjectForKey:kHotLang_RandomGender];
    self.aid = [aDecoder decodeObjectForKey:kHotLang_RandomAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sign forKey:kHotLang_RandomSign];
    [aCoder encodeObject:_iscollect forKey:kHotLang_RandomIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotLang_RandomBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotLang_RandomUid];
    [aCoder encodeObject:_fid forKey:kHotLang_RandomFid];
    [aCoder encodeObject:_url forKey:kHotLang_RandomUrl];
    [aCoder encodeObject:_area forKey:kHotLang_RandomArea];
    [aCoder encodeObject:_pic forKey:kHotLang_RandomPic];
    [aCoder encodeObject:_title forKey:kHotLang_RandomTitle];
    [aCoder encodeObject:_comment forKey:kHotLang_RandomComment];
    [aCoder encodeObject:_ctime forKey:kHotLang_RandomCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLang_RandomIspraise];
    [aCoder encodeObject:_view forKey:kHotLang_RandomView];
    [aCoder encodeObject:_praise forKey:kHotLang_RandomPraise];
    [aCoder encodeObject:_username forKey:kHotLang_RandomUsername];
    [aCoder encodeObject:_pimg forKey:kHotLang_RandomPimg];
    [aCoder encodeObject:_gender forKey:kHotLang_RandomGender];
    [aCoder encodeObject:_aid forKey:kHotLang_RandomAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Random *copy = [[HotLang_Random alloc] init];
    
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
