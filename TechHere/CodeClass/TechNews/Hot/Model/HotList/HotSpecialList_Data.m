//
//  HotSpecialList_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotSpecialList_Data.h"


NSString *const kHotSpecialList_DataSign = @"sign";
NSString *const kHotSpecialList_DataIscollect = @"iscollect";
NSString *const kHotSpecialList_DataBiaoqian = @"biaoqian";
NSString *const kHotSpecialList_DataUid = @"uid";
NSString *const kHotSpecialList_DataFid = @"fid";
NSString *const kHotSpecialList_DataUrl = @"url";
NSString *const kHotSpecialList_DataArea = @"area";
NSString *const kHotSpecialList_DataPic = @"pic";
NSString *const kHotSpecialList_DataTitle = @"title";
NSString *const kHotSpecialList_DataTag = @"tag";
NSString *const kHotSpecialList_DataComment = @"comment";
NSString *const kHotSpecialList_DataCtime = @"ctime";
NSString *const kHotSpecialList_DataIspraise = @"ispraise";
NSString *const kHotSpecialList_DataView = @"view";
NSString *const kHotSpecialList_DataPraise = @"praise";
NSString *const kHotSpecialList_DataUsername = @"username";
NSString *const kHotSpecialList_DataPimg = @"pimg";
NSString *const kHotSpecialList_DataGender = @"gender";
NSString *const kHotSpecialList_DataAid = @"aid";


