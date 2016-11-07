//
//  RadioList_List.m
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RadioList_List.h"


NSString *const kRadioList_ListTitle = @"title";
NSString *const kRadioList_ListTags = @"tags";
NSString *const kRadioList_ListSerialState = @"serialState";
NSString *const kRadioList_ListNickname = @"nickname";
NSString *const kRadioList_ListCoverMiddle = @"coverMiddle";
NSString *const kRadioList_ListPlaysCounts = @"playsCounts";
NSString *const kRadioList_ListIntro = @"intro";
NSString *const kRadioList_ListIsPaid = @"isPaid";
NSString *const kRadioList_ListCommentsCount = @"commentsCount";
NSString *const kRadioList_ListAlbumId = @"albumId";
NSString *const kRadioList_ListId = @"id";
NSString *const kRadioList_ListCoverSmall = @"coverSmall";
NSString *const kRadioList_ListCoverLarge = @"coverLarge";
NSString *const kRadioList_ListUid = @"uid";
NSString *const kRadioList_ListTracks = @"tracks";
NSString *const kRadioList_ListTrackTitle = @"trackTitle";
NSString *const kRadioList_ListPriceTypeId = @"priceTypeId";
NSString *const kRadioList_ListIsFinished = @"isFinished";
NSString *const kRadioList_ListTrackId = @"trackId";
NSString *const kRadioList_ListAlbumCoverUrl290 = @"albumCoverUrl290";


@interface RadioList_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RadioList_List

