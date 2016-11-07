//
//  HotSpecial_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotSpecial_Data.h"


NSString *const kHotSpecial_DataId = @"id";
NSString *const kHotSpecial_DataIsfollow = @"isfollow";
NSString *const kHotSpecial_DataIntroduction = @"introduction";
NSString *const kHotSpecial_DataOriginimage = @"originimage";
NSString *const kHotSpecial_DataFid = @"fid";
NSString *const kHotSpecial_DataTpimg = @"tpimg";
NSString *const kHotSpecial_DataFollowcount = @"followcount";
NSString *const kHotSpecial_DataTag = @"tag";
NSString *const kHotSpecial_DataImage = @"image";
NSString *const kHotSpecial_DataCtime = @"ctime";
NSString *const kHotSpecial_DataArticlecount = @"articlecount";
NSString *const kHotSpecial_DataName = @"name";


@interface HotSpecial_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotSpecial_Data

@synthesize dataIdentifier = _dataIdentifier;
@synthesize isfollow = _isfollow;
@synthesize introduction = _introduction;
@synthesize originimage = _originimage;
@synthesize fid = _fid;
@synthesize tpimg = _tpimg;
@synthesize followcount = _followcount;
@synthesize tag = _tag;
@synthesize image = _image;
@synthesize ctime = _ctime;
@synthesize articlecount = _articlecount;
@synthesize name = _name;


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
            self.dataIdentifier = [self objectOrNilForKey:kHotSpecial_DataId fromDictionary:dict];
            self.isfollow = [self objectOrNilForKey:kHotSpecial_DataIsfollow fromDictionary:dict];
            self.introduction = [self objectOrNilForKey:kHotSpecial_DataIntroduction fromDictionary:dict];
            self.originimage = [self objectOrNilForKey:kHotSpecial_DataOriginimage fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotSpecial_DataFid fromDictionary:dict];
            self.tpimg = [self objectOrNilForKey:kHotSpecial_DataTpimg fromDictionary:dict];
            self.followcount = [self objectOrNilForKey:kHotSpecial_DataFollowcount fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHotSpecial_DataTag fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHotSpecial_DataImage fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotSpecial_DataCtime fromDictionary:dict];
            self.articlecount = [self objectOrNilForKey:kHotSpecial_DataArticlecount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHotSpecial_DataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kHotSpecial_DataId];
    [mutableDict setValue:self.isfollow forKey:kHotSpecial_DataIsfollow];
    [mutableDict setValue:self.introduction forKey:kHotSpecial_DataIntroduction];
    [mutableDict setValue:self.originimage forKey:kHotSpecial_DataOriginimage];
    [mutableDict setValue:self.fid forKey:kHotSpecial_DataFid];
    [mutableDict setValue:self.tpimg forKey:kHotSpecial_DataTpimg];
    [mutableDict setValue:self.followcount forKey:kHotSpecial_DataFollowcount];
    [mutableDict setValue:self.tag forKey:kHotSpecial_DataTag];
    [mutableDict setValue:self.image forKey:kHotSpecial_DataImage];
    [mutableDict setValue:self.ctime forKey:kHotSpecial_DataCtime];
    [mutableDict setValue:self.articlecount forKey:kHotSpecial_DataArticlecount];
    [mutableDict setValue:self.name forKey:kHotSpecial_DataName];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kHotSpecial_DataId];
    self.isfollow = [aDecoder decodeObjectForKey:kHotSpecial_DataIsfollow];
    self.introduction = [aDecoder decodeObjectForKey:kHotSpecial_DataIntroduction];
    self.originimage = [aDecoder decodeObjectForKey:kHotSpecial_DataOriginimage];
    self.fid = [aDecoder decodeObjectForKey:kHotSpecial_DataFid];
    self.tpimg = [aDecoder decodeObjectForKey:kHotSpecial_DataTpimg];
    self.followcount = [aDecoder decodeObjectForKey:kHotSpecial_DataFollowcount];
    self.tag = [aDecoder decodeObjectForKey:kHotSpecial_DataTag];
    self.image = [aDecoder decodeObjectForKey:kHotSpecial_DataImage];
    self.ctime = [aDecoder decodeObjectForKey:kHotSpecial_DataCtime];
    self.articlecount = [aDecoder decodeObjectForKey:kHotSpecial_DataArticlecount];
    self.name = [aDecoder decodeObjectForKey:kHotSpecial_DataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kHotSpecial_DataId];
    [aCoder encodeObject:_isfollow forKey:kHotSpecial_DataIsfollow];
    [aCoder encodeObject:_introduction forKey:kHotSpecial_DataIntroduction];
    [aCoder encodeObject:_originimage forKey:kHotSpecial_DataOriginimage];
    [aCoder encodeObject:_fid forKey:kHotSpecial_DataFid];
    [aCoder encodeObject:_tpimg forKey:kHotSpecial_DataTpimg];
    [aCoder encodeObject:_followcount forKey:kHotSpecial_DataFollowcount];
    [aCoder encodeObject:_tag forKey:kHotSpecial_DataTag];
    [aCoder encodeObject:_image forKey:kHotSpecial_DataImage];
    [aCoder encodeObject:_ctime forKey:kHotSpecial_DataCtime];
    [aCoder encodeObject:_articlecount forKey:kHotSpecial_DataArticlecount];
    [aCoder encodeObject:_name forKey:kHotSpecial_DataName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotSpecial_Data *copy = [[HotSpecial_Data alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.isfollow = [self.isfollow copyWithZone:zone];
        copy.introduction = [self.introduction copyWithZone:zone];
        copy.originimage = [self.originimage copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.tpimg = [self.tpimg copyWithZone:zone];
        copy.followcount = [self.followcount copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.articlecount = [self.articlecount copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
