//
//  ZIXUNRIGHTMORE_Data.m
//
//  Created by 雷勋 尚 on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHTMORE_Data.h"
#import "ZIXUNRIGHTMORE_List.h"


NSString *const kZIXUNRIGHTMORE_DataMaxPageId = @"maxPageId";
NSString *const kZIXUNRIGHTMORE_DataList = @"list";
NSString *const kZIXUNRIGHTMORE_DataPageId = @"pageId";
NSString *const kZIXUNRIGHTMORE_DataPageSize = @"pageSize";
NSString *const kZIXUNRIGHTMORE_DataTotalCount = @"totalCount";


@interface ZIXUNRIGHTMORE_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHTMORE_Data

@synthesize maxPageId = _maxPageId;
@synthesize list = _list;
@synthesize pageId = _pageId;
@synthesize pageSize = _pageSize;
@synthesize totalCount = _totalCount;


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
            self.maxPageId = [[self objectOrNilForKey:kZIXUNRIGHTMORE_DataMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedZIXUNRIGHTMORE_List = [dict objectForKey:kZIXUNRIGHTMORE_DataList];
    NSMutableArray *parsedZIXUNRIGHTMORE_List = [NSMutableArray array];
    if ([receivedZIXUNRIGHTMORE_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZIXUNRIGHTMORE_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZIXUNRIGHTMORE_List addObject:[ZIXUNRIGHTMORE_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZIXUNRIGHTMORE_List isKindOfClass:[NSDictionary class]]) {
       [parsedZIXUNRIGHTMORE_List addObject:[ZIXUNRIGHTMORE_List modelObjectWithDictionary:(NSDictionary *)receivedZIXUNRIGHTMORE_List]];
    }

    self.list = [NSArray arrayWithArray:parsedZIXUNRIGHTMORE_List];
            self.pageId = [[self objectOrNilForKey:kZIXUNRIGHTMORE_DataPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kZIXUNRIGHTMORE_DataPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZIXUNRIGHTMORE_DataTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZIXUNRIGHTMORE_DataMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZIXUNRIGHTMORE_DataList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZIXUNRIGHTMORE_DataPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZIXUNRIGHTMORE_DataPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZIXUNRIGHTMORE_DataTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_DataMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_DataList];
    self.pageId = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_DataPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_DataPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_DataTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kZIXUNRIGHTMORE_DataMaxPageId];
    [aCoder encodeObject:_list forKey:kZIXUNRIGHTMORE_DataList];
    [aCoder encodeDouble:_pageId forKey:kZIXUNRIGHTMORE_DataPageId];
    [aCoder encodeDouble:_pageSize forKey:kZIXUNRIGHTMORE_DataPageSize];
    [aCoder encodeDouble:_totalCount forKey:kZIXUNRIGHTMORE_DataTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHTMORE_Data *copy = [[ZIXUNRIGHTMORE_Data alloc] init];
    
    if (copy) {

        copy.maxPageId = self.maxPageId;
        copy.list = [self.list copyWithZone:zone];
        copy.pageId = self.pageId;
        copy.pageSize = self.pageSize;
        copy.totalCount = self.totalCount;
    }
    
    return copy;
}


@end
