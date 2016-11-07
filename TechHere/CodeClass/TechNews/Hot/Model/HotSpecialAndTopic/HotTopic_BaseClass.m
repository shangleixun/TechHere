//
//  HotTopic_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotTopic_BaseClass.h"
#import "HotTopic_Data.h"


NSString *const kHotTopic_BaseClassStatus = @"status";
NSString *const kHotTopic_BaseClassMsg = @"msg";
NSString *const kHotTopic_BaseClassData = @"data";


@interface HotTopic_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotTopic_BaseClass

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
            self.status = [self objectOrNilForKey:kHotTopic_BaseClassStatus fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kHotTopic_BaseClassMsg fromDictionary:dict];
    NSObject *receivedHotTopic_Data = [dict objectForKey:kHotTopic_BaseClassData];
    NSMutableArray *parsedHotTopic_Data = [NSMutableArray array];
    if ([receivedHotTopic_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotTopic_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotTopic_Data addObject:[HotTopic_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotTopic_Data isKindOfClass:[NSDictionary class]]) {
       [parsedHotTopic_Data addObject:[HotTopic_Data modelObjectWithDictionary:(NSDictionary *)receivedHotTopic_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedHotTopic_Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotTopic_BaseClassStatus];
    [mutableDict setValue:self.msg forKey:kHotTopic_BaseClassMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHotTopic_BaseClassData];

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

    self.status = [aDecoder decodeObjectForKey:kHotTopic_BaseClassStatus];
    self.msg = [aDecoder decodeObjectForKey:kHotTopic_BaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kHotTopic_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotTopic_BaseClassStatus];
    [aCoder encodeObject:_msg forKey:kHotTopic_BaseClassMsg];
    [aCoder encodeObject:_data forKey:kHotTopic_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotTopic_BaseClass *copy = [[HotTopic_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
