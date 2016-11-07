//
//  ReMenu_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReMenu_BaseClass.h"
#import "ReMenu_List.h"
#import "ReMenu_ClassList.h"


NSString *const kReMenu_BaseClassNum = @"num";
NSString *const kReMenu_BaseClassResVersion = @"resVersion";
NSString *const kReMenu_BaseClassDocUpdateNums = @"doc_update_nums";
NSString *const kReMenu_BaseClassList = @"list";
NSString *const kReMenu_BaseClassClassList = @"class_list";


@interface ReMenu_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReMenu_BaseClass

@synthesize num = _num;
@synthesize resVersion = _resVersion;
@synthesize docUpdateNums = _docUpdateNums;
@synthesize list = _list;
@synthesize classList = _classList;


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
            self.num = [self objectOrNilForKey:kReMenu_BaseClassNum fromDictionary:dict];
            self.resVersion = [self objectOrNilForKey:kReMenu_BaseClassResVersion fromDictionary:dict];
            self.docUpdateNums = [self objectOrNilForKey:kReMenu_BaseClassDocUpdateNums fromDictionary:dict];
    NSObject *receivedReMenu_List = [dict objectForKey:kReMenu_BaseClassList];
    NSMutableArray *parsedReMenu_List = [NSMutableArray array];
    if ([receivedReMenu_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReMenu_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReMenu_List addObject:[ReMenu_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReMenu_List isKindOfClass:[NSDictionary class]]) {
       [parsedReMenu_List addObject:[ReMenu_List modelObjectWithDictionary:(NSDictionary *)receivedReMenu_List]];
    }

    self.list = [NSArray arrayWithArray:parsedReMenu_List];
    NSObject *receivedReMenu_ClassList = [dict objectForKey:kReMenu_BaseClassClassList];
    NSMutableArray *parsedReMenu_ClassList = [NSMutableArray array];
    if ([receivedReMenu_ClassList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedReMenu_ClassList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedReMenu_ClassList addObject:[ReMenu_ClassList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedReMenu_ClassList isKindOfClass:[NSDictionary class]]) {
       [parsedReMenu_ClassList addObject:[ReMenu_ClassList modelObjectWithDictionary:(NSDictionary *)receivedReMenu_ClassList]];
    }

    self.classList = [NSArray arrayWithArray:parsedReMenu_ClassList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.num forKey:kReMenu_BaseClassNum];
    [mutableDict setValue:self.resVersion forKey:kReMenu_BaseClassResVersion];
    [mutableDict setValue:self.docUpdateNums forKey:kReMenu_BaseClassDocUpdateNums];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kReMenu_BaseClassList];
    NSMutableArray *tempArrayForClassList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.classList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForClassList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForClassList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForClassList] forKey:kReMenu_BaseClassClassList];

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

    self.num = [aDecoder decodeObjectForKey:kReMenu_BaseClassNum];
    self.resVersion = [aDecoder decodeObjectForKey:kReMenu_BaseClassResVersion];
    self.docUpdateNums = [aDecoder decodeObjectForKey:kReMenu_BaseClassDocUpdateNums];
    self.list = [aDecoder decodeObjectForKey:kReMenu_BaseClassList];
    self.classList = [aDecoder decodeObjectForKey:kReMenu_BaseClassClassList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_num forKey:kReMenu_BaseClassNum];
    [aCoder encodeObject:_resVersion forKey:kReMenu_BaseClassResVersion];
    [aCoder encodeObject:_docUpdateNums forKey:kReMenu_BaseClassDocUpdateNums];
    [aCoder encodeObject:_list forKey:kReMenu_BaseClassList];
    [aCoder encodeObject:_classList forKey:kReMenu_BaseClassClassList];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReMenu_BaseClass *copy = [[ReMenu_BaseClass alloc] init];
    
    if (copy) {

        copy.num = [self.num copyWithZone:zone];
        copy.resVersion = [self.resVersion copyWithZone:zone];
        copy.docUpdateNums = [self.docUpdateNums copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.classList = [self.classList copyWithZone:zone];
    }
    
    return copy;
}


@end
