//
//  ZIXUNRIGHTMORE_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHTMORE_BaseClass.h"
#import "ZIXUNRIGHTMORE_Data.h"


NSString *const kZIXUNRIGHTMORE_BaseClassRet = @"ret";
NSString *const kZIXUNRIGHTMORE_BaseClassData = @"data";
NSString *const kZIXUNRIGHTMORE_BaseClassMsg = @"msg";


@interface ZIXUNRIGHTMORE_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHTMORE_BaseClass

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
            self.ret = [[self objectOrNilForKey:kZIXUNRIGHTMORE_BaseClassRet fromDictionary:dict] doubleValue];
            self.data = [ZIXUNRIGHTMORE_Data modelObjectWithDictionary:[dict objectForKey:kZIXUNRIGHTMORE_BaseClassData]];
            self.msg = [self objectOrNilForKey:kZIXUNRIGHTMORE_BaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZIXUNRIGHTMORE_BaseClassRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZIXUNRIGHTMORE_BaseClassData];
    [mutableDict setValue:self.msg forKey:kZIXUNRIGHTMORE_BaseClassMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_BaseClassRet];
    self.data = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_BaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_BaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kZIXUNRIGHTMORE_BaseClassRet];
    [aCoder encodeObject:_data forKey:kZIXUNRIGHTMORE_BaseClassData];
    [aCoder encodeObject:_msg forKey:kZIXUNRIGHTMORE_BaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHTMORE_BaseClass *copy = [[ZIXUNRIGHTMORE_BaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