@synthesize title = _title;
@synthesize tags = _tags;
@synthesize serialState = _serialState;
@synthesize nickname = _nickname;
@synthesize coverMiddle = _coverMiddle;
@synthesize playsCounts = _playsCounts;
@synthesize intro = _intro;
@synthesize isPaid = _isPaid;
@synthesize commentsCount = _commentsCount;
@synthesize albumId = _albumId;
@synthesize listIdentifier = _listIdentifier;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize uid = _uid;
@synthesize tracks = _tracks;
@synthesize trackTitle = _trackTitle;
@synthesize priceTypeId = _priceTypeId;
@synthesize isFinished = _isFinished;
@synthesize trackId = _trackId;
@synthesize albumCoverUrl290 = _albumCoverUrl290;


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
            self.title = [self objectOrNilForKey:kRadioList_ListTitle fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kRadioList_ListTags fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kRadioList_ListSerialState fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kRadioList_ListNickname fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kRadioList_ListCoverMiddle fromDictionary:dict];
            self.playsCounts = [[self objectOrNilForKey:kRadioList_ListPlaysCounts fromDictionary:dict] doubleValue];
            self.intro = [self objectOrNilForKey:kRadioList_ListIntro fromDictionary:dict];
            self.isPaid = [[self objectOrNilForKey:kRadioList_ListIsPaid fromDictionary:dict] boolValue];
            self.commentsCount = [[self objectOrNilForKey:kRadioList_ListCommentsCount fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kRadioList_ListAlbumId fromDictionary:dict] doubleValue];
            self.listIdentifier = [[self objectOrNilForKey:kRadioList_ListId fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kRadioList_ListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kRadioList_ListCoverLarge fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kRadioList_ListUid fromDictionary:dict] doubleValue];
            self.tracks = [[self objectOrNilForKey:kRadioList_ListTracks fromDictionary:dict] doubleValue];
            self.trackTitle = [self objectOrNilForKey:kRadioList_ListTrackTitle fromDictionary:dict];
            self.priceTypeId = [[self objectOrNilForKey:kRadioList_ListPriceTypeId fromDictionary:dict] doubleValue];
            self.isFinished = [[self objectOrNilForKey:kRadioList_ListIsFinished fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kRadioList_ListTrackId fromDictionary:dict] doubleValue];
            self.albumCoverUrl290 = [self objectOrNilForKey:kRadioList_ListAlbumCoverUrl290 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kRadioList_ListTitle];
    [mutableDict setValue:self.tags forKey:kRadioList_ListTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kRadioList_ListSerialState];
    [mutableDict setValue:self.nickname forKey:kRadioList_ListNickname];
    [mutableDict setValue:self.coverMiddle forKey:kRadioList_ListCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playsCounts] forKey:kRadioList_ListPlaysCounts];
    [mutableDict setValue:self.intro forKey:kRadioList_ListIntro];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kRadioList_ListIsPaid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kRadioList_ListCommentsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kRadioList_ListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kRadioList_ListId];
    [mutableDict setValue:self.coverSmall forKey:kRadioList_ListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kRadioList_ListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kRadioList_ListUid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kRadioList_ListTracks];
    [mutableDict setValue:self.trackTitle forKey:kRadioList_ListTrackTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.priceTypeId] forKey:kRadioList_ListPriceTypeId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinished] forKey:kRadioList_ListIsFinished];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kRadioList_ListTrackId];
    [mutableDict setValue:self.albumCoverUrl290 forKey:kRadioList_ListAlbumCoverUrl290];

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

    self.title = [aDecoder decodeObjectForKey:kRadioList_ListTitle];
    self.tags = [aDecoder decodeObjectForKey:kRadioList_ListTags];
    self.serialState = [aDecoder decodeDoubleForKey:kRadioList_ListSerialState];
    self.nickname = [aDecoder decodeObjectForKey:kRadioList_ListNickname];
    self.coverMiddle = [aDecoder decodeObjectForKey:kRadioList_ListCoverMiddle];
    self.playsCounts = [aDecoder decodeDoubleForKey:kRadioList_ListPlaysCounts];
    self.intro = [aDecoder decodeObjectForKey:kRadioList_ListIntro];
    self.isPaid = [aDecoder decodeBoolForKey:kRadioList_ListIsPaid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kRadioList_ListCommentsCount];
    self.albumId = [aDecoder decodeDoubleForKey:kRadioList_ListAlbumId];
    self.listIdentifier = [aDecoder decodeDoubleForKey:kRadioList_ListId];
    self.coverSmall = [aDecoder decodeObjectForKey:kRadioList_ListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kRadioList_ListCoverLarge];
    self.uid = [aDecoder decodeDoubleForKey:kRadioList_ListUid];
    self.tracks = [aDecoder decodeDoubleForKey:kRadioList_ListTracks];
    self.trackTitle = [aDecoder decodeObjectForKey:kRadioList_ListTrackTitle];
    self.priceTypeId = [aDecoder decodeDoubleForKey:kRadioList_ListPriceTypeId];
    self.isFinished = [aDecoder decodeDoubleForKey:kRadioList_ListIsFinished];
    self.trackId = [aDecoder decodeDoubleForKey:kRadioList_ListTrackId];
    self.albumCoverUrl290 = [aDecoder decodeObjectForKey:kRadioList_ListAlbumCoverUrl290];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kRadioList_ListTitle];
    [aCoder encodeObject:_tags forKey:kRadioList_ListTags];
    [aCoder encodeDouble:_serialState forKey:kRadioList_ListSerialState];
    [aCoder encodeObject:_nickname forKey:kRadioList_ListNickname];
    [aCoder encodeObject:_coverMiddle forKey:kRadioList_ListCoverMiddle];
    [aCoder encodeDouble:_playsCounts forKey:kRadioList_ListPlaysCounts];
    [aCoder encodeObject:_intro forKey:kRadioList_ListIntro];
    [aCoder encodeBool:_isPaid forKey:kRadioList_ListIsPaid];
    [aCoder encodeDouble:_commentsCount forKey:kRadioList_ListCommentsCount];
    [aCoder encodeDouble:_albumId forKey:kRadioList_ListAlbumId];
    [aCoder encodeDouble:_listIdentifier forKey:kRadioList_ListId];
    [aCoder encodeObject:_coverSmall forKey:kRadioList_ListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kRadioList_ListCoverLarge];
    [aCoder encodeDouble:_uid forKey:kRadioList_ListUid];
    [aCoder encodeDouble:_tracks forKey:kRadioList_ListTracks];
    [aCoder encodeObject:_trackTitle forKey:kRadioList_ListTrackTitle];
    [aCoder encodeDouble:_priceTypeId forKey:kRadioList_ListPriceTypeId];
    [aCoder encodeDouble:_isFinished forKey:kRadioList_ListIsFinished];
    [aCoder encodeDouble:_trackId forKey:kRadioList_ListTrackId];
    [aCoder encodeObject:_albumCoverUrl290 forKey:kRadioList_ListAlbumCoverUrl290];
}

- (id)copyWithZone:(NSZone *)zone
{
    RadioList_List *copy = [[RadioList_List alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playsCounts = self.playsCounts;
        copy.intro = [self.intro copyWithZone:zone];
        copy.isPaid = self.isPaid;
        copy.commentsCount = self.commentsCount;
        copy.albumId = self.albumId;
        copy.listIdentifier = self.listIdentifier;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.uid = self.uid;
        copy.tracks = self.tracks;
        copy.trackTitle = [self.trackTitle copyWithZone:zone];
        copy.priceTypeId = self.priceTypeId;
        copy.isFinished = self.isFinished;
        copy.trackId = self.trackId;
        copy.albumCoverUrl290 = [self.albumCoverUrl290 copyWithZone:zone];
    }
    
    return copy;
}


@end
