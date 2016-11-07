//
//  ReList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReList_BaseClass.h"
#import "ReList_List.h"


NSString *const kReList_BaseClassNum = @"num";
NSString *const kReList_BaseClassResVersion = @"resVersion";
NSString *const kReList_BaseClassDocUpdateNums = @"doc_update_nums";
NSString *const kReList_BaseClassList = @"list";


@interface ReList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReList_BaseClass

@synthesize num = _num;
@synthesize resVersion = _resVersion;
@synthesize docUpdateNums = _docUpdateNums;
@synthesize list = _list;


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
            self.num = [self objectOrNilForKey:kReList_BaseClassNum fromDictionary:dict];
            self.resVersion = [self objectOrNilForKey:kReList_BaseClassResVersion fromDictionary:dict];
            self.docUpdateNums = [self objectOrNilForKey:kReList_BaseClassDocUpdateNums fromDictionary:dict];
    NSObject *receivedReList_List = [dict objectForKey:kReList_BaseClassList];
    NSMutableArray *parsedReList_List = [NSMutableArray array];
    if ([receivedReList_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReList_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReList_List addObject:[ReList_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReList_List isKindOfClass:[NSDictionary class]]) {
       [parsedReList_List addObject:[ReList_List modelObjectWithDictionary:(NSDictionary *)receivedReList_List]];
    }

    self.list = [NSArray arrayWithArray:parsedReList_List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.num forKey:kReList_BaseClassNum];
    [mutableDict setValue:self.resVersion forKey:kReList_BaseClassResVersion];
    [mutableDict setValue:self.docUpdateNums forKey:kReList_BaseClassDocUpdateNums];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kReList_BaseClassList];

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

    self.num = [aDecoder decodeObjectForKey:kReList_BaseClassNum];
    self.resVersion = [aDecoder decodeObjectForKey:kReList_BaseClassResVersion];
    self.docUpdateNums = [aDecoder decodeObjectForKey:kReList_BaseClassDocUpdateNums];
    self.list = [aDecoder decodeObjectForKey:kReList_BaseClassList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_num forKey:kReList_BaseClassNum];
    [aCoder encodeObject:_resVersion forKey:kReList_BaseClassResVersion];
    [aCoder encodeObject:_docUpdateNums forKey:kReList_BaseClassDocUpdateNums];
    [aCoder encodeObject:_list forKey:kReList_BaseClassList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReList_BaseClass *copy = [[ReList_BaseClass alloc] init];
    
    if (copy) {

        copy.num = [self.num copyWithZone:zone];
        copy.resVersion = [self.resVersion copyWithZone:zone];
        copy.docUpdateNums = [self.docUpdateNums copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
