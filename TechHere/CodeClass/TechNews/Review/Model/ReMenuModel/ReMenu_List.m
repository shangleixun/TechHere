//
//  ReMenu_List.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ReMenu_List.h"


NSString *const kReMenu_ListJoinPeople = @"joinPeople";
NSString *const kReMenu_ListImgsrc = @"imgsrc";
NSString *const kReMenu_ListStitle = @"stitle";
NSString *const kReMenu_ListId = @"id";
NSString *const kReMenu_ListImgsrc2 = @"imgsrc2";
NSString *const kReMenu_ListCommentNum = @"comment_num";
NSString *const kReMenu_ListSdate = @"sdate";
NSString *const kReMenu_ListType = @"type";
NSString *const kReMenu_ListUrl = @"url";


@interface ReMenu_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ReMenu_List

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
            self.joinPeople = [self objectOrNilForKey:kReMenu_ListJoinPeople fromDictionary:dict];
            self.imgsrc = [self objectOrNilForKey:kReMenu_ListImgsrc fromDictionary:dict];
            self.stitle = [self objectOrNilForKey:kReMenu_ListStitle fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kReMenu_ListId fromDictionary:dict];
            self.imgsrc2 = [self objectOrNilForKey:kReMenu_ListImgsrc2 fromDictionary:dict];
            self.commentNum = [[self objectOrNilForKey:kReMenu_ListCommentNum fromDictionary:dict] doubleValue];
            self.sdate = [self objectOrNilForKey:kReMenu_ListSdate fromDictionary:dict];
            self.type = [self objectOrNilForKey:kReMenu_ListType fromDictionary:dict];
            self.url = [self objectOrNilForKey:kReMenu_ListUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.joinPeople forKey:kReMenu_ListJoinPeople];
    [mutableDict setValue:self.imgsrc forKey:kReMenu_ListImgsrc];
    [mutableDict setValue:self.stitle forKey:kReMenu_ListStitle];
    [mutableDict setValue:self.listIdentifier forKey:kReMenu_ListId];
    [mutableDict setValue:self.imgsrc2 forKey:kReMenu_ListImgsrc2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentNum] forKey:kReMenu_ListCommentNum];
    [mutableDict setValue:self.sdate forKey:kReMenu_ListSdate];
    [mutableDict setValue:self.type forKey:kReMenu_ListType];
    [mutableDict setValue:self.url forKey:kReMenu_ListUrl];

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

    self.joinPeople = [aDecoder decodeObjectForKey:kReMenu_ListJoinPeople];
    self.imgsrc = [aDecoder decodeObjectForKey:kReMenu_ListImgsrc];
    self.stitle = [aDecoder decodeObjectForKey:kReMenu_ListStitle];
    self.listIdentifier = [aDecoder decodeObjectForKey:kReMenu_ListId];
    self.imgsrc2 = [aDecoder decodeObjectForKey:kReMenu_ListImgsrc2];
    self.commentNum = [aDecoder decodeDoubleForKey:kReMenu_ListCommentNum];
    self.sdate = [aDecoder decodeObjectForKey:kReMenu_ListSdate];
    self.type = [aDecoder decodeObjectForKey:kReMenu_ListType];
    self.url = [aDecoder decodeObjectForKey:kReMenu_ListUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_joinPeople forKey:kReMenu_ListJoinPeople];
    [aCoder encodeObject:_imgsrc forKey:kReMenu_ListImgsrc];
    [aCoder encodeObject:_stitle forKey:kReMenu_ListStitle];
    [aCoder encodeObject:_listIdentifier forKey:kReMenu_ListId];
    [aCoder encodeObject:_imgsrc2 forKey:kReMenu_ListImgsrc2];
    [aCoder encodeDouble:_commentNum forKey:kReMenu_ListCommentNum];
    [aCoder encodeObject:_sdate forKey:kReMenu_ListSdate];
    [aCoder encodeObject:_type forKey:kReMenu_ListType];
    [aCoder encodeObject:_url forKey:kReMenu_ListUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    ReMenu_List *copy = [[ReMenu_List alloc] init];
    
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
