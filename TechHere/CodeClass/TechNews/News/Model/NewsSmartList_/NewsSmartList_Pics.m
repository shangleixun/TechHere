//
//  NewsSmartList_Pics.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsSmartList_Pics.h"


NSString *const kNewsSmartList_PicsImgsrc = @"imgsrc";
NSString *const kNewsSmartList_PicsId = @"id";
NSString *const kNewsSmartList_PicsImgsrc2 = @"imgsrc2";
NSString *const kNewsSmartList_PicsUrl = @"url";
NSString *const kNewsSmartList_PicsType = @"type";
NSString *const kNewsSmartList_PicsStitle = @"stitle";


@interface NewsSmartList_Pics ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsSmartList_Pics

@synthesize imgsrc = _imgsrc;
@synthesize picsIdentifier = _picsIdentifier;
@synthesize imgsrc2 = _imgsrc2;
@synthesize url = _url;
@synthesize type = _type;
@synthesize stitle = _stitle;


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
            self.imgsrc = [self objectOrNilForKey:kNewsSmartList_PicsImgsrc fromDictionary:dict];
            self.picsIdentifier = [self objectOrNilForKey:kNewsSmartList_PicsId fromDictionary:dict];
            self.imgsrc2 = [self objectOrNilForKey:kNewsSmartList_PicsImgsrc2 fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsSmartList_PicsUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kNewsSmartList_PicsType fromDictionary:dict];
            self.stitle = [self objectOrNilForKey:kNewsSmartList_PicsStitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.imgsrc forKey:kNewsSmartList_PicsImgsrc];
    [mutableDict setValue:self.picsIdentifier forKey:kNewsSmartList_PicsId];
    [mutableDict setValue:self.imgsrc2 forKey:kNewsSmartList_PicsImgsrc2];
    [mutableDict setValue:self.url forKey:kNewsSmartList_PicsUrl];
    [mutableDict setValue:self.type forKey:kNewsSmartList_PicsType];
    [mutableDict setValue:self.stitle forKey:kNewsSmartList_PicsStitle];

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

    self.imgsrc = [aDecoder decodeObjectForKey:kNewsSmartList_PicsImgsrc];
    self.picsIdentifier = [aDecoder decodeObjectForKey:kNewsSmartList_PicsId];
    self.imgsrc2 = [aDecoder decodeObjectForKey:kNewsSmartList_PicsImgsrc2];
    self.url = [aDecoder decodeObjectForKey:kNewsSmartList_PicsUrl];
    self.type = [aDecoder decodeObjectForKey:kNewsSmartList_PicsType];
    self.stitle = [aDecoder decodeObjectForKey:kNewsSmartList_PicsStitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_imgsrc forKey:kNewsSmartList_PicsImgsrc];
    [aCoder encodeObject:_picsIdentifier forKey:kNewsSmartList_PicsId];
    [aCoder encodeObject:_imgsrc2 forKey:kNewsSmartList_PicsImgsrc2];
    [aCoder encodeObject:_url forKey:kNewsSmartList_PicsUrl];
    [aCoder encodeObject:_type forKey:kNewsSmartList_PicsType];
    [aCoder encodeObject:_stitle forKey:kNewsSmartList_PicsStitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsSmartList_Pics *copy = [[NewsSmartList_Pics alloc] init];
    
    if (copy) {

        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.picsIdentifier = [self.picsIdentifier copyWithZone:zone];
        copy.imgsrc2 = [self.imgsrc2 copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.stitle = [self.stitle copyWithZone:zone];
    }
    
    return copy;
}


@end
