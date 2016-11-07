//
//  NewsBookList_List.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsBookList_List.h"


NSString *const kNewsBookList_ListTitle = @"title";
NSString *const kNewsBookList_ListPic = @"pic";
NSString *const kNewsBookList_ListType = @"type";
NSString *const kNewsBookList_ListPubDate = @"pubDate";
NSString *const kNewsBookList_ListDocId = @"docId";


@interface NewsBookList_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsBookList_List

@synthesize title = _title;
@synthesize pic = _pic;
@synthesize type = _type;
@synthesize pubDate = _pubDate;
@synthesize docId = _docId;


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
            self.title = [self objectOrNilForKey:kNewsBookList_ListTitle fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kNewsBookList_ListPic fromDictionary:dict];
            self.type = [self objectOrNilForKey:kNewsBookList_ListType fromDictionary:dict];
            self.pubDate = [self objectOrNilForKey:kNewsBookList_ListPubDate fromDictionary:dict];
            self.docId = [self objectOrNilForKey:kNewsBookList_ListDocId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kNewsBookList_ListTitle];
    [mutableDict setValue:self.pic forKey:kNewsBookList_ListPic];
    [mutableDict setValue:self.type forKey:kNewsBookList_ListType];
    [mutableDict setValue:self.pubDate forKey:kNewsBookList_ListPubDate];
    [mutableDict setValue:self.docId forKey:kNewsBookList_ListDocId];

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

    self.title = [aDecoder decodeObjectForKey:kNewsBookList_ListTitle];
    self.pic = [aDecoder decodeObjectForKey:kNewsBookList_ListPic];
    self.type = [aDecoder decodeObjectForKey:kNewsBookList_ListType];
    self.pubDate = [aDecoder decodeObjectForKey:kNewsBookList_ListPubDate];
    self.docId = [aDecoder decodeObjectForKey:kNewsBookList_ListDocId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kNewsBookList_ListTitle];
    [aCoder encodeObject:_pic forKey:kNewsBookList_ListPic];
    [aCoder encodeObject:_type forKey:kNewsBookList_ListType];
    [aCoder encodeObject:_pubDate forKey:kNewsBookList_ListPubDate];
    [aCoder encodeObject:_docId forKey:kNewsBookList_ListDocId];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsBookList_List *copy = [[NewsBookList_List alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.pubDate = [self.pubDate copyWithZone:zone];
        copy.docId = [self.docId copyWithZone:zone];
    }
    
    return copy;
}


@end
