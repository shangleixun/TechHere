//
//  ZIXUNRIGHT_User.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_User.h"


NSString *const kZIXUNRIGHT_UserUid = @"uid";
NSString *const kZIXUNRIGHT_UserNickname = @"nickname";


@interface ZIXUNRIGHT_User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_User

@synthesize uid = _uid;
@synthesize nickname = _nickname;


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
            self.uid = [[self objectOrNilForKey:kZIXUNRIGHT_UserUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZIXUNRIGHT_UserNickname fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNRIGHT_UserUid];
    [mutableDict setValue:self.nickname forKey:kZIXUNRIGHT_UserNickname];

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

    self.uid = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_UserUid];
    self.nickname = [aDecoder decodeObjectForKey:kZIXUNRIGHT_UserNickname];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kZIXUNRIGHT_UserUid];
    [aCoder encodeObject:_nickname forKey:kZIXUNRIGHT_UserNickname];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_User *copy = [[ZIXUNRIGHT_User alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
    }
    
    return copy;
}


@end
