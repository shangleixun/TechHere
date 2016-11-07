//
//  ZIXUNLEFT_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_Data.h"
#import "ZIXUNLEFT_Detail.h"
#import "ZIXUNLEFT_Recs.h"
#import "ZIXUNLEFT_User.h"


NSString *const kZIXUNLEFT_DataShowFeedButton = @"showFeedButton";
NSString *const kZIXUNLEFT_DataDetail = @"detail";
NSString *const kZIXUNLEFT_DataRecs = @"recs";
NSString *const kZIXUNLEFT_DataUser = @"user";


@interface ZIXUNLEFT_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_Data

@synthesize showFeedButton = _showFeedButton;
@synthesize detail = _detail;
@synthesize recs = _recs;
@synthesize user = _user;


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
            self.showFeedButton = [[self objectOrNilForKey:kZIXUNLEFT_DataShowFeedButton fromDictionary:dict] boolValue];
            self.detail = [ZIXUNLEFT_Detail modelObjectWithDictionary:[dict objectForKey:kZIXUNLEFT_DataDetail]];
            self.recs = [ZIXUNLEFT_Recs modelObjectWithDictionary:[dict objectForKey:kZIXUNLEFT_DataRecs]];
            self.user = [ZIXUNLEFT_User modelObjectWithDictionary:[dict objectForKey:kZIXUNLEFT_DataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.showFeedButton] forKey:kZIXUNLEFT_DataShowFeedButton];
    [mutableDict setValue:[self.detail dictionaryRepresentation] forKey:kZIXUNLEFT_DataDetail];
    [mutableDict setValue:[self.recs dictionaryRepresentation] forKey:kZIXUNLEFT_DataRecs];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kZIXUNLEFT_DataUser];

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

    self.showFeedButton = [aDecoder decodeBoolForKey:kZIXUNLEFT_DataShowFeedButton];
    self.detail = [aDecoder decodeObjectForKey:kZIXUNLEFT_DataDetail];
    self.recs = [aDecoder decodeObjectForKey:kZIXUNLEFT_DataRecs];
    self.user = [aDecoder decodeObjectForKey:kZIXUNLEFT_DataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_showFeedButton forKey:kZIXUNLEFT_DataShowFeedButton];
    [aCoder encodeObject:_detail forKey:kZIXUNLEFT_DataDetail];
    [aCoder encodeObject:_recs forKey:kZIXUNLEFT_DataRecs];
    [aCoder encodeObject:_user forKey:kZIXUNLEFT_DataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_Data *copy = [[ZIXUNLEFT_Data alloc] init];
    
    if (copy) {

        copy.showFeedButton = self.showFeedButton;
        copy.detail = [self.detail copyWithZone:zone];
        copy.recs = [self.recs copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
