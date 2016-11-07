//
//  Total_List.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Total_List.h"


NSString *const kTotal_ListUid = @"uid";
NSString *const kTotal_ListPriceTypeEnum = @"priceTypeEnum";
NSString *const kTotal_ListTrackTitle = @"trackTitle";
NSString *const kTotal_ListHasMore = @"hasMore";
NSString *const kTotal_ListId = @"id";
NSString *const kTotal_ListCoverMiddle = @"coverMiddle";
NSString *const kTotal_ListCoverPathBig = @"coverPathBig";
NSString *const kTotal_ListKeywordId = @"keywordId";
NSString *const kTotal_ListDisplayPrice = @"displayPrice";
NSString *const kTotal_ListCategoryId = @"categoryId";
NSString *const kTotal_ListReleasedAt = @"releasedAt";
NSString *const kTotal_ListPlaysCounts = @"playsCounts";
NSString *const kTotal_ListSubtitle = @"subtitle";
NSString *const kTotal_ListShortTitle = @"shortTitle";
NSString *const kTotal_ListIsShare = @"isShare";
NSString *const kTotal_ListNickname = @"nickname";
NSString *const kTotal_ListIsExternalUrl = @"is_External_url";
NSString *const kTotal_ListSubType = @"subType";
NSString *const kTotal_ListRealCategoryId = @"realCategoryId";
NSString *const kTotal_ListScore = @"score";
NSString *const kTotal_ListType = @"type";
NSString *const kTotal_ListContentType = @"contentType";
NSString *const kTotal_ListDisplayDiscountedPrice = @"displayDiscountedPrice";
NSString *const kTotal_ListIntro = @"intro";
NSString *const kTotal_ListCoverLarge = @"coverLarge";
NSString *const kTotal_ListList = @"list";
NSString *const kTotal_ListIsFinished = @"isFinished";
NSString *const kTotal_ListTrackId = @"trackId";
NSString *const kTotal_ListSpecialId = @"specialId";
NSString *const kTotal_ListDiscountedPrice = @"discountedPrice";
NSString *const kTotal_ListSerialState = @"serialState";
NSString *const kTotal_ListIsPaid = @"isPaid";
NSString *const kTotal_ListPrice = @"price";
NSString *const kTotal_ListIsHot = @"isHot";
NSString *const kTotal_ListTagName = @"tagName";
NSString *const kTotal_ListTags = @"tags";
NSString *const kTotal_ListPriceTypeId = @"priceTypeId";
NSString *const kTotal_ListFootnote = @"footnote";
NSString *const kTotal_ListCommentsCount = @"commentsCount";
NSString *const kTotal_ListKeywordType = @"keywordType";
NSString *const kTotal_ListAlbumId = @"albumId";
NSString *const kTotal_ListTracks = @"tracks";
NSString *const kTotal_ListModuleType = @"moduleType";
NSString *const kTotal_ListCoverPathSmall = @"coverPathSmall";
NSString *const kTotal_ListPic = @"pic";
NSString *const kTotal_ListLongTitle = @"longTitle";
NSString *const kTotal_ListCalcDimension = @"calcDimension";
NSString *const kTotal_ListTitle = @"title";
NSString *const kTotal_ListAlbumCoverUrl290 = @"albumCoverUrl290";
NSString *const kTotal_ListKeywordName = @"keywordName";
NSString *const kTotal_ListCoverSmall = @"coverSmall";


@interface Total_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Total_List

