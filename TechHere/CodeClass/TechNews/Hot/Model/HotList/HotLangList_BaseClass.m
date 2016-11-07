//
//  HotLangList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotLangList_BaseClass.h"
#import "HotLangList_Data.h"


NSString *const kHotLangList_BaseClassStatus = @"status";
NSString *const kHotLangList_BaseClassData = @"data";
NSString *const kHotLangList_BaseClassMsg = @"msg";
NSString *const kHotLangList_BaseClassCount = @"count";


@interface HotLangList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLangList_BaseClass

@synthesize status = _status;
@synthesize data = _data;
@synthesize msg = _msg;
@synthesize count = _count;


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
            self.status = [self objectOrNilForKey:kHotLangList_BaseClassStatus fromDictionary:dict];
    NSObject *receivedHotLangList_Data = [dict objectForKey:kHotLangList_BaseClassData];
    NSMutableArray *parsedHotLangList_Data = [NSMutableArray array];
    if ([receivedHotLangList_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotLangList_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotLangList_Data addObject:[HotLangList_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotLangList_Data isKindOfClass:[NSDictionary class]]) {
       [parsedHotLangList_Data addObject:[HotLangList_Data modelObjectWithDictionary:(NSDictionary *)receivedHotLangList_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedHotLangList_Data];
            self.msg = [self objectOrNilForKey:kHotLangList_BaseClassMsg fromDictionary:dict];
            self.count = [self objectOrNilForKey:kHotLangList_BaseClassCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotLangList_BaseClassStatus];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHotLangList_BaseClassData];
    [mutableDict setValue:self.msg forKey:kHotLangList_BaseClassMsg];
    [mutableDict setValue:self.count forKey:kHotLangList_BaseClassCount];

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

    self.status = [aDecoder decodeObjectForKey:kHotLangList_BaseClassStatus];
    self.data = [aDecoder decodeObjectForKey:kHotLangList_BaseClassData];
    self.msg = [aDecoder decodeObjectForKey:kHotLangList_BaseClassMsg];
    self.count = [aDecoder decodeObjectForKey:kHotLangList_BaseClassCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotLangList_BaseClassStatus];
    [aCoder encodeObject:_data forKey:kHotLangList_BaseClassData];
    [aCoder encodeObject:_msg forKey:kHotLangList_BaseClassMsg];
    [aCoder encodeObject:_count forKey:kHotLangList_BaseClassCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLangList_BaseClass *copy = [[HotLangList_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.count = [self.count copyWithZone:zone];
    }
    
    return copy;
}


@end
