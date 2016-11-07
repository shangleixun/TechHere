//
//  HotTopic_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotTopic_Data.h"


NSString *const kHotTopic_DataIntroduction = @"introduction";
NSString *const kHotTopic_DataCtime = @"ctime";
NSString *const kHotTopic_DataId = @"id";
NSString *const kHotTopic_DataArticlecount = @"articlecount";
NSString *const kHotTopic_DataFollowcount = @"followcount";
NSString *const kHotTopic_DataImage = @"image";
NSString *const kHotTopic_DataEdittime = @"edittime";
NSString *const kHotTopic_DataIsfollow = @"isfollow";
NSString *const kHotTopic_DataName = @"name";


@interface HotTopic_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotTopic_Data

@synthesize introduction = _introduction;
@synthesize ctime = _ctime;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize articlecount = _articlecount;
@synthesize followcount = _followcount;
@synthesize image = _image;
@synthesize edittime = _edittime;
@synthesize isfollow = _isfollow;
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
            self.introduction = [self objectOrNilForKey:kHotTopic_DataIntroduction fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotTopic_DataCtime fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kHotTopic_DataId fromDictionary:dict];
            self.articlecount = [self objectOrNilForKey:kHotTopic_DataArticlecount fromDictionary:dict];
            self.followcount = [self objectOrNilForKey:kHotTopic_DataFollowcount fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHotTopic_DataImage fromDictionary:dict];
            self.edittime = [self objectOrNilForKey:kHotTopic_DataEdittime fromDictionary:dict];
            self.isfollow = [self objectOrNilForKey:kHotTopic_DataIsfollow fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHotTopic_DataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.introduction forKey:kHotTopic_DataIntroduction];
    [mutableDict setValue:self.ctime forKey:kHotTopic_DataCtime];
    [mutableDict setValue:self.dataIdentifier forKey:kHotTopic_DataId];
    [mutableDict setValue:self.articlecount forKey:kHotTopic_DataArticlecount];
    [mutableDict setValue:self.followcount forKey:kHotTopic_DataFollowcount];
    [mutableDict setValue:self.image forKey:kHotTopic_DataImage];
    [mutableDict setValue:self.edittime forKey:kHotTopic_DataEdittime];
    [mutableDict setValue:self.isfollow forKey:kHotTopic_DataIsfollow];
    [mutableDict setValue:self.name forKey:kHotTopic_DataName];

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

    self.introduction = [aDecoder decodeObjectForKey:kHotTopic_DataIntroduction];
    self.ctime = [aDecoder decodeObjectForKey:kHotTopic_DataCtime];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kHotTopic_DataId];
    self.articlecount = [aDecoder decodeObjectForKey:kHotTopic_DataArticlecount];
    self.followcount = [aDecoder decodeObjectForKey:kHotTopic_DataFollowcount];
    self.image = [aDecoder decodeObjectForKey:kHotTopic_DataImage];
    self.edittime = [aDecoder decodeObjectForKey:kHotTopic_DataEdittime];
    self.isfollow = [aDecoder decodeObjectForKey:kHotTopic_DataIsfollow];
    self.name = [aDecoder decodeObjectForKey:kHotTopic_DataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_introduction forKey:kHotTopic_DataIntroduction];
    [aCoder encodeObject:_ctime forKey:kHotTopic_DataCtime];
    [aCoder encodeObject:_dataIdentifier forKey:kHotTopic_DataId];
    [aCoder encodeObject:_articlecount forKey:kHotTopic_DataArticlecount];
    [aCoder encodeObject:_followcount forKey:kHotTopic_DataFollowcount];
    [aCoder encodeObject:_image forKey:kHotTopic_DataImage];
    [aCoder encodeObject:_edittime forKey:kHotTopic_DataEdittime];
    [aCoder encodeObject:_isfollow forKey:kHotTopic_DataIsfollow];
    [aCoder encodeObject:_name forKey:kHotTopic_DataName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotTopic_Data *copy = [[HotTopic_Data alloc] init];
    
    if (copy) {

        copy.introduction = [self.introduction copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.articlecount = [self.articlecount copyWithZone:zone];
        copy.followcount = [self.followcount copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.edittime = [self.edittime copyWithZone:zone];
        copy.isfollow = [self.isfollow copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
