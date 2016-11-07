//
//  NewsHotList_List.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsHotList_List.h"


NSString *const kNewsHotList_ListId = @"id";
NSString *const kNewsHotList_ListImgsrc = @"imgsrc";
NSString *const kNewsHotList_ListUrl = @"url";
NSString *const kNewsHotList_ListType = @"type";
NSString *const kNewsHotList_ListCommentNum = @"comment_num";
NSString *const kNewsHotList_ListStitle = @"stitle";
NSString *const kNewsHotList_ListImgsrc2 = @"imgsrc2";
NSString *const kNewsHotList_ListSdate = @"sdate";
NSString *const kNewsHotList_ListJoinPeople = @"joinPeople";
NSString *const kNewsHotList_ListLiveNum = @"live_num";
NSString *const kNewsHotList_ListPics = @"pics";
NSString *const kNewsHotList_ListStatus = @"status";


@interface NewsHotList_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsHotList_List

@synthesize listIdentifier = _listIdentifier;
@synthesize imgsrc = _imgsrc;
@synthesize url = _url;
@synthesize type = _type;
@synthesize commentNum = _commentNum;
@synthesize stitle = _stitle;
@synthesize imgsrc2 = _imgsrc2;
@synthesize sdate = _sdate;
@synthesize joinPeople = _joinPeople;
@synthesize liveNum = _liveNum;
@synthesize pics = _pics;
@synthesize status = _status;


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
            self.listIdentifier = [self objectOrNilForKey:kNewsHotList_ListId fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsHotList_ListImgsrc fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewsHotList_ListUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kNewsHotList_ListType fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kNewsHotList_ListCommentNum fromDictionary:dict] doubleValue];
            self.stitle = [self objectOrNilForKey:kNewsHotList_ListStitle fromDictionary:dict];
            self.imgsrc2 = [self objectOrNilForKey:kNewsHotList_ListImgsrc2 fromDictionary:dict];
            self.sdate = [self objectOrNilForKey:kNewsHotList_ListSdate fromDictionary:dict];
            self.joinPeople = [self objectOrNilForKey:kNewsHotList_ListJoinPeople fromDictionary:dict];
            self.liveNum = [[self objectOrNilForKey:kNewsHotList_ListLiveNum fromDictionary:dict] doubleValue];
            self.pics = [self objectOrNilForKey:kNewsHotList_ListPics fromDictionary:dict];
            self.status = [self objectOrNilForKey:kNewsHotList_ListStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kNewsHotList_ListId];
    [mutableDict setValue:self.imgsrc forKey:kNewsHotList_ListImgsrc];
    [mutableDict setValue:self.url forKey:kNewsHotList_ListUrl];
    [mutableDict setValue:self.type forKey:kNewsHotList_ListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kNewsHotList_ListCommentNum];
    [mutableDict setValue:self.stitle forKey:kNewsHotList_ListStitle];
    [mutableDict setValue:self.imgsrc2 forKey:kNewsHotList_ListImgsrc2];
    [mutableDict setValue:self.sdate forKey:kNewsHotList_ListSdate];
    [mutableDict setValue:self.joinPeople forKey:kNewsHotList_ListJoinPeople];
    [mutableDict setValue:[NSNumber numberWithDouble:self.liveNum] forKey:kNewsHotList_ListLiveNum];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kNewsHotList_ListPics];
    [mutableDict setValue:self.status forKey:kNewsHotList_ListStatus];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kNewsHotList_ListId];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsHotList_ListImgsrc];
    self.url = [aDecoder decodeObjectForKey:kNewsHotList_ListUrl];
    self.type = [aDecoder decodeObjectForKey:kNewsHotList_ListType];
    self.commentNum = [aDecoder decodeDoubleForKey:kNewsHotList_ListCommentNum];
    self.stitle = [aDecoder decodeObjectForKey:kNewsHotList_ListStitle];
    self.imgsrc2 = [aDecoder decodeObjectForKey:kNewsHotList_ListImgsrc2];
    self.sdate = [aDecoder decodeObjectForKey:kNewsHotList_ListSdate];
    self.joinPeople = [aDecoder decodeObjectForKey:kNewsHotList_ListJoinPeople];
    self.liveNum = [aDecoder decodeDoubleForKey:kNewsHotList_ListLiveNum];
    self.pics = [aDecoder decodeObjectForKey:kNewsHotList_ListPics];
    self.status = [aDecoder decodeObjectForKey:kNewsHotList_ListStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kNewsHotList_ListId];
    [aCoder encodeObject:_imgsrc forKey:kNewsHotList_ListImgsrc];
    [aCoder encodeObject:_url forKey:kNewsHotList_ListUrl];
    [aCoder encodeObject:_type forKey:kNewsHotList_ListType];
    [aCoder encodeDouble:_commentNum forKey:kNewsHotList_ListCommentNum];
    [aCoder encodeObject:_stitle forKey:kNewsHotList_ListStitle];
    [aCoder encodeObject:_imgsrc2 forKey:kNewsHotList_ListImgsrc2];
    [aCoder encodeObject:_sdate forKey:kNewsHotList_ListSdate];
    [aCoder encodeObject:_joinPeople forKey:kNewsHotList_ListJoinPeople];
    [aCoder encodeDouble:_liveNum forKey:kNewsHotList_ListLiveNum];
    [aCoder encodeObject:_pics forKey:kNewsHotList_ListPics];
    [aCoder encodeObject:_status forKey:kNewsHotList_ListStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsHotList_List *copy = [[NewsHotList_List alloc] init];
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.commentNum = self.commentNum;
        copy.stitle = [self.stitle copyWithZone:zone];
        copy.imgsrc2 = [self.imgsrc2 copyWithZone:zone];
        copy.sdate = [self.sdate copyWithZone:zone];
        copy.joinPeople = [self.joinPeople copyWithZone:zone];
        copy.liveNum = self.liveNum;
        copy.pics = [self.pics copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
