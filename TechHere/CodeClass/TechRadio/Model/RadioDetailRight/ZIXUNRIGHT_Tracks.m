//
//  ZIXUNRIGHT_Tracks.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_Tracks.h"
#import "ZIXUNRIGHT_List.h"


NSString *const kZIXUNRIGHT_TracksMaxPageId = @"maxPageId";
NSString *const kZIXUNRIGHT_TracksList = @"list";
NSString *const kZIXUNRIGHT_TracksPageId = @"pageId";
NSString *const kZIXUNRIGHT_TracksPageSize = @"pageSize";
NSString *const kZIXUNRIGHT_TracksTotalCount = @"totalCount";


@interface ZIXUNRIGHT_Tracks ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_Tracks

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
            self.maxPageId = [[self objectOrNilForKey:kZIXUNRIGHT_TracksMaxPageId fromDictionary:dict] doubleValue];
    NSObject *receivedZIXUNRIGHT_List = [dict objectForKey:kZIXUNRIGHT_TracksList];
    NSMutableArray *parsedZIXUNRIGHT_List = [NSMutableArray array];
    if ([receivedZIXUNRIGHT_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZIXUNRIGHT_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZIXUNRIGHT_List addObject:[ZIXUNRIGHT_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZIXUNRIGHT_List isKindOfClass:[NSDictionary class]]) {
       [parsedZIXUNRIGHT_List addObject:[ZIXUNRIGHT_List modelObjectWithDictionary:(NSDictionary *)receivedZIXUNRIGHT_List]];
    }

    self.list = [NSArray arrayWithArray:parsedZIXUNRIGHT_List];
            self.pageId = [[self objectOrNilForKey:kZIXUNRIGHT_TracksPageId fromDictionary:dict] doubleValue];
            self.pageSize = [[self objectOrNilForKey:kZIXUNRIGHT_TracksPageSize fromDictionary:dict] doubleValue];
            self.totalCount = [[self objectOrNilForKey:kZIXUNRIGHT_TracksTotalCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPageId] forKey:kZIXUNRIGHT_TracksMaxPageId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kZIXUNRIGHT_TracksList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kZIXUNRIGHT_TracksPageId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageSize] forKey:kZIXUNRIGHT_TracksPageSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalCount] forKey:kZIXUNRIGHT_TracksTotalCount];

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

    self.maxPageId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_TracksMaxPageId];
    self.list = [aDecoder decodeObjectForKey:kZIXUNRIGHT_TracksList];
    self.pageId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_TracksPageId];
    self.pageSize = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_TracksPageSize];
    self.totalCount = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_TracksTotalCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxPageId forKey:kZIXUNRIGHT_TracksMaxPageId];
    [aCoder encodeObject:_list forKey:kZIXUNRIGHT_TracksList];
    [aCoder encodeDouble:_pageId forKey:kZIXUNRIGHT_TracksPageId];
    [aCoder encodeDouble:_pageSize forKey:kZIXUNRIGHT_TracksPageSize];
    [aCoder encodeDouble:_totalCount forKey:kZIXUNRIGHT_TracksTotalCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_Tracks *copy = [[ZIXUNRIGHT_Tracks alloc] init];
    
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
