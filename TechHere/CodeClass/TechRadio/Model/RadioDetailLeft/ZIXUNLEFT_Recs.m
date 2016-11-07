//
//  ZIXUNLEFT_Recs.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_Recs.h"
#import "ZIXUNLEFT_List.h"


NSString *const kZIXUNLEFT_RecsMaxPageId = @"maxPageId";
NSString *const kZIXUNLEFT_RecsList = @"list";
NSString *const kZIXUNLEFT_RecsPageId = @"pageId";
NSString *const kZIXUNLEFT_RecsPageSize = @"pageSize";
NSString *const kZIXUNLEFT_RecsTotalCount = @"totalCount";


@interface ZIXUNLEFT_Recs ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_Recs

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
            self.maxPageId = [[self objectOrNilForKey:kZIXUNLEFT_RecsMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedZIXUNLEFT_List = [dict objectForKey:kZIXUNLEFT_RecsList];
    NSMutableArray *parsedZIXUNLEFT_List = [NSMutableArray array];
    if ([receivedZIXUNLEFT_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZIXUNLEFT_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZIXUNLEFT_List addObject:[ZIXUNLEFT_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZIXUNLEFT_List isKindOfClass:[NSDictionary class]]) {
       [parsedZIXUNLEFT_List addObject:[ZIXUNLEFT_List modelObjectWithDictionary:(NSDictionary *)receivedZIXUNLEFT_List]];
    }

    self.list = [NSArray arrayWithArray:parsedZIXUNLEFT_List];
            self.pageId = [[self objectOrNilForKey:kZIXUNLEFT_RecsPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kZIXUNLEFT_RecsPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZIXUNLEFT_RecsTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZIXUNLEFT_RecsMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZIXUNLEFT_RecsList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZIXUNLEFT_RecsPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZIXUNLEFT_RecsPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZIXUNLEFT_RecsTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kZIXUNLEFT_RecsMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kZIXUNLEFT_RecsList];
    self.pageId = [aDecoder decodeDoubleForKey:kZIXUNLEFT_RecsPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kZIXUNLEFT_RecsPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kZIXUNLEFT_RecsTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kZIXUNLEFT_RecsMaxPageId];
    [aCoder encodeObject:_list forKey:kZIXUNLEFT_RecsList];
    [aCoder encodeDouble:_pageId forKey:kZIXUNLEFT_RecsPageId];
    [aCoder encodeDouble:_pageSize forKey:kZIXUNLEFT_RecsPageSize];
    [aCoder encodeDouble:_totalCount forKey:kZIXUNLEFT_RecsTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_Recs *copy = [[ZIXUNLEFT_Recs alloc] init];
    
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
