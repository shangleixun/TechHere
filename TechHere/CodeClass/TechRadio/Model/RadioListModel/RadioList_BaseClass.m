//
//  RadioList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioList_BaseClass.h"
#import "RadioList_List.h"


NSString *const kRadioList_BaseClassPageSize = @"pageSize";
NSString *const kRadioList_BaseClassPageId = @"pageId";
NSString *const kRadioList_BaseClassTotalCount = @"totalCount";
NSString *const kRadioList_BaseClassTitle = @"title";
NSString *const kRadioList_BaseClassMsg = @"msg";
NSString *const kRadioList_BaseClassMaxPageId = @"maxPageId";
NSString *const kRadioList_BaseClassList = @"list";
NSString *const kRadioList_BaseClassRet = @"ret";


@interface RadioList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioList_BaseClass

@synthesize pageSize = _pageSize;
@synthesize pageId = _pageId;
@synthesize totalCount = _totalCount;
@synthesize title = _title;
@synthesize msg = _msg;
@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize ret = _ret;


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
            self.pageSize = [[self objectOrNilForKey:kRadioList_BaseClassPageSize fromDictionary:dict] doubleValue];
            self.pageId = [[self objectOrNilForKey:kRadioList_BaseClassPageId fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kRadioList_BaseClassTotalCount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kRadioList_BaseClassTitle fromDictionary:dict];
            self.msg = [self objectOrNilForKey:kRadioList_BaseClassMsg fromDictionary:dict];
            self.maxPageId = [[self objectOrNilForKey:kRadioList_BaseClassMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedRadioList_List = [dict objectForKey:kRadioList_BaseClassList];
    NSMutableArray *parsedRadioList_List = [NSMutableArray array];
    if ([receivedRadioList_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRadioList_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRadioList_List addObject:[RadioList_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRadioList_List isKindOfClass:[NSDictionary class]]) {
       [parsedRadioList_List addObject:[RadioList_List modelObjectWithDictionary:(NSDictionary *)receivedRadioList_List]];
    }

    self.list = [NSArray arrayWithArray:parsedRadioList_List];
            self.ret = [[self objectOrNilForKey:kRadioList_BaseClassRet fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kRadioList_BaseClassPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kRadioList_BaseClassPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kRadioList_BaseClassTotalCount];
    [mutableDict setValue:self.title forKey:kRadioList_BaseClassTitle];
    [mutableDict setValue:self.msg forKey:kRadioList_BaseClassMsg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kRadioList_BaseClassMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kRadioList_BaseClassList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ret] forKey:kRadioList_BaseClassRet];

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

    self.pageSize = [aDecoder decodeDoubleForKey:kRadioList_BaseClassPageSize];
    self.pageId = [aDecoder decodeDoubleForKey:kRadioList_BaseClassPageId];
    self.totalCount = [aDecoder decodeDoubleForKey:kRadioList_BaseClassTotalCount];
    self.title = [aDecoder decodeObjectForKey:kRadioList_BaseClassTitle];
    self.msg = [aDecoder decodeObjectForKey:kRadioList_BaseClassMsg];
    self.maxPageId = [aDecoder decodeDoubleForKey:kRadioList_BaseClassMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kRadioList_BaseClassList];
    self.ret = [aDecoder decodeDoubleForKey:kRadioList_BaseClassRet];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_pageSize forKey:kRadioList_BaseClassPageSize];
    [aCoder encodeDouble:_pageId forKey:kRadioList_BaseClassPageId];
    [aCoder encodeDouble:_totalCount forKey:kRadioList_BaseClassTotalCount];
    [aCoder encodeObject:_title forKey:kRadioList_BaseClassTitle];
    [aCoder encodeObject:_msg forKey:kRadioList_BaseClassMsg];
    [aCoder encodeDouble:_maxPageId forKey:kRadioList_BaseClassMaxPageId];
    [aCoder encodeObject:_list forKey:kRadioList_BaseClassList];
    [aCoder encodeDouble:_ret forKey:kRadioList_BaseClassRet];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioList_BaseClass *copy = [[RadioList_BaseClass alloc] init];
    
    if (copy) {

        copy.pageSize = self.pageSize;
        copy.pageId = self.pageId;
        copy.totalCount = self.totalCount;
        copy.title = [self.title copyWithZone:zone];
        copy.msg = [self.msg copyWithZone:zone];
        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.ret = self.ret;
    }
    
    return copy;
}


@end