@interface HotSpecialList_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotSpecialList_Data

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
            self.sign = [self objectOrNilForKey:kHotSpecialList_DataSign fromDictionary:dict];
            self.iscollect = [self objectOrNilForKey:kHotSpecialList_DataIscollect fromDictionary:dict];
            self.biaoqian = [self objectOrNilForKey:kHotSpecialList_DataBiaoqian fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotSpecialList_DataUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotSpecialList_DataFid fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotSpecialList_DataUrl fromDictionary:dict];
            self.area = [self objectOrNilForKey:kHotSpecialList_DataArea fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kHotSpecialList_DataPic fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHotSpecialList_DataTitle fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHotSpecialList_DataTag fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotSpecialList_DataComment fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotSpecialList_DataCtime fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotSpecialList_DataIspraise fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotSpecialList_DataView fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotSpecialList_DataPraise fromDictionary:dict];
            self.username = [self objectOrNilForKey:kHotSpecialList_DataUsername fromDictionary:dict];
            self.pimg = [self objectOrNilForKey:kHotSpecialList_DataPimg fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotSpecialList_DataGender fromDictionary:dict];
            self.aid = [self objectOrNilForKey:kHotSpecialList_DataAid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sign forKey:kHotSpecialList_DataSign];
    [mutableDict setValue:self.iscollect forKey:kHotSpecialList_DataIscollect];
    [mutableDict setValue:self.biaoqian forKey:kHotSpecialList_DataBiaoqian];
    [mutableDict setValue:self.uid forKey:kHotSpecialList_DataUid];
    [mutableDict setValue:self.fid forKey:kHotSpecialList_DataFid];
    [mutableDict setValue:self.url forKey:kHotSpecialList_DataUrl];
    [mutableDict setValue:self.area forKey:kHotSpecialList_DataArea];
    [mutableDict setValue:self.pic forKey:kHotSpecialList_DataPic];
    [mutableDict setValue:self.title forKey:kHotSpecialList_DataTitle];
    [mutableDict setValue:self.tag forKey:kHotSpecialList_DataTag];
    [mutableDict setValue:self.comment forKey:kHotSpecialList_DataComment];
    [mutableDict setValue:self.ctime forKey:kHotSpecialList_DataCtime];
    [mutableDict setValue:self.ispraise forKey:kHotSpecialList_DataIspraise];
    [mutableDict setValue:self.view forKey:kHotSpecialList_DataView];
    [mutableDict setValue:self.praise forKey:kHotSpecialList_DataPraise];
    [mutableDict setValue:self.username forKey:kHotSpecialList_DataUsername];
    [mutableDict setValue:self.pimg forKey:kHotSpecialList_DataPimg];
    [mutableDict setValue:self.gender forKey:kHotSpecialList_DataGender];
    [mutableDict setValue:self.aid forKey:kHotSpecialList_DataAid];

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

    self.sign = [aDecoder decodeObjectForKey:kHotSpecialList_DataSign];
    self.iscollect = [aDecoder decodeObjectForKey:kHotSpecialList_DataIscollect];
    self.biaoqian = [aDecoder decodeObjectForKey:kHotSpecialList_DataBiaoqian];
    self.uid = [aDecoder decodeObjectForKey:kHotSpecialList_DataUid];
    self.fid = [aDecoder decodeObjectForKey:kHotSpecialList_DataFid];
    self.url = [aDecoder decodeObjectForKey:kHotSpecialList_DataUrl];
    self.area = [aDecoder decodeObjectForKey:kHotSpecialList_DataArea];
    self.pic = [aDecoder decodeObjectForKey:kHotSpecialList_DataPic];
    self.title = [aDecoder decodeObjectForKey:kHotSpecialList_DataTitle];
    self.tag = [aDecoder decodeObjectForKey:kHotSpecialList_DataTag];
    self.comment = [aDecoder decodeObjectForKey:kHotSpecialList_DataComment];
    self.ctime = [aDecoder decodeObjectForKey:kHotSpecialList_DataCtime];
    self.ispraise = [aDecoder decodeObjectForKey:kHotSpecialList_DataIspraise];
    self.view = [aDecoder decodeObjectForKey:kHotSpecialList_DataView];
    self.praise = [aDecoder decodeObjectForKey:kHotSpecialList_DataPraise];
    self.username = [aDecoder decodeObjectForKey:kHotSpecialList_DataUsername];
    self.pimg = [aDecoder decodeObjectForKey:kHotSpecialList_DataPimg];
    self.gender = [aDecoder decodeObjectForKey:kHotSpecialList_DataGender];
    self.aid = [aDecoder decodeObjectForKey:kHotSpecialList_DataAid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sign forKey:kHotSpecialList_DataSign];
    [aCoder encodeObject:_iscollect forKey:kHotSpecialList_DataIscollect];
    [aCoder encodeObject:_biaoqian forKey:kHotSpecialList_DataBiaoqian];
    [aCoder encodeObject:_uid forKey:kHotSpecialList_DataUid];
    [aCoder encodeObject:_fid forKey:kHotSpecialList_DataFid];
    [aCoder encodeObject:_url forKey:kHotSpecialList_DataUrl];
    [aCoder encodeObject:_area forKey:kHotSpecialList_DataArea];
    [aCoder encodeObject:_pic forKey:kHotSpecialList_DataPic];
    [aCoder encodeObject:_title forKey:kHotSpecialList_DataTitle];
    [aCoder encodeObject:_tag forKey:kHotSpecialList_DataTag];
    [aCoder encodeObject:_comment forKey:kHotSpecialList_DataComment];
    [aCoder encodeObject:_ctime forKey:kHotSpecialList_DataCtime];
    [aCoder encodeObject:_ispraise forKey:kHotSpecialList_DataIspraise];
    [aCoder encodeObject:_view forKey:kHotSpecialList_DataView];
    [aCoder encodeObject:_praise forKey:kHotSpecialList_DataPraise];
    [aCoder encodeObject:_username forKey:kHotSpecialList_DataUsername];
    [aCoder encodeObject:_pimg forKey:kHotSpecialList_DataPimg];
    [aCoder encodeObject:_gender forKey:kHotSpecialList_DataGender];
    [aCoder encodeObject:_aid forKey:kHotSpecialList_DataAid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotSpecialList_Data *copy = [[HotSpecialList_Data alloc] init];
    
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
