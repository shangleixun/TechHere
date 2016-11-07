//
//  NewsSmartList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsSmartList_BaseClass.h"
#import "NewsSmartList_Pics.h"
#import "NewsSmartList_List.h"


NSString *const kNewsSmartList_BaseClassPics = @"pics";
NSString *const kNewsSmartList_BaseClassNum = @"num";
NSString *const kNewsSmartList_BaseClassResVersion = @"resVersion";
NSString *const kNewsSmartList_BaseClassDocUpdateNums = @"doc_update_nums";
NSString *const kNewsSmartList_BaseClassList = @"list";


@interface NewsSmartList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsSmartList_BaseClass

@synthesize pics = _pics;
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
    NSObject *receivedNewsSmartList_Pics = [dict objectForKey:kNewsSmartList_BaseClassPics];
    NSMutableArray *parsedNewsSmartList_Pics = [NSMutableArray array];
    if ([receivedNewsSmartList_Pics isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsSmartList_Pics) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsSmartList_Pics addObject:[NewsSmartList_Pics modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsSmartList_Pics isKindOfClass:[NSDictionary class]]) {
       [parsedNewsSmartList_Pics addObject:[NewsSmartList_Pics modelObjectWithDictionary:(NSDictionary *)receivedNewsSmartList_Pics]];
    }

    self.pics = [NSArray arrayWithArray:parsedNewsSmartList_Pics];
            self.num = [self objectOrNilForKey:kNewsSmartList_BaseClassNum fromDictionary:dict];
            self.resVersion = [self objectOrNilForKey:kNewsSmartList_BaseClassResVersion fromDictionary:dict];
            self.docUpdateNums = [self objectOrNilForKey:kNewsSmartList_BaseClassDocUpdateNums fromDictionary:dict];
    NSObject *receivedNewsSmartList_List = [dict objectForKey:kNewsSmartList_BaseClassList];
    NSMutableArray *parsedNewsSmartList_List = [NSMutableArray array];
    if ([receivedNewsSmartList_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsSmartList_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsSmartList_List addObject:[NewsSmartList_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsSmartList_List isKindOfClass:[NSDictionary class]]) {
       [parsedNewsSmartList_List addObject:[NewsSmartList_List modelObjectWithDictionary:(NSDictionary *)receivedNewsSmartList_List]];
    }

    self.list = [NSArray arrayWithArray:parsedNewsSmartList_List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPics = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pics) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPics addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPics addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kNewsSmartList_BaseClassPics];
    [mutableDict setValue:self.num forKey:kNewsSmartList_BaseClassNum];
    [mutableDict setValue:self.resVersion forKey:kNewsSmartList_BaseClassResVersion];
    [mutableDict setValue:self.docUpdateNums forKey:kNewsSmartList_BaseClassDocUpdateNums];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kNewsSmartList_BaseClassList];

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

    self.pics = [aDecoder decodeObjectForKey:kNewsSmartList_BaseClassPics];
    self.num = [aDecoder decodeObjectForKey:kNewsSmartList_BaseClassNum];
    self.resVersion = [aDecoder decodeObjectForKey:kNewsSmartList_BaseClassResVersion];
    self.docUpdateNums = [aDecoder decodeObjectForKey:kNewsSmartList_BaseClassDocUpdateNums];
    self.list = [aDecoder decodeObjectForKey:kNewsSmartList_BaseClassList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pics forKey:kNewsSmartList_BaseClassPics];
    [aCoder encodeObject:_num forKey:kNewsSmartList_BaseClassNum];
    [aCoder encodeObject:_resVersion forKey:kNewsSmartList_BaseClassResVersion];
    [aCoder encodeObject:_docUpdateNums forKey:kNewsSmartList_BaseClassDocUpdateNums];
    [aCoder encodeObject:_list forKey:kNewsSmartList_BaseClassList];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsSmartList_BaseClass *copy = [[NewsSmartList_BaseClass alloc] init];
    
    if (copy) {

        copy.pics = [self.pics copyWithZone:zone];
        copy.num = [self.num copyWithZone:zone];
        copy.resVersion = [self.resVersion copyWithZone:zone];
        copy.docUpdateNums = [self.docUpdateNums copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
