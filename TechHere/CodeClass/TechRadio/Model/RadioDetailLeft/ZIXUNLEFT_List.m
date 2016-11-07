//
//  ZIXUNLEFT_List.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_List.h"


NSString *const kZIXUNLEFT_ListTitle = @"title";
NSString *const kZIXUNLEFT_ListDisplayDiscountedPrice = @"displayDiscountedPrice";
NSString *const kZIXUNLEFT_ListDisplayPrice = @"displayPrice";
NSString *const kZIXUNLEFT_ListCoverMiddle = @"coverMiddle";
NSString *const kZIXUNLEFT_ListPlaysCounts = @"playsCounts";
NSString *const kZIXUNLEFT_ListIntro = @"intro";
NSString *const kZIXUNLEFT_ListIsPaid = @"isPaid";
NSString *const kZIXUNLEFT_ListCommentsCount = @"commentsCount";
NSString *const kZIXUNLEFT_ListRecSrc = @"recSrc";
NSString *const kZIXUNLEFT_ListScore = @"score";
NSString *const kZIXUNLEFT_ListAlbumId = @"albumId";
NSString *const kZIXUNLEFT_ListUpdatedAt = @"updatedAt";
NSString *const kZIXUNLEFT_ListCoverSmall = @"coverSmall";
NSString *const kZIXUNLEFT_ListRecTrack = @"recTrack";
NSString *const kZIXUNLEFT_ListUid = @"uid";
NSString *const kZIXUNLEFT_ListTracks = @"tracks";
NSString *const kZIXUNLEFT_ListPriceTypeId = @"priceTypeId";
NSString *const kZIXUNLEFT_ListTotalTrackCount = @"totalTrackCount";
NSString *const kZIXUNLEFT_ListDiscountedPrice = @"discountedPrice";
NSString *const kZIXUNLEFT_ListPrice = @"price";
NSString *const kZIXUNLEFT_ListPlayTimes = @"playTimes";
NSString *const kZIXUNLEFT_ListPriceTypeEnum = @"priceTypeEnum";


@interface ZIXUNLEFT_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_List