@synthesize uid = _uid;
@synthesize priceTypeEnum = _priceTypeEnum;
@synthesize trackTitle = _trackTitle;
@synthesize hasMore = _hasMore;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverMiddle = _coverMiddle;
@synthesize coverPathBig = _coverPathBig;
@synthesize keywordId = _keywordId;
@synthesize displayPrice = _displayPrice;
@synthesize categoryId = _categoryId;
@synthesize releasedAt = _releasedAt;
@synthesize playsCounts = _playsCounts;
@synthesize subtitle = _subtitle;
@synthesize shortTitle = _shortTitle;
@synthesize isShare = _isShare;
@synthesize nickname = _nickname;
@synthesize isExternalUrl = _isExternalUrl;
@synthesize subType = _subType;
@synthesize realCategoryId = _realCategoryId;
@synthesize score = _score;
@synthesize type = _type;
@synthesize contentType = _contentType;
@synthesize displayDiscountedPrice = _displayDiscountedPrice;
@synthesize intro = _intro;
@synthesize coverLarge = _coverLarge;
@synthesize list = _list;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize specialId = _specialId;
@synthesize discountedPrice = _discountedPrice;
@synthesize serialState = _serialState;
@synthesize isPaid = _isPaid;
@synthesize price = _price;
@synthesize isHot = _isHot;
@synthesize tagName = _tagName;
@synthesize tags = _tags;
@synthesize priceTypeId = _priceTypeId;
@synthesize footnote = _footnote;
@synthesize commentsCount = _commentsCount;
@synthesize keywordType = _keywordType;
@synthesize albumId = _albumId;
@synthesize tracks = _tracks;
@synthesize moduleType = _moduleType;
@synthesize coverPathSmall = _coverPathSmall;
@synthesize pic = _pic;
@synthesize longTitle = _longTitle;
@synthesize calcDimension = _calcDimension;
@synthesize title = _title;
@synthesize albumCoverUrl290 = _albumCoverUrl290;
@synthesize keywordName = _keywordName;
@synthesize coverSmall = _coverSmall;


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
            self.uid = [[self objectOrNilForKey:kTotal_ListUid fromDictionary:dict] doubleValue];
            self.priceTypeEnum = [[self objectOrNilForKey:kTotal_ListPriceTypeEnum fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kTotal_ListTrackTitle fromDictionary:dict];
            self.hasMore = [[self objectOrNilForKey:kTotal_ListHasMore fromDictionary:dict] boolValue];
            self.listIdentifier = [[self objectOrNilForKey:kTotal_ListId fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kTotal_ListCoverMiddle fromDictionary:dict];
            self.coverPathBig = [self objectOrNilForKey:kTotal_ListCoverPathBig fromDictionary:dict];
            self.keywordId = [[self objectOrNilForKey:kTotal_ListKeywordId fromDictionary:dict] doubleValue];
            self.displayPrice = [self objectOrNilForKey:kTotal_ListDisplayPrice fromDictionary:dict];
            self.categoryId = [[self objectOrNilForKey:kTotal_ListCategoryId fromDictionary:dict] doubleValue];
            self.releasedAt = [[self objectOrNilForKey:kTotal_ListReleasedAt fromDictionary:dict] doubleValue];
            self.playsCounts = [[self objectOrNilForKey:kTotal_ListPlaysCounts fromDictionary:dict] doubleValue];
            self.subtitle = [self objectOrNilForKey:kTotal_ListSubtitle fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kTotal_ListShortTitle fromDictionary:dict];
            self.isShare = [[self objectOrNilForKey:kTotal_ListIsShare fromDictionary:dict] boolValue];
            self.nickname = [self objectOrNilForKey:kTotal_ListNickname fromDictionary:dict];
            self.isExternalUrl = [[self objectOrNilForKey:kTotal_ListIsExternalUrl fromDictionary:dict] boolValue];
            self.subType = [[self objectOrNilForKey:kTotal_ListSubType fromDictionary:dict] doubleValue];
            self.realCategoryId = [[self objectOrNilForKey:kTotal_ListRealCategoryId fromDictionary:dict] doubleValue];
            self.score = [[self objectOrNilForKey:kTotal_ListScore fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kTotal_ListType fromDictionary:dict] doubleValue];
            self.contentType = [self objectOrNilForKey:kTotal_ListContentType fromDictionary:dict];
            self.displayDiscountedPrice = [self objectOrNilForKey:kTotal_ListDisplayDiscountedPrice fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kTotal_ListIntro fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kTotal_ListCoverLarge fromDictionary:dict];
            self.list = [self objectOrNilForKey:kTotal_ListList fromDictionary:dict];
            self.isFinished = [[self objectOrNilForKey:kTotal_ListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kTotal_ListTrackId fromDictionary:dict] doubleValue];
            self.specialId = [[self objectOrNilForKey:kTotal_ListSpecialId fromDictionary:dict] doubleValue];
            self.discountedPrice = [[self objectOrNilForKey:kTotal_ListDiscountedPrice fromDictionary:dict] doubleValue];
            self.serialState = [[self objectOrNilForKey:kTotal_ListSerialState fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kTotal_ListIsPaid fromDictionary:dict] boolValue];
            self.price = [[self objectOrNilForKey:kTotal_ListPrice fromDictionary:dict] doubleValue];
            self.isHot = [[self objectOrNilForKey:kTotal_ListIsHot fromDictionary:dict] boolValue];
            self.tagName = [self objectOrNilForKey:kTotal_ListTagName fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kTotal_ListTags fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kTotal_ListPriceTypeId fromDictionary:dict] doubleValue];
            self.footnote = [self objectOrNilForKey:kTotal_ListFootnote fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kTotal_ListCommentsCount fromDictionary:dict] doubleValue];
            self.keywordType = [[self objectOrNilForKey:kTotal_ListKeywordType fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kTotal_ListAlbumId fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kTotal_ListTracks fromDictionary:dict] doubleValue];
            self.moduleType = [[self objectOrNilForKey:kTotal_ListModuleType fromDictionary:dict] doubleValue];
            self.coverPathSmall = [self objectOrNilForKey:kTotal_ListCoverPathSmall fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kTotal_ListPic fromDictionary:dict];
            self.longTitle = [self objectOrNilForKey:kTotal_ListLongTitle fromDictionary:dict];
            self.calcDimension = [self objectOrNilForKey:kTotal_ListCalcDimension fromDictionary:dict];
            self.title = [self objectOrNilForKey:kTotal_ListTitle fromDictionary:dict];
            self.albumCoverUrl290 = [self objectOrNilForKey:kTotal_ListAlbumCoverUrl290 fromDictionary:dict];
            self.keywordName = [self objectOrNilForKey:kTotal_ListKeywordName fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kTotal_ListCoverSmall fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kTotal_ListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeEnum] forKey:kTotal_ListPriceTypeEnum];
    [mutableDict setValue:self.trackTitle forKey:kTotal_ListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasMore] forKey:kTotal_ListHasMore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kTotal_ListId];
    [mutableDict setValue:self.coverMiddle forKey:kTotal_ListCoverMiddle];
    [mutableDict setValue:self.coverPathBig forKey:kTotal_ListCoverPathBig];
    [mutableDict setValue:[NSNumber numberWithDouble:self.keywordId] forKey:kTotal_ListKeywordId];
    [mutableDict setValue:self.displayPrice forKey:kTotal_ListDisplayPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kTotal_ListCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.releasedAt] forKey:kTotal_ListReleasedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kTotal_ListPlaysCounts];
    [mutableDict setValue:self.subtitle forKey:kTotal_ListSubtitle];
    [mutableDict setValue:self.shortTitle forKey:kTotal_ListShortTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.isShare] forKey:kTotal_ListIsShare];
    [mutableDict setValue:self.nickname forKey:kTotal_ListNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isExternalUrl] forKey:kTotal_ListIsExternalUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subType] forKey:kTotal_ListSubType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.realCategoryId] forKey:kTotal_ListRealCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kTotal_ListScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kTotal_ListType];
    [mutableDict setValue:self.contentType forKey:kTotal_ListContentType];
    [mutableDict setValue:self.displayDiscountedPrice forKey:kTotal_ListDisplayDiscountedPrice];
    [mutableDict setValue:self.intro forKey:kTotal_ListIntro];
    [mutableDict setValue:self.coverLarge forKey:kTotal_ListCoverLarge];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kTotal_ListList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kTotal_ListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kTotal_ListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialId] forKey:kTotal_ListSpecialId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discountedPrice] forKey:kTotal_ListDiscountedPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kTotal_ListSerialState];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kTotal_ListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kTotal_ListPrice];
    [mutableDict setValue:[NSNumber numberWithBool:self.isHot] forKey:kTotal_ListIsHot];
    [mutableDict setValue:self.tagName forKey:kTotal_ListTagName];
    [mutableDict setValue:self.tags forKey:kTotal_ListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kTotal_ListPriceTypeId];
    [mutableDict setValue:self.footnote forKey:kTotal_ListFootnote];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kTotal_ListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.keywordType] forKey:kTotal_ListKeywordType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kTotal_ListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kTotal_ListTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.moduleType] forKey:kTotal_ListModuleType];
    [mutableDict setValue:self.coverPathSmall forKey:kTotal_ListCoverPathSmall];
    [mutableDict setValue:self.pic forKey:kTotal_ListPic];
    [mutableDict setValue:self.longTitle forKey:kTotal_ListLongTitle];
    [mutableDict setValue:self.calcDimension forKey:kTotal_ListCalcDimension];
    [mutableDict setValue:self.title forKey:kTotal_ListTitle];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kTotal_ListAlbumCoverUrl290];
    [mutableDict setValue:self.keywordName forKey:kTotal_ListKeywordName];
    [mutableDict setValue:self.coverSmall forKey:kTotal_ListCoverSmall];

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

    self.uid = [aDecoder decodeDoubleForKey:kTotal_ListUid];
    self.priceTypeEnum = [aDecoder decodeDoubleForKey:kTotal_ListPriceTypeEnum];
    self.trackTitle = [aDecoder decodeObjectForKey:kTotal_ListTrackTitle];
    self.hasMore = [aDecoder decodeBoolForKey:kTotal_ListHasMore];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kTotal_ListId];
    self.coverMiddle = [aDecoder decodeObjectForKey:kTotal_ListCoverMiddle];
    self.coverPathBig = [aDecoder decodeObjectForKey:kTotal_ListCoverPathBig];
    self.keywordId = [aDecoder decodeDoubleForKey:kTotal_ListKeywordId];
    self.displayPrice = [aDecoder decodeObjectForKey:kTotal_ListDisplayPrice];
    self.categoryId = [aDecoder decodeDoubleForKey:kTotal_ListCategoryId];
    self.releasedAt = [aDecoder decodeDoubleForKey:kTotal_ListReleasedAt];
    self.playsCounts = [aDecoder decodeDoubleForKey:kTotal_ListPlaysCounts];
    self.subtitle = [aDecoder decodeObjectForKey:kTotal_ListSubtitle];
    self.shortTitle = [aDecoder decodeObjectForKey:kTotal_ListShortTitle];
    self.isShare = [aDecoder decodeBoolForKey:kTotal_ListIsShare];
    self.nickname = [aDecoder decodeObjectForKey:kTotal_ListNickname];
    self.isExternalUrl = [aDecoder decodeBoolForKey:kTotal_ListIsExternalUrl];
    self.subType = [aDecoder decodeDoubleForKey:kTotal_ListSubType];
    self.realCategoryId = [aDecoder decodeDoubleForKey:kTotal_ListRealCategoryId];
    self.score = [aDecoder decodeDoubleForKey:kTotal_ListScore];
    self.type = [aDecoder decodeDoubleForKey:kTotal_ListType];
    self.contentType = [aDecoder decodeObjectForKey:kTotal_ListContentType];
    self.displayDiscountedPrice = [aDecoder decodeObjectForKey:kTotal_ListDisplayDiscountedPrice];
    self.intro = [aDecoder decodeObjectForKey:kTotal_ListIntro];
    self.coverLarge = [aDecoder decodeObjectForKey:kTotal_ListCoverLarge];
    self.list = [aDecoder decodeObjectForKey:kTotal_ListList];
    self.isFinished = [aDecoder decodeDoubleForKey:kTotal_ListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kTotal_ListTrackId];
    self.specialId = [aDecoder decodeDoubleForKey:kTotal_ListSpecialId];
    self.discountedPrice = [aDecoder decodeDoubleForKey:kTotal_ListDiscountedPrice];
    self.serialState = [aDecoder decodeDoubleForKey:kTotal_ListSerialState];
    self.isPaid = [aDecoder decodeBoolForKey:kTotal_ListIsPaid];
    self.price = [aDecoder decodeDoubleForKey:kTotal_ListPrice];
    self.isHot = [aDecoder decodeBoolForKey:kTotal_ListIsHot];
    self.tagName = [aDecoder decodeObjectForKey:kTotal_ListTagName];
    self.tags = [aDecoder decodeObjectForKey:kTotal_ListTags];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kTotal_ListPriceTypeId];
    self.footnote = [aDecoder decodeObjectForKey:kTotal_ListFootnote];
    self.commentsCount = [aDecoder decodeDoubleForKey:kTotal_ListCommentsCount];
    self.keywordType = [aDecoder decodeDoubleForKey:kTotal_ListKeywordType];
    self.albumId = [aDecoder decodeDoubleForKey:kTotal_ListAlbumId];
    self.tracks = [aDecoder decodeDoubleForKey:kTotal_ListTracks];
    self.moduleType = [aDecoder decodeDoubleForKey:kTotal_ListModuleType];
    self.coverPathSmall = [aDecoder decodeObjectForKey:kTotal_ListCoverPathSmall];
    self.pic = [aDecoder decodeObjectForKey:kTotal_ListPic];
    self.longTitle = [aDecoder decodeObjectForKey:kTotal_ListLongTitle];
    self.calcDimension = [aDecoder decodeObjectForKey:kTotal_ListCalcDimension];
    self.title = [aDecoder decodeObjectForKey:kTotal_ListTitle];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kTotal_ListAlbumCoverUrl290];
    self.keywordName = [aDecoder decodeObjectForKey:kTotal_ListKeywordName];
    self.coverSmall = [aDecoder decodeObjectForKey:kTotal_ListCoverSmall];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_uid forKey:kTotal_ListUid];
    [aCoder encodeDouble:_priceTypeEnum forKey:kTotal_ListPriceTypeEnum];
    [aCoder encodeObject:_trackTitle forKey:kTotal_ListTrackTitle];
    [aCoder encodeBool:_hasMore forKey:kTotal_ListHasMore];
    [aCoder encodeDouble:_listIdentifier forKey:kTotal_ListId];
    [aCoder encodeObject:_coverMiddle forKey:kTotal_ListCoverMiddle];
    [aCoder encodeObject:_coverPathBig forKey:kTotal_ListCoverPathBig];
    [aCoder encodeDouble:_keywordId forKey:kTotal_ListKeywordId];
    [aCoder encodeObject:_displayPrice forKey:kTotal_ListDisplayPrice];
    [aCoder encodeDouble:_categoryId forKey:kTotal_ListCategoryId];
    [aCoder encodeDouble:_releasedAt forKey:kTotal_ListReleasedAt];
    [aCoder encodeDouble:_playsCounts forKey:kTotal_ListPlaysCounts];
    [aCoder encodeObject:_subtitle forKey:kTotal_ListSubtitle];
    [aCoder encodeObject:_shortTitle forKey:kTotal_ListShortTitle];
    [aCoder encodeBool:_isShare forKey:kTotal_ListIsShare];
    [aCoder encodeObject:_nickname forKey:kTotal_ListNickname];
    [aCoder encodeBool:_isExternalUrl forKey:kTotal_ListIsExternalUrl];
    [aCoder encodeDouble:_subType forKey:kTotal_ListSubType];
    [aCoder encodeDouble:_realCategoryId forKey:kTotal_ListRealCategoryId];
    [aCoder encodeDouble:_score forKey:kTotal_ListScore];
    [aCoder encodeDouble:_type forKey:kTotal_ListType];
    [aCoder encodeObject:_contentType forKey:kTotal_ListContentType];
    [aCoder encodeObject:_displayDiscountedPrice forKey:kTotal_ListDisplayDiscountedPrice];
    [aCoder encodeObject:_intro forKey:kTotal_ListIntro];
    [aCoder encodeObject:_coverLarge forKey:kTotal_ListCoverLarge];
    [aCoder encodeObject:_list forKey:kTotal_ListList];
    [aCoder encodeDouble:_isFinished forKey:kTotal_ListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kTotal_ListTrackId];
    [aCoder encodeDouble:_specialId forKey:kTotal_ListSpecialId];
    [aCoder encodeDouble:_discountedPrice forKey:kTotal_ListDiscountedPrice];
    [aCoder encodeDouble:_serialState forKey:kTotal_ListSerialState];
    [aCoder encodeBool:_isPaid forKey:kTotal_ListIsPaid];
    [aCoder encodeDouble:_price forKey:kTotal_ListPrice];
    [aCoder encodeBool:_isHot forKey:kTotal_ListIsHot];
    [aCoder encodeObject:_tagName forKey:kTotal_ListTagName];
    [aCoder encodeObject:_tags forKey:kTotal_ListTags];
    [aCoder encodeDouble:_priceTypeId forKey:kTotal_ListPriceTypeId];
    [aCoder encodeObject:_footnote forKey:kTotal_ListFootnote];
    [aCoder encodeDouble:_commentsCount forKey:kTotal_ListCommentsCount];
    [aCoder encodeDouble:_keywordType forKey:kTotal_ListKeywordType];
    [aCoder encodeDouble:_albumId forKey:kTotal_ListAlbumId];
    [aCoder encodeDouble:_tracks forKey:kTotal_ListTracks];
    [aCoder encodeDouble:_moduleType forKey:kTotal_ListModuleType];
    [aCoder encodeObject:_coverPathSmall forKey:kTotal_ListCoverPathSmall];
    [aCoder encodeObject:_pic forKey:kTotal_ListPic];
    [aCoder encodeObject:_longTitle forKey:kTotal_ListLongTitle];
    [aCoder encodeObject:_calcDimension forKey:kTotal_ListCalcDimension];
    [aCoder encodeObject:_title forKey:kTotal_ListTitle];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kTotal_ListAlbumCoverUrl290];
    [aCoder encodeObject:_keywordName forKey:kTotal_ListKeywordName];
    [aCoder encodeObject:_coverSmall forKey:kTotal_ListCoverSmall];
}

