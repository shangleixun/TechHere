//
//  HotLang_Category.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLang_Category.h"


NSString *const kHotLang_CategoryIntroduction = @"introduction";
NSString *const kHotLang_CategoryCtime = @"ctime";
NSString *const kHotLang_CategoryId = @"id";
NSString *const kHotLang_CategoryOriginimage = @"originimage";
NSString *const kHotLang_CategoryFollowcount = @"followcount";
NSString *const kHotLang_CategoryImage = @"image";
NSString *const kHotLang_CategoryTag = @"tag";
NSString *const kHotLang_CategoryFid = @"fid";
NSString *const kHotLang_CategoryArticlecount = @"articlecount";
NSString *const kHotLang_CategoryTpimg = @"tpimg";
NSString *const kHotLang_CategoryName = @"name";


@interface HotLang_Category ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLang_Category

@synthesize introduction = _introduction;
@synthesize ctime = _ctime;
@synthesize categoryIdentifier = _categoryIdentifier;
@synthesize originimage = _originimage;
@synthesize followcount = _followcount;
@synthesize image = _image;
@synthesize tag = _tag;
@synthesize fid = _fid;
@synthesize articlecount = _articlecount;
@synthesize tpimg = _tpimg;
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
            self.introduction = [self objectOrNilForKey:kHotLang_CategoryIntroduction fromDictionary:dict];
            self.ctime = [self objectOrNilForKey:kHotLang_CategoryCtime fromDictionary:dict];
            self.categoryIdentifier = [self objectOrNilForKey:kHotLang_CategoryId fromDictionary:dict];
            self.originimage = [self objectOrNilForKey:kHotLang_CategoryOriginimage fromDictionary:dict];
            self.followcount = [self objectOrNilForKey:kHotLang_CategoryFollowcount fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHotLang_CategoryImage fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kHotLang_CategoryTag fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotLang_CategoryFid fromDictionary:dict];
            self.articlecount = [self objectOrNilForKey:kHotLang_CategoryArticlecount fromDictionary:dict];
            self.tpimg = [self objectOrNilForKey:kHotLang_CategoryTpimg fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHotLang_CategoryName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.introduction forKey:kHotLang_CategoryIntroduction];
    [mutableDict setValue:self.ctime forKey:kHotLang_CategoryCtime];
    [mutableDict setValue:self.categoryIdentifier forKey:kHotLang_CategoryId];
    [mutableDict setValue:self.originimage forKey:kHotLang_CategoryOriginimage];
    [mutableDict setValue:self.followcount forKey:kHotLang_CategoryFollowcount];
    [mutableDict setValue:self.image forKey:kHotLang_CategoryImage];
    [mutableDict setValue:self.tag forKey:kHotLang_CategoryTag];
    [mutableDict setValue:self.fid forKey:kHotLang_CategoryFid];
    [mutableDict setValue:self.articlecount forKey:kHotLang_CategoryArticlecount];
    [mutableDict setValue:self.tpimg forKey:kHotLang_CategoryTpimg];
    [mutableDict setValue:self.name forKey:kHotLang_CategoryName];

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

    self.introduction = [aDecoder decodeObjectForKey:kHotLang_CategoryIntroduction];
    self.ctime = [aDecoder decodeObjectForKey:kHotLang_CategoryCtime];
    self.categoryIdentifier = [aDecoder decodeObjectForKey:kHotLang_CategoryId];
    self.originimage = [aDecoder decodeObjectForKey:kHotLang_CategoryOriginimage];
    self.followcount = [aDecoder decodeObjectForKey:kHotLang_CategoryFollowcount];
    self.image = [aDecoder decodeObjectForKey:kHotLang_CategoryImage];
    self.tag = [aDecoder decodeObjectForKey:kHotLang_CategoryTag];
    self.fid = [aDecoder decodeObjectForKey:kHotLang_CategoryFid];
    self.articlecount = [aDecoder decodeObjectForKey:kHotLang_CategoryArticlecount];
    self.tpimg = [aDecoder decodeObjectForKey:kHotLang_CategoryTpimg];
    self.name = [aDecoder decodeObjectForKey:kHotLang_CategoryName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_introduction forKey:kHotLang_CategoryIntroduction];
    [aCoder encodeObject:_ctime forKey:kHotLang_CategoryCtime];
    [aCoder encodeObject:_categoryIdentifier forKey:kHotLang_CategoryId];
    [aCoder encodeObject:_originimage forKey:kHotLang_CategoryOriginimage];
    [aCoder encodeObject:_followcount forKey:kHotLang_CategoryFollowcount];
    [aCoder encodeObject:_image forKey:kHotLang_CategoryImage];
    [aCoder encodeObject:_tag forKey:kHotLang_CategoryTag];
    [aCoder encodeObject:_fid forKey:kHotLang_CategoryFid];
    [aCoder encodeObject:_articlecount forKey:kHotLang_CategoryArticlecount];
    [aCoder encodeObject:_tpimg forKey:kHotLang_CategoryTpimg];
    [aCoder encodeObject:_name forKey:kHotLang_CategoryName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLang_Category *copy = [[HotLang_Category alloc] init];
    
    if (copy) {

        copy.introduction = [self.introduction copyWithZone:zone];
        copy.ctime = [self.ctime copyWithZone:zone];
        copy.categoryIdentifier = [self.categoryIdentifier copyWithZone:zone];
        copy.originimage = [self.originimage copyWithZone:zone];
        copy.followcount = [self.followcount copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.articlecount = [self.articlecount copyWithZone:zone];
        copy.tpimg = [self.tpimg copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