@synthesize title = _title;
@synthesize displayDiscountedPrice = _displayDiscountedPrice;
@synthesize displayPrice = _displayPrice;
@synthesize coverMiddle = _coverMiddle;
@synthesize playsCounts = _playsCounts;
@synthesize intro = _intro;
@synthesize isPaid = _isPaid;
@synthesize commentsCount = _commentsCount;
@synthesize recSrc = _recSrc;
@synthesize score = _score;
@synthesize albumId = _albumId;
@synthesize updatedAt = _updatedAt;
@synthesize coverSmall = _coverSmall;
@synthesize recTrack = _recTrack;
@synthesize uid = _uid;
@synthesize tracks = _tracks;
@synthesize priceTypeId = _priceTypeId;
@synthesize totalTrackCount = _totalTrackCount;
@synthesize discountedPrice = _discountedPrice;
@synthesize price = _price;
@synthesize playTimes = _playTimes;
@synthesize priceTypeEnum = _priceTypeEnum;


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
            self.title = [self objectOrNilForKey:kZIXUNLEFT_ListTitle fromDictionary:dict];
            self.displayDiscountedPrice = [self objectOrNilForKey:kZIXUNLEFT_ListDisplayDiscountedPrice fromDictionary:dict];
            self.displayPrice = [self objectOrNilForKey:kZIXUNLEFT_ListDisplayPrice fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kZIXUNLEFT_ListCoverMiddle fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kZIXUNLEFT_ListPlaysCounts fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kZIXUNLEFT_ListIntro fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kZIXUNLEFT_ListIsPaid fromDictionary:dict] boolValue];
            self.commentsCount = [[self objectOrNilForKey:kZIXUNLEFT_ListCommentsCount fromDictionary:dict] doubleValue];
            self.recSrc = [self objectOrNilForKey:kZIXUNLEFT_ListRecSrc fromDictionary:dict];
            self.score = [[self objectOrNilForKey:kZIXUNLEFT_ListScore fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kZIXUNLEFT_ListAlbumId fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kZIXUNLEFT_ListUpdatedAt fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kZIXUNLEFT_ListCoverSmall fromDictionary:dict];
            self.recTrack = [self objectOrNilForKey:kZIXUNLEFT_ListRecTrack fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZIXUNLEFT_ListUid fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kZIXUNLEFT_ListTracks fromDictionary:dict] doubleValue];
            self.priceTypeId = [[self objectOrNilForKey:kZIXUNLEFT_ListPriceTypeId fromDictionary:dict] doubleValue];
            self.totalTrackCount = [[self objectOrNilForKey:kZIXUNLEFT_ListTotalTrackCount fromDictionary:dict] doubleValue];
            self.discountedPrice = [[self objectOrNilForKey:kZIXUNLEFT_ListDiscountedPrice fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kZIXUNLEFT_ListPrice fromDictionary:dict] doubleValue];
            self.playTimes = [[self objectOrNilForKey:kZIXUNLEFT_ListPlayTimes fromDictionary:dict] doubleValue];
            self.priceTypeEnum = [[self objectOrNilForKey:kZIXUNLEFT_ListPriceTypeEnum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kZIXUNLEFT_ListTitle];
    [mutableDict setValue:self.displayDiscountedPrice forKey:kZIXUNLEFT_ListDisplayDiscountedPrice];
    [mutableDict setValue:self.displayPrice forKey:kZIXUNLEFT_ListDisplayPrice];
    [mutableDict setValue:self.coverMiddle forKey:kZIXUNLEFT_ListCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kZIXUNLEFT_ListPlaysCounts];
    [mutableDict setValue:self.intro forKey:kZIXUNLEFT_ListIntro];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kZIXUNLEFT_ListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kZIXUNLEFT_ListCommentsCount];
    [mutableDict setValue:self.recSrc forKey:kZIXUNLEFT_ListRecSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kZIXUNLEFT_ListScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kZIXUNLEFT_ListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kZIXUNLEFT_ListUpdatedAt];
    [mutableDict setValue:self.coverSmall forKey:kZIXUNLEFT_ListCoverSmall];
    [mutableDict setValue:self.recTrack forKey:kZIXUNLEFT_ListRecTrack];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNLEFT_ListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kZIXUNLEFT_ListTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kZIXUNLEFT_ListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalTrackCount] forKey:kZIXUNLEFT_ListTotalTrackCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountedPrice] forKey:kZIXUNLEFT_ListDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kZIXUNLEFT_ListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTimes] forKey:kZIXUNLEFT_ListPlayTimes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeEnum] forKey:kZIXUNLEFT_ListPriceTypeEnum];

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

    self.title = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListTitle];
    self.displayDiscountedPrice = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListDisplayDiscountedPrice];
    self.displayPrice = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListDisplayPrice];
    self.coverMiddle = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListCoverMiddle];
    self.playsCounts = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListPlaysCounts];
    self.intro = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListIntro];
    self.isPaid = [aDecoder decodeBoolForKey:kZIXUNLEFT_ListIsPaid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListCommentsCount];
    self.recSrc = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListRecSrc];
    self.score = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListScore];
    self.albumId = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListAlbumId];
    self.updatedAt = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListUpdatedAt];
    self.coverSmall = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListCoverSmall];
    self.recTrack = [aDecoder decodeObjectForKey:kZIXUNLEFT_ListRecTrack];
    self.uid = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListUid];
    self.tracks = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListTracks];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListPriceTypeId];
    self.totalTrackCount = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListTotalTrackCount];
    self.discountedPrice = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListDiscountedPrice];
    self.price = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListPrice];
    self.playTimes = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListPlayTimes];
    self.priceTypeEnum = [aDecoder decodeDoubleForKey:kZIXUNLEFT_ListPriceTypeEnum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kZIXUNLEFT_ListTitle];
    [aCoder encodeObject:_displayDiscountedPrice forKey:kZIXUNLEFT_ListDisplayDiscountedPrice];
    [aCoder encodeObject:_displayPrice forKey:kZIXUNLEFT_ListDisplayPrice];
    [aCoder encodeObject:_coverMiddle forKey:kZIXUNLEFT_ListCoverMiddle];
    [aCoder encodeDouble:_playsCounts forKey:kZIXUNLEFT_ListPlaysCounts];
    [aCoder encodeObject:_intro forKey:kZIXUNLEFT_ListIntro];
    [aCoder encodeBool:_isPaid forKey:kZIXUNLEFT_ListIsPaid];
    [aCoder encodeDouble:_commentsCount forKey:kZIXUNLEFT_ListCommentsCount];
    [aCoder encodeObject:_recSrc forKey:kZIXUNLEFT_ListRecSrc];
    [aCoder encodeDouble:_score forKey:kZIXUNLEFT_ListScore];
    [aCoder encodeDouble:_albumId forKey:kZIXUNLEFT_ListAlbumId];
    [aCoder encodeDouble:_updatedAt forKey:kZIXUNLEFT_ListUpdatedAt];
    [aCoder encodeObject:_coverSmall forKey:kZIXUNLEFT_ListCoverSmall];
    [aCoder encodeObject:_recTrack forKey:kZIXUNLEFT_ListRecTrack];
    [aCoder encodeDouble:_uid forKey:kZIXUNLEFT_ListUid];
    [aCoder encodeDouble:_tracks forKey:kZIXUNLEFT_ListTracks];
    [aCoder encodeDouble:_priceTypeId forKey:kZIXUNLEFT_ListPriceTypeId];
    [aCoder encodeDouble:_totalTrackCount forKey:kZIXUNLEFT_ListTotalTrackCount];
    [aCoder encodeDouble:_discountedPrice forKey:kZIXUNLEFT_ListDiscountedPrice];
    [aCoder encodeDouble:_price forKey:kZIXUNLEFT_ListPrice];
    [aCoder encodeDouble:_playTimes forKey:kZIXUNLEFT_ListPlayTimes];
    [aCoder encodeDouble:_priceTypeEnum forKey:kZIXUNLEFT_ListPriceTypeEnum];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_List *copy = [[ZIXUNLEFT_List alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.displayDiscountedPrice = [self.displayDiscountedPrice copyWithZone:zone];
        copy.displayPrice = [self.displayPrice copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.intro = [self.intro copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.commentsCount = self.commentsCount;
        copy.recSrc = [self.recSrc copyWithZone:zone];
        copy.score = self.score;
        copy.albumId = self.albumId;
        copy.updatedAt = self.updatedAt;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.recTrack = [self.recTrack copyWithZone:zone];
        copy.uid = self.uid;
        copy.tracks = self.tracks;
        copy.priceTypeId = self.priceTypeId;
        copy.totalTrackCount = self.totalTrackCount;
        copy.discountedPrice = self.discountedPrice;
        copy.price = self.price;
        copy.playTimes = self.playTimes;
        copy.priceTypeEnum = self.priceTypeEnum;
    }
    
    return copy;
}


@end
