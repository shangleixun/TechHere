//
//  NewsHotList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsHotList_BaseClass.h"
#import "NewsHotList_List.h"


NSString *const kNewsHotList_BaseClassNum = @"num";
NSString *const kNewsHotList_BaseClassResVersion = @"resVersion";
NSString *const kNewsHotList_BaseClassDocUpdateNums = @"doc_update_nums";
NSString *const kNewsHotList_BaseClassList = @"list";
NSString *const kNewsHotList_BaseClassTotalPage = @"totalPage";
NSString *const kNewsHotList_BaseClassDate = @"date";


@interface NewsHotList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsHotList_BaseClass

@synthesize num = _num;
@synthesize resVersion = _resVersion;
@synthesize docUpdateNums = _docUpdateNums;
@synthesize list = _list;
@synthesize totalPage = _totalPage;
@synthesize date = _date;


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
            self.num = [[self objectOrNilForKey:kNewsHotList_BaseClassNum fromDictionary:dict] doubleValue];
            self.resVersion = [self objectOrNilForKey:kNewsHotList_BaseClassResVersion fromDictionary:dict];
            self.docUpdateNums = [self objectOrNilForKey:kNewsHotList_BaseClassDocUpdateNums fromDictionary:dict];
    NSObject *receivedNewsHotList_List = [dict objectForKey:kNewsHotList_BaseClassList];
    NSMutableArray *parsedNewsHotList_List = [NSMutableArray array];
    if ([receivedNewsHotList_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsHotList_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsHotList_List addObject:[NewsHotList_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsHotList_List isKindOfClass:[NSDictionary class]]) {
       [parsedNewsHotList_List addObject:[NewsHotList_List modelObjectWithDictionary:(NSDictionary *)receivedNewsHotList_List]];
    }

    self.list = [NSArray arrayWithArray:parsedNewsHotList_List];
            self.totalPage = [[self objectOrNilForKey:kNewsHotList_BaseClassTotalPage fromDictionary:dict] doubleValue];
            self.date = [self objectOrNilForKey:kNewsHotList_BaseClassDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kNewsHotList_BaseClassNum];
    [mutableDict setValue:self.resVersion forKey:kNewsHotList_BaseClassResVersion];
    [mutableDict setValue:self.docUpdateNums forKey:kNewsHotList_BaseClassDocUpdateNums];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kNewsHotList_BaseClassList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kNewsHotList_BaseClassTotalPage];
    [mutableDict setValue:self.date forKey:kNewsHotList_BaseClassDate];

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

    self.num = [aDecoder decodeDoubleForKey:kNewsHotList_BaseClassNum];
    self.resVersion = [aDecoder decodeObjectForKey:kNewsHotList_BaseClassResVersion];
    self.docUpdateNums = [aDecoder decodeObjectForKey:kNewsHotList_BaseClassDocUpdateNums];
    self.list = [aDecoder decodeObjectForKey:kNewsHotList_BaseClassList];
    self.totalPage = [aDecoder decodeDoubleForKey:kNewsHotList_BaseClassTotalPage];
    self.date = [aDecoder decodeObjectForKey:kNewsHotList_BaseClassDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kNewsHotList_BaseClassNum];
    [aCoder encodeObject:_resVersion forKey:kNewsHotList_BaseClassResVersion];
    [aCoder encodeObject:_docUpdateNums forKey:kNewsHotList_BaseClassDocUpdateNums];
    [aCoder encodeObject:_list forKey:kNewsHotList_BaseClassList];
    [aCoder encodeDouble:_totalPage forKey:kNewsHotList_BaseClassTotalPage];
    [aCoder encodeObject:_date forKey:kNewsHotList_BaseClassDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsHotList_BaseClass *copy = [[NewsHotList_BaseClass alloc] init];
    
    if (copy) {

        copy.num = self.num;
        copy.resVersion = [self.resVersion copyWithZone:zone];
        copy.docUpdateNums = [self.docUpdateNums copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.totalPage = self.totalPage;
        copy.date = [self.date copyWithZone:zone];
    }
    
    return copy;
}


@end
