//
//  ReList_List.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReList_List.h"


NSString *const kReList_ListJoinPeople = @"joinPeople";
NSString *const kReList_ListImgsrc = @"imgsrc";
NSString *const kReList_ListStitle = @"stitle";
NSString *const kReList_ListId = @"id";
NSString *const kReList_ListImgsrc2 = @"imgsrc2";
NSString *const kReList_ListCommentNum = @"comment_num";
NSString *const kReList_ListSdate = @"sdate";
NSString *const kReList_ListType = @"type";
NSString *const kReList_ListUrl = @"url";


@interface ReList_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReList_List

@synthesize joinPeople = _joinPeople;
@synthesize imgsrc = _imgsrc;
@synthesize stitle = _stitle;
@synthesize listIdentifier = _listIdentifier;
@synthesize imgsrc2 = _imgsrc2;
@synthesize commentNum = _commentNum;
@synthesize sdate = _sdate;
@synthesize type = _type;
@synthesize url = _url;


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
            self.joinPeople = [self objectOrNilForKey:kReList_ListJoinPeople fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kReList_ListImgsrc fromDictionary:dict];
            self.stitle = [self objectOrNilForKey:kReList_ListStitle fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kReList_ListId fromDictionary:dict];
            self.imgsrc2 = [self objectOrNilForKey:kReList_ListImgsrc2 fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kReList_ListCommentNum fromDictionary:dict] doubleValue];
            self.sdate = [self objectOrNilForKey:kReList_ListSdate fromDictionary:dict];
            self.type = [self objectOrNilForKey:kReList_ListType fromDictionary:dict];
            self.url = [self objectOrNilForKey:kReList_ListUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.joinPeople forKey:kReList_ListJoinPeople];
    [mutableDict setValue:self.imgsrc forKey:kReList_ListImgsrc];
    [mutableDict setValue:self.stitle forKey:kReList_ListStitle];
    [mutableDict setValue:self.listIdentifier forKey:kReList_ListId];
    [mutableDict setValue:self.imgsrc2 forKey:kReList_ListImgsrc2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kReList_ListCommentNum];
    [mutableDict setValue:self.sdate forKey:kReList_ListSdate];
    [mutableDict setValue:self.type forKey:kReList_ListType];
    [mutableDict setValue:self.url forKey:kReList_ListUrl];

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

    self.joinPeople = [aDecoder decodeObjectForKey:kReList_ListJoinPeople];
    self.imgsrc = [aDecoder decodeObjectForKey:kReList_ListImgsrc];
    self.stitle = [aDecoder decodeObjectForKey:kReList_ListStitle];
    self.listIdentifier = [aDecoder decodeObjectForKey:kReList_ListId];
    self.imgsrc2 = [aDecoder decodeObjectForKey:kReList_ListImgsrc2];
    self.commentNum = [aDecoder decodeDoubleForKey:kReList_ListCommentNum];
    self.sdate = [aDecoder decodeObjectForKey:kReList_ListSdate];
    self.type = [aDecoder decodeObjectForKey:kReList_ListType];
    self.url = [aDecoder decodeObjectForKey:kReList_ListUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_joinPeople forKey:kReList_ListJoinPeople];
    [aCoder encodeObject:_imgsrc forKey:kReList_ListImgsrc];
    [aCoder encodeObject:_stitle forKey:kReList_ListStitle];
    [aCoder encodeObject:_listIdentifier forKey:kReList_ListId];
    [aCoder encodeObject:_imgsrc2 forKey:kReList_ListImgsrc2];
    [aCoder encodeDouble:_commentNum forKey:kReList_ListCommentNum];
    [aCoder encodeObject:_sdate forKey:kReList_ListSdate];
    [aCoder encodeObject:_type forKey:kReList_ListType];
    [aCoder encodeObject:_url forKey:kReList_ListUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReList_List *copy = [[ReList_List alloc] init];
    
    if (copy) {

        copy.joinPeople = [self.joinPeople copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.stitle = [self.stitle copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.imgsrc2 = [self.imgsrc2 copyWithZone:zone];
        copy.commentNum = self.commentNum;
        copy.sdate = [self.sdate copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
