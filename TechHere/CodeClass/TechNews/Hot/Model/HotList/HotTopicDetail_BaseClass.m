//
//  HotTopicDetail_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotTopicDetail_BaseClass.h"
#import "HotTopicDetail_Data.h"


NSString *const kHotTopicDetail_BaseClassStatus = @"status";
NSString *const kHotTopicDetail_BaseClassMsg = @"msg";
NSString *const kHotTopicDetail_BaseClassData = @"data";


@interface HotTopicDetail_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotTopicDetail_BaseClass

@synthesize status = _status;
@synthesize msg = _msg;
@synthesize data = _data;


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
            self.status = [self objectOrNilForKey:kHotTopicDetail_BaseClassStatus fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kHotTopicDetail_BaseClassMsg fromDictionary:dict];
    NSObject *receivedHotTopicDetail_Data = [dict objectForKey:kHotTopicDetail_BaseClassData];
    NSMutableArray *parsedHotTopicDetail_Data = [NSMutableArray array];
    if ([receivedHotTopicDetail_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotTopicDetail_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotTopicDetail_Data addObject:[HotTopicDetail_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotTopicDetail_Data isKindOfClass:[NSDictionary class]]) {
       [parsedHotTopicDetail_Data addObject:[HotTopicDetail_Data modelObjectWithDictionary:(NSDictionary *)receivedHotTopicDetail_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedHotTopicDetail_Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotTopicDetail_BaseClassStatus];
    [mutableDict setValue:self.msg forKey:kHotTopicDetail_BaseClassMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHotTopicDetail_BaseClassData];

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

    self.status = [aDecoder decodeObjectForKey:kHotTopicDetail_BaseClassStatus];
    self.msg = [aDecoder decodeObjectForKey:kHotTopicDetail_BaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kHotTopicDetail_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotTopicDetail_BaseClassStatus];
    [aCoder encodeObject:_msg forKey:kHotTopicDetail_BaseClassMsg];
    [aCoder encodeObject:_data forKey:kHotTopicDetail_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotTopicDetail_BaseClass *copy = [[HotTopicDetail_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
