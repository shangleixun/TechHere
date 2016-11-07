//
//  Total_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Total_BaseClass.h"
#import "Total_CategoryContents.h"
#import "Total_Keywords.h"
#import "Total_FocusImages.h"


NSString *const kTotal_BaseClassCategoryContents = @"categoryContents";
NSString *const kTotal_BaseClassHasRecommendedZones = @"hasRecommendedZones";
NSString *const kTotal_BaseClassKeywords = @"keywords";
NSString *const kTotal_BaseClassFocusImages = @"focusImages";
NSString *const kTotal_BaseClassMsg = @"msg";
NSString *const kTotal_BaseClassRet = @"ret";


@interface Total_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Total_BaseClass

@synthesize categoryContents = _categoryContents;
@synthesize hasRecommendedZones = _hasRecommendedZones;
@synthesize keywords = _keywords;
@synthesize focusImages = _focusImages;
@synthesize msg = _msg;
@synthesize ret = _ret;


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
            self.categoryContents = [Total_CategoryContents modelObjectWithDictionary:[dict objectForKey:kTotal_BaseClassCategoryContents]];
            self.hasRecommendedZones = [[self objectOrNilForKey:kTotal_BaseClassHasRecommendedZones fromDictionary:dict] boolValue];
            self.keywords = [Total_Keywords modelObjectWithDictionary:[dict objectForKey:kTotal_BaseClassKeywords]];
            self.focusImages = [Total_FocusImages modelObjectWithDictionary:[dict objectForKey:kTotal_BaseClassFocusImages]];
            self.msg = [self objectOrNilForKey:kTotal_BaseClassMsg fromDictionary:dict];
            self.ret = [[self objectOrNilForKey:kTotal_BaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.categoryContents dictionaryRepresentation] forKey:kTotal_BaseClassCategoryContents];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasRecommendedZones] forKey:kTotal_BaseClassHasRecommendedZones];
    [mutableDict setValue:[self.keywords dictionaryRepresentation] forKey:kTotal_BaseClassKeywords];
    [mutableDict setValue:[self.focusImages dictionaryRepresentation] forKey:kTotal_BaseClassFocusImages];
    [mutableDict setValue:self.msg forKey:kTotal_BaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kTotal_BaseClassRet];

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

    self.categoryContents = [aDecoder decodeObjectForKey:kTotal_BaseClassCategoryContents];
    self.hasRecommendedZones = [aDecoder decodeBoolForKey:kTotal_BaseClassHasRecommendedZones];
    self.keywords = [aDecoder decodeObjectForKey:kTotal_BaseClassKeywords];
    self.focusImages = [aDecoder decodeObjectForKey:kTotal_BaseClassFocusImages];
    self.msg = [aDecoder decodeObjectForKey:kTotal_BaseClassMsg];
    self.ret = [aDecoder decodeDoubleForKey:kTotal_BaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_categoryContents forKey:kTotal_BaseClassCategoryContents];
    [aCoder encodeBool:_hasRecommendedZones forKey:kTotal_BaseClassHasRecommendedZones];
    [aCoder encodeObject:_keywords forKey:kTotal_BaseClassKeywords];
    [aCoder encodeObject:_focusImages forKey:kTotal_BaseClassFocusImages];
    [aCoder encodeObject:_msg forKey:kTotal_BaseClassMsg];
    [aCoder encodeDouble:_ret forKey:kTotal_BaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    Total_BaseClass *copy = [[Total_BaseClass alloc] init];
    
    if (copy) {

        copy.categoryContents = [self.categoryContents copyWithZone:zone];
        copy.hasRecommendedZones = self.hasRecommendedZones;
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.focusImages = [self.focusImages copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
