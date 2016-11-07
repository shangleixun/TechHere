//
//  Total_Keywords.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Total_Keywords.h"
#import "Total_List.h"


NSString *const kTotal_KeywordsTitle = @"title";
NSString *const kTotal_KeywordsList = @"list";


@interface Total_Keywords ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Total_Keywords

@synthesize title = _title;
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
            self.title = [self objectOrNilForKey:kTotal_KeywordsTitle fromDictionary:dict];
    NSObject *receivedTotal_List = [dict objectForKey:kTotal_KeywordsList];
    NSMutableArray *parsedTotal_List = [NSMutableArray array];
    if ([receivedTotal_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTotal_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTotal_List addObject:[Total_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTotal_List isKindOfClass:[NSDictionary class]]) {
       [parsedTotal_List addObject:[Total_List modelObjectWithDictionary:(NSDictionary *)receivedTotal_List]];
    }

    self.list = [NSArray arrayWithArray:parsedTotal_List];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kTotal_KeywordsTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kTotal_KeywordsList];

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

    self.title = [aDecoder decodeObjectForKey:kTotal_KeywordsTitle];
    self.list = [aDecoder decodeObjectForKey:kTotal_KeywordsList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kTotal_KeywordsTitle];
    [aCoder encodeObject:_list forKey:kTotal_KeywordsList];
}

- (id)copyWithZone:(NSZone *)zone
{
    Total_Keywords *copy = [[Total_Keywords alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
