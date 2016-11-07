//
//  HotLangList_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLangList_Data.h"


NSString *const kHotLangList_DataSign = @"sign";
NSString *const kHotLangList_DataIscollect = @"iscollect";
NSString *const kHotLangList_DataBiaoqian = @"biaoqian";
NSString *const kHotLangList_DataUid = @"uid";
NSString *const kHotLangList_DataFid = @"fid";
NSString *const kHotLangList_DataUrl = @"url";
NSString *const kHotLangList_DataArea = @"area";
NSString *const kHotLangList_DataPic = @"pic";
NSString *const kHotLangList_DataTitle = @"title";
NSString *const kHotLangList_DataTag = @"tag";
NSString *const kHotLangList_DataComment = @"comment";
NSString *const kHotLangList_DataCtime = @"ctime";
NSString *const kHotLangList_DataIspraise = @"ispraise";
NSString *const kHotLangList_DataView = @"view";
NSString *const kHotLangList_DataPraise = @"praise";
NSString *const kHotLangList_DataUsername = @"username";
NSString *const kHotLangList_DataPimg = @"pimg";
NSString *const kHotLangList_DataGender = @"gender";
NSString *const kHotLangList_DataAid = @"aid";


@interface HotLangList_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLangList_Data

@synthesize sign = _sign;
@synthesize iscollect = _iscollect;
@synthesize biaoqian = _biaoqian;
@synthesize uid = _uid;
@synthesize fid = _fid;
@synthesize url = _url;
@synthesize area = _area;
@synthesize pic = _pic;
@synthesize title = _title;
@synthesize tag = _tag;
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
            self.sign = [self objectOrNilForKey:kHotLangList_DataSign fromDictionary:dict];
            self.iscollect = [self objectOrNilForKey:kHotLangList_DataIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotLangList_DataBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotLangList_DataUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLangList_DataFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotLangList_DataUrl fromDictionary:dict];
            self.area = [self objectOrNilForKey:kHotLangList_DataArea fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotLangList_DataPic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotLangList_DataTitle fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHotLangList_DataTag fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotLangList_DataComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLangList_DataCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotLangList_DataIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotLangList_DataView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotLangList_DataPraise fromDictionary:dict];
            self.username = [self objectOrNilForKey:kHotLangList_DataUsername fromDictionary:dict];
            self.pimg = [self objectOrNilForKey:kHotLangList_DataPimg fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotLangList_DataGender fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotLangList_DataAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sign forKey:kHotLangList_DataSign];
    [mutableDict setValue:self.iscollect forKey:kHotLangList_DataIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotLangList_DataBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotLangList_DataUid];
    [mutableDict setValue:self.fid forKey:kHotLangList_DataFid];
    [mutableDict setValue:self.url forKey:kHotLangList_DataUrl];
    [mutableDict setValue:self.area forKey:kHotLangList_DataArea];
    [mutableDict setValue:self.pic forKey:kHotLangList_DataPic];
    [mutableDict setValue:self.title forKey:kHotLangList_DataTitle];
    [mutableDict setValue:self.tag forKey:kHotLangList_DataTag];
    [mutableDict setValue:self.comment forKey:kHotLangList_DataComment];
    [mutableDict setValue:self.ctime forKey:kHotLangList_DataCtime];
    [mutableDict setValue:self.ispraise forKey:kHotLangList_DataIspraise];
    [mutableDict setValue:self.view forKey:kHotLangList_DataView];
    [mutableDict setValue:self.praise forKey:kHotLangList_DataPraise];
    [mutableDict setValue:self.username forKey:kHotLangList_DataUsername];
    [mutableDict setValue:self.pimg forKey:kHotLangList_DataPimg];
    [mutableDict setValue:self.gender forKey:kHotLangList_DataGender];
    [mutableDict setValue:self.aid forKey:kHotLangList_DataAid];

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

    self.sign = [aDecoder decodeObjectForKey:kHotLangList_DataSign];
    self.iscollect = [aDecoder decodeObjectForKey:kHotLangList_DataIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotLangList_DataBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotLangList_DataUid];
    self.fid = [aDecoder decodeObjectForKey:kHotLangList_DataFid];
    self.url = [aDecoder decodeObjectForKey:kHotLangList_DataUrl];
    self.area = [aDecoder decodeObjectForKey:kHotLangList_DataArea];
    self.pic = [aDecoder decodeObjectForKey:kHotLangList_DataPic];
    self.title = [aDecoder decodeObjectForKey:kHotLangList_DataTitle];
    self.tag = [aDecoder decodeObjectForKey:kHotLangList_DataTag];
    self.comment = [aDecoder decodeObjectForKey:kHotLangList_DataComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotLangList_DataCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotLangList_DataIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotLangList_DataView];
    self.praise = [aDecoder decodeObjectForKey:kHotLangList_DataPraise];
    self.username = [aDecoder decodeObjectForKey:kHotLangList_DataUsername];
    self.pimg = [aDecoder decodeObjectForKey:kHotLangList_DataPimg];
    self.gender = [aDecoder decodeObjectForKey:kHotLangList_DataGender];
    self.aid = [aDecoder decodeObjectForKey:kHotLangList_DataAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sign forKey:kHotLangList_DataSign];
    [aCoder encodeObject:_iscollect forKey:kHotLangList_DataIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotLangList_DataBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotLangList_DataUid];
    [aCoder encodeObject:_fid forKey:kHotLangList_DataFid];
    [aCoder encodeObject:_url forKey:kHotLangList_DataUrl];
    [aCoder encodeObject:_area forKey:kHotLangList_DataArea];
    [aCoder encodeObject:_pic forKey:kHotLangList_DataPic];
    [aCoder encodeObject:_title forKey:kHotLangList_DataTitle];
    [aCoder encodeObject:_tag forKey:kHotLangList_DataTag];
    [aCoder encodeObject:_comment forKey:kHotLangList_DataComment];
    [aCoder encodeObject:_ctime forKey:kHotLangList_DataCtime];
    [aCoder encodeObject:_ispraise forKey:kHotLangList_DataIspraise];
    [aCoder encodeObject:_view forKey:kHotLangList_DataView];
    [aCoder encodeObject:_praise forKey:kHotLangList_DataPraise];
    [aCoder encodeObject:_username forKey:kHotLangList_DataUsername];
    [aCoder encodeObject:_pimg forKey:kHotLangList_DataPimg];
    [aCoder encodeObject:_gender forKey:kHotLangList_DataGender];
    [aCoder encodeObject:_aid forKey:kHotLangList_DataAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLangList_Data *copy = [[HotLangList_Data alloc] init];
    
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
        copy.tag = [self.tag copyWithZone:zone];
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
