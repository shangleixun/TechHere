//
//  HotSpecial_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotSpecial_BaseClass.h"
#import "HotSpecial_Data.h"


NSString *const kHotSpecial_BaseClassStatus = @"status";
NSString *const kHotSpecial_BaseClassMsg = @"msg";
NSString *const kHotSpecial_BaseClassData = @"data";


@interface HotSpecial_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotSpecial_BaseClass

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
            self.status = [self objectOrNilForKey:kHotSpecial_BaseClassStatus fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kHotSpecial_BaseClassMsg fromDictionary:dict];
    NSObject *receivedHotSpecial_Data = [dict objectForKey:kHotSpecial_BaseClassData];
    NSMutableArray *parsedHotSpecial_Data = [NSMutableArray array];
    if ([receivedHotSpecial_Data isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotSpecial_Data) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotSpecial_Data addObject:[HotSpecial_Data modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotSpecial_Data isKindOfClass:[NSDictionary class]]) {
       [parsedHotSpecial_Data addObject:[HotSpecial_Data modelObjectWithDictionary:(NSDictionary *)receivedHotSpecial_Data]];
    }

    self.data = [NSArray arrayWithArray:parsedHotSpecial_Data];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHotSpecial_BaseClassStatus];
    [mutableDict setValue:self.msg forKey:kHotSpecial_BaseClassMsg];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kHotSpecial_BaseClassData];

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

    self.status = [aDecoder decodeObjectForKey:kHotSpecial_BaseClassStatus];
    self.msg = [aDecoder decodeObjectForKey:kHotSpecial_BaseClassMsg];
    self.data = [aDecoder decodeObjectForKey:kHotSpecial_BaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHotSpecial_BaseClassStatus];
    [aCoder encodeObject:_msg forKey:kHotSpecial_BaseClassMsg];
    [aCoder encodeObject:_data forKey:kHotSpecial_BaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotSpecial_BaseClass *copy = [[HotSpecial_BaseClass alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
