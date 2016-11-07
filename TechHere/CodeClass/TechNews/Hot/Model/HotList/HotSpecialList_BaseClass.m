//
//  HotSpecialList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotSpecialList_BaseClass.h"
#import "HotSpecialList_Data.h"


NSString *const kHotSpecialList_BaseClassStatus = @"status";
NSString *const kHotSpecialList_BaseClassMsg = @"msg";
NSString *const kHotSpecialList_BaseClassData = @"data";


@interface HotSpecialList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotSpecialList_BaseClass

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
            self.status = [self objectOrNilForKey:kHotSpecialList_BaseClassStatus fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kHotSpecialList_BaseClassMsg fromDictionary:dict];
    NSObject *receivedHotSpecialList_Data = [dict objectForKey:kHotSpecialList_BaseClassData];
    NSMutableArray *parsedHotSpecialList_Data = [NSMutableArray array];
    if ([receivedHotSpecialList_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotSpecialList_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotSpecialList_Data addObject:[HotSpecialList_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotSpecialList_Data isKindOfClass:[NSDictionary class]]) {
       [parsedHotSpecialList_Data addObject:[HotSpecialList_Data modelObjectWithDictionary:(NSDictionary *)receivedHotSpecialList_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedHotSpecialList_Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotSpecialList_BaseClassStatus];
    [mutableDict setValue:self.msg forKey:kHotSpecialList_BaseClassMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHotSpecialList_BaseClassData];

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

    self.status = [aDecoder decodeObjectForKey:kHotSpecialList_BaseClassStatus];
    self.msg = [aDecoder decodeObjectForKey:kHotSpecialList_BaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kHotSpecialList_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotSpecialList_BaseClassStatus];
    [aCoder encodeObject:_msg forKey:kHotSpecialList_BaseClassMsg];
    [aCoder encodeObject:_data forKey:kHotSpecialList_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotSpecialList_BaseClass *copy = [[HotSpecialList_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