- (id)copyWithZone:(NSZone *)zone
{
    Total_List *copy = [[Total_List alloc] init];
    
    if (copy) {

        copy.uid = self.uid;
        copy.priceTypeEnum = self.priceTypeEnum;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.hasMore = self.hasMore;
        copy.listIdentifier = self.listIdentifier;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.coverPathBig = [self.coverPathBig copyWithZone:zone];
        copy.keywordId = self.keywordId;
        copy.displayPrice = [self.displayPrice copyWithZone:zone];
        copy.categoryId = self.categoryId;
        copy.releasedAt = self.releasedAt;
        copy.playsCounts = self.playsCounts;
        copy.subtitle = [self.subtitle copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.isShare = self.isShare;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isExternalUrl = self.isExternalUrl;
        copy.subType = self.subType;
        copy.realCategoryId = self.realCategoryId;
        copy.score = self.score;
        copy.type = self.type;
        copy.contentType = [self.contentType copyWithZone:zone];
        copy.displayDiscountedPrice = [self.displayDiscountedPrice copyWithZone:zone];
        copy.intro = [self.intro copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.specialId = self.specialId;
        copy.discountedPrice = self.discountedPrice;
        copy.serialState = self.serialState;
        copy.isPaid = self.isPaid;
        copy.price = self.price;
        copy.isHot = self.isHot;
        copy.tagName = [self.tagName copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.footnote = [self.footnote copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.keywordType = self.keywordType;
        copy.albumId = self.albumId;
        copy.tracks = self.tracks;
        copy.moduleType = self.moduleType;
        copy.coverPathSmall = [self.coverPathSmall copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.longTitle = [self.longTitle copyWithZone:zone];
        copy.calcDimension = [self.calcDimension copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
        copy.keywordName = [self.keywordName copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
    }
    
    return copy;
}


@end
