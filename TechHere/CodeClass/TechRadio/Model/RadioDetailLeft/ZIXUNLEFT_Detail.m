//
//  ZIXUNLEFT_Detail.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_Detail.h"


NSString *const kZIXUNLEFT_DetailTags = @"tags";
NSString *const kZIXUNLEFT_DetailIntroRich = @"introRich";
NSString *const kZIXUNLEFT_DetailAlbumId = @"albumId";
NSString *const kZIXUNLEFT_DetailIntro = @"intro";


@interface ZIXUNLEFT_Detail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_Detail

@synthesize tags = _tags;
@synthesize introRich = _introRich;
@synthesize albumId = _albumId;
@synthesize intro = _intro;


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
            self.tags = [self objectOrNilForKey:kZIXUNLEFT_DetailTags fromDictionary:dict];
            self.introRich = [self objectOrNilForKey:kZIXUNLEFT_DetailIntroRich fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kZIXUNLEFT_DetailAlbumId fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kZIXUNLEFT_DetailIntro fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tags forKey:kZIXUNLEFT_DetailTags];
    [mutableDict setValue:self.introRich forKey:kZIXUNLEFT_DetailIntroRich];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kZIXUNLEFT_DetailAlbumId];
    [mutableDict setValue:self.intro forKey:kZIXUNLEFT_DetailIntro];

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

    self.tags = [aDecoder decodeObjectForKey:kZIXUNLEFT_DetailTags];
    self.introRich = [aDecoder decodeObjectForKey:kZIXUNLEFT_DetailIntroRich];
    self.albumId = [aDecoder decodeDoubleForKey:kZIXUNLEFT_DetailAlbumId];
    self.intro = [aDecoder decodeObjectForKey:kZIXUNLEFT_DetailIntro];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tags forKey:kZIXUNLEFT_DetailTags];
    [aCoder encodeObject:_introRich forKey:kZIXUNLEFT_DetailIntroRich];
    [aCoder encodeDouble:_albumId forKey:kZIXUNLEFT_DetailAlbumId];
    [aCoder encodeObject:_intro forKey:kZIXUNLEFT_DetailIntro];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_Detail *copy = [[ZIXUNLEFT_Detail alloc] init];
    
    if (copy) {

        copy.tags = [self.tags copyWithZone:zone];
        copy.introRich = [self.introRich copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.intro = [self.intro copyWithZone:zone];
    }
    
    return copy;
}


@end
