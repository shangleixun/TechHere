//
//  ZIXUNRIGHT_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_BaseClass.h"
#import "ZIXUNRIGHT_Data.h"


NSString *const kZIXUNRIGHT_BaseClassRet = @"ret";
NSString *const kZIXUNRIGHT_BaseClassData = @"data";
NSString *const kZIXUNRIGHT_BaseClassMsg = @"msg";


@interface ZIXUNRIGHT_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_BaseClass

@synthesize ret = _ret;
@synthesize data = _data;
@synthesize msg = _msg;


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
            self.ret = [[self objectOrNilForKey:kZIXUNRIGHT_BaseClassRet fromDictionary:dict] doubleValue];
            self.data = [ZIXUNRIGHT_Data modelObjectWithDictionary:[dict objectForKey:kZIXUNRIGHT_BaseClassData]];
            self.msg = [self objectOrNilForKey:kZIXUNRIGHT_BaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZIXUNRIGHT_BaseClassRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZIXUNRIGHT_BaseClassData];
    [mutableDict setValue:self.msg forKey:kZIXUNRIGHT_BaseClassMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_BaseClassRet];
    self.data = [aDecoder decodeObjectForKey:kZIXUNRIGHT_BaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kZIXUNRIGHT_BaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kZIXUNRIGHT_BaseClassRet];
    [aCoder encodeObject:_data forKey:kZIXUNRIGHT_BaseClassData];
    [aCoder encodeObject:_msg forKey:kZIXUNRIGHT_BaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_BaseClass *copy = [[ZIXUNRIGHT_BaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
