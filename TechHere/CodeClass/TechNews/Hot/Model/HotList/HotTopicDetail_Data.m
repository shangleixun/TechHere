//
//  HotTopicDetail_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotTopicDetail_Data.h"


NSString *const kHotTopicDetail_DataContent = @"content";
NSString *const kHotTopicDetail_DataCategory = @"category";
NSString *const kHotTopicDetail_DataUid = @"uid";
NSString *const kHotTopicDetail_DataFid = @"fid";
NSString *const kHotTopicDetail_DataComment = @"comment";
NSString *const kHotTopicDetail_DataCid = @"cid";
NSString *const kHotTopicDetail_DataImage = @"image";
NSString *const kHotTopicDetail_DataPimg = @"pimg";
NSString *const kHotTopicDetail_DataIspraise = @"ispraise";
NSString *const kHotTopicDetail_DataPraise = @"praise";
NSString *const kHotTopicDetail_DataUsername = @"username";
NSString *const kHotTopicDetail_DataView = @"view";
NSString *const kHotTopicDetail_DataCtime = @"ctime";
NSString *const kHotTopicDetail_DataGender = @"gender";
NSString *const kHotTopicDetail_DataSign = @"sign";


@interface HotTopicDetail_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotTopicDetail_Data

@synthesize content = _content;
@synthesize category = _category;
@synthesize uid = _uid;
@synthesize fid = _fid;
@synthesize comment = _comment;
@synthesize cid = _cid;
@synthesize image = _image;
@synthesize pimg = _pimg;
@synthesize ispraise = _ispraise;
@synthesize praise = _praise;
@synthesize username = _username;
@synthesize view = _view;
@synthesize ctime = _ctime;
@synthesize gender = _gender;
@synthesize sign = _sign;


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
            self.content = [self objectOrNilForKey:kHotTopicDetail_DataContent fromDictionary:dict];
            self.category = [self objectOrNilForKey:kHotTopicDetail_DataCategory fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kHotTopicDetail_DataUid fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotTopicDetail_DataFid fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kHotTopicDetail_DataComment fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kHotTopicDetail_DataCid fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHotTopicDetail_DataImage fromDictionary:dict];
            self.pimg = [self objectOrNilForKey:kHotTopicDetail_DataPimg fromDictionary:dict];
            self.ispraise = [self objectOrNilForKey:kHotTopicDetail_DataIspraise fromDictionary:dict];
            self.praise = [self objectOrNilForKey:kHotTopicDetail_DataPraise fromDictionary:dict];
            self.username = [self objectOrNilForKey:kHotTopicDetail_DataUsername fromDictionary:dict];
            self.view = [self objectOrNilForKey:kHotTopicDetail_DataView fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotTopicDetail_DataCtime fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotTopicDetail_DataGender fromDictionary:dict];
            self.sign = [self objectOrNilForKey:kHotTopicDetail_DataSign fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.content forKey:kHotTopicDetail_DataContent];
    [mutableDict setValue:self.category forKey:kHotTopicDetail_DataCategory];
    [mutableDict setValue:self.uid forKey:kHotTopicDetail_DataUid];
    [mutableDict setValue:self.fid forKey:kHotTopicDetail_DataFid];
    [mutableDict setValue:self.comment forKey:kHotTopicDetail_DataComment];
    [mutableDict setValue:self.cid forKey:kHotTopicDetail_DataCid];
    [mutableDict setValue:self.image forKey:kHotTopicDetail_DataImage];
    [mutableDict setValue:self.pimg forKey:kHotTopicDetail_DataPimg];
    [mutableDict setValue:self.ispraise forKey:kHotTopicDetail_DataIspraise];
    [mutableDict setValue:self.praise forKey:kHotTopicDetail_DataPraise];
    [mutableDict setValue:self.username forKey:kHotTopicDetail_DataUsername];
    [mutableDict setValue:self.view forKey:kHotTopicDetail_DataView];
    [mutableDict setValue:self.ctime forKey:kHotTopicDetail_DataCtime];
    [mutableDict setValue:self.gender forKey:kHotTopicDetail_DataGender];
    [mutableDict setValue:self.sign forKey:kHotTopicDetail_DataSign];

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

    self.content = [aDecoder decodeObjectForKey:kHotTopicDetail_DataContent];
    self.category = [aDecoder decodeObjectForKey:kHotTopicDetail_DataCategory];
    self.uid = [aDecoder decodeObjectForKey:kHotTopicDetail_DataUid];
    self.fid = [aDecoder decodeObjectForKey:kHotTopicDetail_DataFid];
    self.comment = [aDecoder decodeObjectForKey:kHotTopicDetail_DataComment];
    self.cid = [aDecoder decodeObjectForKey:kHotTopicDetail_DataCid];
    self.image = [aDecoder decodeObjectForKey:kHotTopicDetail_DataImage];
    self.pimg = [aDecoder decodeObjectForKey:kHotTopicDetail_DataPimg];
    self.ispraise = [aDecoder decodeObjectForKey:kHotTopicDetail_DataIspraise];
    self.praise = [aDecoder decodeObjectForKey:kHotTopicDetail_DataPraise];
    self.username = [aDecoder decodeObjectForKey:kHotTopicDetail_DataUsername];
    self.view = [aDecoder decodeObjectForKey:kHotTopicDetail_DataView];
    self.ctime = [aDecoder decodeObjectForKey:kHotTopicDetail_DataCtime];
    self.gender = [aDecoder decodeObjectForKey:kHotTopicDetail_DataGender];
    self.sign = [aDecoder decodeObjectForKey:kHotTopicDetail_DataSign];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_content forKey:kHotTopicDetail_DataContent];
    [aCoder encodeObject:_category forKey:kHotTopicDetail_DataCategory];
    [aCoder encodeObject:_uid forKey:kHotTopicDetail_DataUid];
    [aCoder encodeObject:_fid forKey:kHotTopicDetail_DataFid];
    [aCoder encodeObject:_comment forKey:kHotTopicDetail_DataComment];
    [aCoder encodeObject:_cid forKey:kHotTopicDetail_DataCid];
    [aCoder encodeObject:_image forKey:kHotTopicDetail_DataImage];
    [aCoder encodeObject:_pimg forKey:kHotTopicDetail_DataPimg];
    [aCoder encodeObject:_ispraise forKey:kHotTopicDetail_DataIspraise];
    [aCoder encodeObject:_praise forKey:kHotTopicDetail_DataPraise];
    [aCoder encodeObject:_username forKey:kHotTopicDetail_DataUsername];
    [aCoder encodeObject:_view forKey:kHotTopicDetail_DataView];
    [aCoder encodeObject:_ctime forKey:kHotTopicDetail_DataCtime];
    [aCoder encodeObject:_gender forKey:kHotTopicDetail_DataGender];
    [aCoder encodeObject:_sign forKey:kHotTopicDetail_DataSign];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotTopicDetail_Data *copy = [[HotTopicDetail_Data alloc] init];
    
    if (copy) {

        copy.content = [self.content copyWithZone:zone];
        copy.category = [self.category copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.pimg = [self.pimg copyWithZone:zone];
        copy.ispraise = [self.ispraise copyWithZone:zone];
        copy.praise = [self.praise copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.view = [self.view copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.sign = [self.sign copyWithZone:zone];
    }
    
    return copy;
}


@end
