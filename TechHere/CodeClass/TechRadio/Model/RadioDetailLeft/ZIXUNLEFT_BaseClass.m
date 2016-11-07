//
//  ZIXUNLEFT_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_BaseClass.h"
#import "ZIXUNLEFT_Data.h"


NSString *const kZIXUNLEFT_BaseClassRet = @"ret";
NSString *const kZIXUNLEFT_BaseClassData = @"data";
NSString *const kZIXUNLEFT_BaseClassMsg = @"msg";


@interface ZIXUNLEFT_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_BaseClass

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
            self.ret = [[self objectOrNilForKey:kZIXUNLEFT_BaseClassRet fromDictionary:dict] doubleValue];
            self.data = [ZIXUNLEFT_Data modelObjectWithDictionary:[dict objectForKey:kZIXUNLEFT_BaseClassData]];
            self.msg = [self objectOrNilForKey:kZIXUNLEFT_BaseClassMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kZIXUNLEFT_BaseClassRet];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZIXUNLEFT_BaseClassData];
    [mutableDict setValue:self.msg forKey:kZIXUNLEFT_BaseClassMsg];

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

    self.ret = [aDecoder decodeDoubleForKey:kZIXUNLEFT_BaseClassRet];
    self.data = [aDecoder decodeObjectForKey:kZIXUNLEFT_BaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kZIXUNLEFT_BaseClassMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ret forKey:kZIXUNLEFT_BaseClassRet];
    [aCoder encodeObject:_data forKey:kZIXUNLEFT_BaseClassData];
    [aCoder encodeObject:_msg forKey:kZIXUNLEFT_BaseClassMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_BaseClass *copy = [[ZIXUNLEFT_BaseClass alloc] init];
    
    if (copy) {

        copy.ret = self.ret;
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
    }
    
    return copy;
}


@end
