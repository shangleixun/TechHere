//
//  NewsSmartList_List.m
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewsSmartList_List.h"


NSString *const kNewsSmartList_ListJoinPeople = @"joinPeople";
NSString *const kNewsSmartList_ListImgsrc = @"imgsrc";
NSString *const kNewsSmartList_ListStitle = @"stitle";
NSString *const kNewsSmartList_ListId = @"id";
NSString *const kNewsSmartList_ListImgsrc2 = @"imgsrc2";
NSString *const kNewsSmartList_ListCommentNum = @"comment_num";
NSString *const kNewsSmartList_ListSdate = @"sdate";
NSString *const kNewsSmartList_ListPics = @"pics";
NSString *const kNewsSmartList_ListType = @"type";
NSString *const kNewsSmartList_ListPicNum = @"pic_num";
NSString *const kNewsSmartList_ListUrl = @"url";


@interface NewsSmartList_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewsSmartList_List

@synthesize joinPeople = _joinPeople;
@synthesize imgsrc = _imgsrc;
@synthesize stitle = _stitle;
@synthesize listIdentifier = _listIdentifier;
@synthesize imgsrc2 = _imgsrc2;
@synthesize commentNum = _commentNum;
@synthesize sdate = _sdate;
@synthesize pics = _pics;
@synthesize type = _type;
@synthesize picNum = _picNum;
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
            self.joinPeople = [self objectOrNilForKey:kNewsSmartList_ListJoinPeople fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kNewsSmartList_ListImgsrc fromDictionary:dict];
            self.stitle = [self objectOrNilForKey:kNewsSmartList_ListStitle fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kNewsSmartList_ListId fromDictionary:dict];
            self.imgsrc2 = [self objectOrNilForKey:kNewsSmartList_ListImgsrc2 fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kNewsSmartList_ListCommentNum fromDictionary:dict] doubleValue];
            self.sdate = [self objectOrNilForKey:kNewsSmartList_ListSdate fromDictionary:dict];
            self.pics = [self objectOrNilForKey:kNewsSmartList_ListPics fromDictionary:dict];
            self.type = [self objectOrNilForKey:kNewsSmartList_ListType fromDictionary:dict];
            self.picNum = [[self objectOrNilForKey:kNewsSmartList_ListPicNum fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kNewsSmartList_ListUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.joinPeople forKey:kNewsSmartList_ListJoinPeople];
    [mutableDict setValue:self.imgsrc forKey:kNewsSmartList_ListImgsrc];
    [mutableDict setValue:self.stitle forKey:kNewsSmartList_ListStitle];
    [mutableDict setValue:self.listIdentifier forKey:kNewsSmartList_ListId];
    [mutableDict setValue:self.imgsrc2 forKey:kNewsSmartList_ListImgsrc2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kNewsSmartList_ListCommentNum];
    [mutableDict setValue:self.sdate forKey:kNewsSmartList_ListSdate];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kNewsSmartList_ListPics];
    [mutableDict setValue:self.type forKey:kNewsSmartList_ListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picNum] forKey:kNewsSmartList_ListPicNum];
    [mutableDict setValue:self.url forKey:kNewsSmartList_ListUrl];

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

    self.joinPeople = [aDecoder decodeObjectForKey:kNewsSmartList_ListJoinPeople];
    self.imgsrc = [aDecoder decodeObjectForKey:kNewsSmartList_ListImgsrc];
    self.stitle = [aDecoder decodeObjectForKey:kNewsSmartList_ListStitle];
    self.listIdentifier = [aDecoder decodeObjectForKey:kNewsSmartList_ListId];
    self.imgsrc2 = [aDecoder decodeObjectForKey:kNewsSmartList_ListImgsrc2];
    self.commentNum = [aDecoder decodeDoubleForKey:kNewsSmartList_ListCommentNum];
    self.sdate = [aDecoder decodeObjectForKey:kNewsSmartList_ListSdate];
    self.pics = [aDecoder decodeObjectForKey:kNewsSmartList_ListPics];
    self.type = [aDecoder decodeObjectForKey:kNewsSmartList_ListType];
    self.picNum = [aDecoder decodeDoubleForKey:kNewsSmartList_ListPicNum];
    self.url = [aDecoder decodeObjectForKey:kNewsSmartList_ListUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_joinPeople forKey:kNewsSmartList_ListJoinPeople];
    [aCoder encodeObject:_imgsrc forKey:kNewsSmartList_ListImgsrc];
    [aCoder encodeObject:_stitle forKey:kNewsSmartList_ListStitle];
    [aCoder encodeObject:_listIdentifier forKey:kNewsSmartList_ListId];
    [aCoder encodeObject:_imgsrc2 forKey:kNewsSmartList_ListImgsrc2];
    [aCoder encodeDouble:_commentNum forKey:kNewsSmartList_ListCommentNum];
    [aCoder encodeObject:_sdate forKey:kNewsSmartList_ListSdate];
    [aCoder encodeObject:_pics forKey:kNewsSmartList_ListPics];
    [aCoder encodeObject:_type forKey:kNewsSmartList_ListType];
    [aCoder encodeDouble:_picNum forKey:kNewsSmartList_ListPicNum];
    [aCoder encodeObject:_url forKey:kNewsSmartList_ListUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewsSmartList_List *copy = [[NewsSmartList_List alloc] init];
    
    if (copy) {

        copy.joinPeople = [self.joinPeople copyWithZone:zone];
        copy.imgsrc = [self.imgsrc copyWithZone:zone];
        copy.stitle = [self.stitle copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.imgsrc2 = [self.imgsrc2 copyWithZone:zone];
        copy.commentNum = self.commentNum;
        copy.sdate = [self.sdate copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.picNum = self.picNum;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
