//
//  NewsBookList_BaseClass.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsBookList_BaseClass.h"
#import "NewsBookList_List.h"


NSString *const kNewsBookList_BaseClassSubNum = @"subNum";
NSString *const kNewsBookList_BaseClassIsSub = @"isSub";
NSString *const kNewsBookList_BaseClassMediaLogo = @"mediaLogo";
NSString *const kNewsBookList_BaseClassMediaName = @"mediaName";
NSString *const kNewsBookList_BaseClassMediaId = @"mediaId";
NSString *const kNewsBookList_BaseClassType = @"type";
NSString *const kNewsBookList_BaseClassList = @"list";
NSString *const kNewsBookList_BaseClassTotalNum = @"totalNum";


@interface NewsBookList_BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsBookList_BaseClass

@synthesize subNum = _subNum;
@synthesize isSub = _isSub;
@synthesize mediaLogo = _mediaLogo;
@synthesize mediaName = _mediaName;
@synthesize mediaId = _mediaId;
@synthesize type = _type;
@synthesize list = _list;
@synthesize totalNum = _totalNum;


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
            self.subNum = [self objectOrNilForKey:kNewsBookList_BaseClassSubNum fromDictionary:dict];
            self.isSub = [self objectOrNilForKey:kNewsBookList_BaseClassIsSub fromDictionary:dict];
            self.mediaLogo = [self objectOrNilForKey:kNewsBookList_BaseClassMediaLogo fromDictionary:dict];
            self.mediaName = [self objectOrNilForKey:kNewsBookList_BaseClassMediaName fromDictionary:dict];
            self.mediaId = [[self objectOrNilForKey:kNewsBookList_BaseClassMediaId fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kNewsBookList_BaseClassType fromDictionary:dict];
    NSObject *receivedNewsBookList_List = [dict objectForKey:kNewsBookList_BaseClassList];
    NSMutableArray *parsedNewsBookList_List = [NSMutableArray array];
    if ([receivedNewsBookList_List isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewsBookList_List) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewsBookList_List addObject:[NewsBookList_List modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewsBookList_List isKindOfClass:[NSDictionary class]]) {
       [parsedNewsBookList_List addObject:[NewsBookList_List modelObjectWithDictionary:(NSDictionary *)receivedNewsBookList_List]];
    }

    self.list = [NSArray arrayWithArray:parsedNewsBookList_List];
            self.totalNum = [self objectOrNilForKey:kNewsBookList_BaseClassTotalNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subNum forKey:kNewsBookList_BaseClassSubNum];
    [mutableDict setValue:self.isSub forKey:kNewsBookList_BaseClassIsSub];
    [mutableDict setValue:self.mediaLogo forKey:kNewsBookList_BaseClassMediaLogo];
    [mutableDict setValue:self.mediaName forKey:kNewsBookList_BaseClassMediaName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mediaId] forKey:kNewsBookList_BaseClassMediaId];
    [mutableDict setValue:self.type forKey:kNewsBookList_BaseClassType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kNewsBookList_BaseClassList];
    [mutableDict setValue:self.totalNum forKey:kNewsBookList_BaseClassTotalNum];

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

    self.subNum = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassSubNum];
    self.isSub = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassIsSub];
    self.mediaLogo = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassMediaLogo];
    self.mediaName = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassMediaName];
    self.mediaId = [aDecoder decodeDoubleForKey:kNewsBookList_BaseClassMediaId];
    self.type = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassType];
    self.list = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassList];
    self.totalNum = [aDecoder decodeObjectForKey:kNewsBookList_BaseClassTotalNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subNum forKey:kNewsBookList_BaseClassSubNum];
    [aCoder encodeObject:_isSub forKey:kNewsBookList_BaseClassIsSub];
    [aCoder encodeObject:_mediaLogo forKey:kNewsBookList_BaseClassMediaLogo];
    [aCoder encodeObject:_mediaName forKey:kNewsBookList_BaseClassMediaName];
    [aCoder encodeDouble:_mediaId forKey:kNewsBookList_BaseClassMediaId];
    [aCoder encodeObject:_type forKey:kNewsBookList_BaseClassType];
    [aCoder encodeObject:_list forKey:kNewsBookList_BaseClassList];
    [aCoder encodeObject:_totalNum forKey:kNewsBookList_BaseClassTotalNum];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsBookList_BaseClass *copy = [[NewsBookList_BaseClass alloc] init];
    
    if (copy) {

        copy.subNum = [self.subNum copyWithZone:zone];
        copy.isSub = [self.isSub copyWithZone:zone];
        copy.mediaLogo = [self.mediaLogo copyWithZone:zone];
        copy.mediaName = [self.mediaName copyWithZone:zone];
        copy.mediaId = self.mediaId;
        copy.type = [self.type copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.totalNum = [self.totalNum copyWithZone:zone];
    }
    
    return copy;
}


@end
