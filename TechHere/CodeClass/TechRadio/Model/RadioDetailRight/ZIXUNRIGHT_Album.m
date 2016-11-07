//
//  ZIXUNRIGHT_Album.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_Album.h"


NSString *const kZIXUNRIGHT_AlbumStatus = @"status";
NSString *const kZIXUNRIGHT_AlbumTitle = @"title";
NSString *const kZIXUNRIGHT_AlbumTags = @"tags";
NSString *const kZIXUNRIGHT_AlbumSerialState = @"serialState";
NSString *const kZIXUNRIGHT_AlbumCategoryName = @"categoryName";
NSString *const kZIXUNRIGHT_AlbumCoverWebLarge = @"coverWebLarge";
NSString *const kZIXUNRIGHT_AlbumCoverMiddle = @"coverMiddle";
NSString *const kZIXUNRIGHT_AlbumHasNew = @"hasNew";
NSString *const kZIXUNRIGHT_AlbumIsPaid = @"isPaid";
NSString *const kZIXUNRIGHT_AlbumIntro = @"intro";
NSString *const kZIXUNRIGHT_AlbumNickname = @"nickname";
NSString *const kZIXUNRIGHT_AlbumIsVerified = @"isVerified";
NSString *const kZIXUNRIGHT_AlbumIsRecordDesc = @"isRecordDesc";
NSString *const kZIXUNRIGHT_AlbumShares = @"shares";
NSString *const kZIXUNRIGHT_AlbumAvatarPath = @"avatarPath";
NSString *const kZIXUNRIGHT_AlbumCreatedAt = @"createdAt";
NSString *const kZIXUNRIGHT_AlbumLastUptrackAt = @"lastUptrackAt";
NSString *const kZIXUNRIGHT_AlbumUpdatedAt = @"updatedAt";
NSString *const kZIXUNRIGHT_AlbumAlbumId = @"albumId";
NSString *const kZIXUNRIGHT_AlbumDetailCoverPath = @"detailCoverPath";
NSString *const kZIXUNRIGHT_AlbumCoverSmall = @"coverSmall";
NSString *const kZIXUNRIGHT_AlbumCoverLarge = @"coverLarge";
NSString *const kZIXUNRIGHT_AlbumCoverOrigin = @"coverOrigin";
NSString *const kZIXUNRIGHT_AlbumUid = @"uid";
NSString *const kZIXUNRIGHT_AlbumIntroRich = @"introRich";
NSString *const kZIXUNRIGHT_AlbumTracks = @"tracks";
NSString *const kZIXUNRIGHT_AlbumPlayTrackId = @"playTrackId";
NSString *const kZIXUNRIGHT_AlbumIsFavorite = @"isFavorite";
NSString *const kZIXUNRIGHT_AlbumCoverLargePop = @"coverLargePop";
NSString *const kZIXUNRIGHT_AlbumSerializeStatus = @"serializeStatus";
NSString *const kZIXUNRIGHT_AlbumCategoryId = @"categoryId";
NSString *const kZIXUNRIGHT_AlbumPlayTimes = @"playTimes";


@interface ZIXUNRIGHT_Album ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_Album

@synthesize status = _status;
@synthesize title = _title;
@synthesize tags = _tags;
@synthesize serialState = _serialState;
@synthesize categoryName = _categoryName;
@synthesize coverWebLarge = _coverWebLarge;
@synthesize coverMiddle = _coverMiddle;
@synthesize hasNew = _hasNew;
@synthesize isPaid = _isPaid;
@synthesize intro = _intro;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize isRecordDesc = _isRecordDesc;
@synthesize shares = _shares;
@synthesize avatarPath = _avatarPath;
@synthesize createdAt = _createdAt;
@synthesize lastUptrackAt = _lastUptrackAt;
@synthesize updatedAt = _updatedAt;
@synthesize albumId = _albumId;
@synthesize detailCoverPath = _detailCoverPath;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize coverOrigin = _coverOrigin;
@synthesize uid = _uid;
@synthesize introRich = _introRich;
@synthesize tracks = _tracks;
@synthesize playTrackId = _playTrackId;
@synthesize isFavorite = _isFavorite;
@synthesize coverLargePop = _coverLargePop;
@synthesize serializeStatus = _serializeStatus;
@synthesize categoryId = _categoryId;
@synthesize playTimes = _playTimes;


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
            self.status = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZIXUNRIGHT_AlbumTitle fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kZIXUNRIGHT_AlbumTags fromDictionary:dict];
            self.serialState = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumSerialState fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCategoryName fromDictionary:dict];
            self.coverWebLarge = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverWebLarge fromDictionary:dict];
            self.coverMiddle = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverMiddle fromDictionary:dict];
            self.hasNew = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumHasNew fromDictionary:dict] boolValue];
            self.isPaid = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumIsPaid fromDictionary:dict] boolValue];
            self.intro = [self objectOrNilForKey:kZIXUNRIGHT_AlbumIntro fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kZIXUNRIGHT_AlbumNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumIsVerified fromDictionary:dict] boolValue];
            self.isRecordDesc = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumIsRecordDesc fromDictionary:dict] boolValue];
            self.shares = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumShares fromDictionary:dict] doubleValue];
            self.avatarPath = [self objectOrNilForKey:kZIXUNRIGHT_AlbumAvatarPath fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumCreatedAt fromDictionary:dict] doubleValue];
            self.lastUptrackAt = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumLastUptrackAt fromDictionary:dict] doubleValue];
            self.updatedAt = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumUpdatedAt fromDictionary:dict] doubleValue];
            self.albumId = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumAlbumId fromDictionary:dict] doubleValue];
            self.detailCoverPath = [self objectOrNilForKey:kZIXUNRIGHT_AlbumDetailCoverPath fromDictionary:dict];
            self.coverSmall = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverLarge fromDictionary:dict];
            self.coverOrigin = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverOrigin fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumUid fromDictionary:dict] doubleValue];
            self.introRich = [self objectOrNilForKey:kZIXUNRIGHT_AlbumIntroRich fromDictionary:dict];
            self.tracks = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumTracks fromDictionary:dict] doubleValue];
            self.playTrackId = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumPlayTrackId fromDictionary:dict] doubleValue];
            self.isFavorite = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumIsFavorite fromDictionary:dict] boolValue];
            self.coverLargePop = [self objectOrNilForKey:kZIXUNRIGHT_AlbumCoverLargePop fromDictionary:dict];
            self.serializeStatus = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumSerializeStatus fromDictionary:dict] doubleValue];
            self.categoryId = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumCategoryId fromDictionary:dict] doubleValue];
            self.playTimes = [[self objectOrNilForKey:kZIXUNRIGHT_AlbumPlayTimes fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kZIXUNRIGHT_AlbumStatus];
    [mutableDict setValue:self.title forKey:kZIXUNRIGHT_AlbumTitle];
    [mutableDict setValue:self.tags forKey:kZIXUNRIGHT_AlbumTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serialState] forKey:kZIXUNRIGHT_AlbumSerialState];
    [mutableDict setValue:self.categoryName forKey:kZIXUNRIGHT_AlbumCategoryName];
    [mutableDict setValue:self.coverWebLarge forKey:kZIXUNRIGHT_AlbumCoverWebLarge];
    [mutableDict setValue:self.coverMiddle forKey:kZIXUNRIGHT_AlbumCoverMiddle];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNew] forKey:kZIXUNRIGHT_AlbumHasNew];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kZIXUNRIGHT_AlbumIsPaid];
    [mutableDict setValue:self.intro forKey:kZIXUNRIGHT_AlbumIntro];
    [mutableDict setValue:self.nickname forKey:kZIXUNRIGHT_AlbumNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kZIXUNRIGHT_AlbumIsVerified];
    [mutableDict setValue:[NSNumber numberWithBool:self.isRecordDesc] forKey:kZIXUNRIGHT_AlbumIsRecordDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kZIXUNRIGHT_AlbumShares];
    [mutableDict setValue:self.avatarPath forKey:kZIXUNRIGHT_AlbumAvatarPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kZIXUNRIGHT_AlbumCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastUptrackAt] forKey:kZIXUNRIGHT_AlbumLastUptrackAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedAt] forKey:kZIXUNRIGHT_AlbumUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kZIXUNRIGHT_AlbumAlbumId];
    [mutableDict setValue:self.detailCoverPath forKey:kZIXUNRIGHT_AlbumDetailCoverPath];
    [mutableDict setValue:self.coverSmall forKey:kZIXUNRIGHT_AlbumCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kZIXUNRIGHT_AlbumCoverLarge];
    [mutableDict setValue:self.coverOrigin forKey:kZIXUNRIGHT_AlbumCoverOrigin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNRIGHT_AlbumUid];
    [mutableDict setValue:self.introRich forKey:kZIXUNRIGHT_AlbumIntroRich];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kZIXUNRIGHT_AlbumTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTrackId] forKey:kZIXUNRIGHT_AlbumPlayTrackId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFavorite] forKey:kZIXUNRIGHT_AlbumIsFavorite];
    [mutableDict setValue:self.coverLargePop forKey:kZIXUNRIGHT_AlbumCoverLargePop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serializeStatus] forKey:kZIXUNRIGHT_AlbumSerializeStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryId] forKey:kZIXUNRIGHT_AlbumCategoryId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playTimes] forKey:kZIXUNRIGHT_AlbumPlayTimes];

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

    self.status = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumStatus];
    self.title = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumTitle];
    self.tags = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumTags];
    self.serialState = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumSerialState];
    self.categoryName = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCategoryName];
    self.coverWebLarge = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverWebLarge];
    self.coverMiddle = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverMiddle];
    self.hasNew = [aDecoder decodeBoolForKey:kZIXUNRIGHT_AlbumHasNew];
    self.isPaid = [aDecoder decodeBoolForKey:kZIXUNRIGHT_AlbumIsPaid];
    self.intro = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumIntro];
    self.nickname = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kZIXUNRIGHT_AlbumIsVerified];
    self.isRecordDesc = [aDecoder decodeBoolForKey:kZIXUNRIGHT_AlbumIsRecordDesc];
    self.shares = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumShares];
    self.avatarPath = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumAvatarPath];
    self.createdAt = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumCreatedAt];
    self.lastUptrackAt = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumLastUptrackAt];
    self.updatedAt = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumUpdatedAt];
    self.albumId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumAlbumId];
    self.detailCoverPath = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumDetailCoverPath];
    self.coverSmall = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverLarge];
    self.coverOrigin = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverOrigin];
    self.uid = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumUid];
    self.introRich = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumIntroRich];
    self.tracks = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumTracks];
    self.playTrackId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumPlayTrackId];
    self.isFavorite = [aDecoder decodeBoolForKey:kZIXUNRIGHT_AlbumIsFavorite];
    self.coverLargePop = [aDecoder decodeObjectForKey:kZIXUNRIGHT_AlbumCoverLargePop];
    self.serializeStatus = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumSerializeStatus];
    self.categoryId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumCategoryId];
    self.playTimes = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_AlbumPlayTimes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kZIXUNRIGHT_AlbumStatus];
    [aCoder encodeObject:_title forKey:kZIXUNRIGHT_AlbumTitle];
    [aCoder encodeObject:_tags forKey:kZIXUNRIGHT_AlbumTags];
    [aCoder encodeDouble:_serialState forKey:kZIXUNRIGHT_AlbumSerialState];
    [aCoder encodeObject:_categoryName forKey:kZIXUNRIGHT_AlbumCategoryName];
    [aCoder encodeObject:_coverWebLarge forKey:kZIXUNRIGHT_AlbumCoverWebLarge];
    [aCoder encodeObject:_coverMiddle forKey:kZIXUNRIGHT_AlbumCoverMiddle];
    [aCoder encodeBool:_hasNew forKey:kZIXUNRIGHT_AlbumHasNew];
    [aCoder encodeBool:_isPaid forKey:kZIXUNRIGHT_AlbumIsPaid];
    [aCoder encodeObject:_intro forKey:kZIXUNRIGHT_AlbumIntro];
    [aCoder encodeObject:_nickname forKey:kZIXUNRIGHT_AlbumNickname];
    [aCoder encodeBool:_isVerified forKey:kZIXUNRIGHT_AlbumIsVerified];
    [aCoder encodeBool:_isRecordDesc forKey:kZIXUNRIGHT_AlbumIsRecordDesc];
    [aCoder encodeDouble:_shares forKey:kZIXUNRIGHT_AlbumShares];
    [aCoder encodeObject:_avatarPath forKey:kZIXUNRIGHT_AlbumAvatarPath];
    [aCoder encodeDouble:_createdAt forKey:kZIXUNRIGHT_AlbumCreatedAt];
    [aCoder encodeDouble:_lastUptrackAt forKey:kZIXUNRIGHT_AlbumLastUptrackAt];
    [aCoder encodeDouble:_updatedAt forKey:kZIXUNRIGHT_AlbumUpdatedAt];
    [aCoder encodeDouble:_albumId forKey:kZIXUNRIGHT_AlbumAlbumId];
    [aCoder encodeObject:_detailCoverPath forKey:kZIXUNRIGHT_AlbumDetailCoverPath];
    [aCoder encodeObject:_coverSmall forKey:kZIXUNRIGHT_AlbumCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kZIXUNRIGHT_AlbumCoverLarge];
    [aCoder encodeObject:_coverOrigin forKey:kZIXUNRIGHT_AlbumCoverOrigin];
    [aCoder encodeDouble:_uid forKey:kZIXUNRIGHT_AlbumUid];
    [aCoder encodeObject:_introRich forKey:kZIXUNRIGHT_AlbumIntroRich];
    [aCoder encodeDouble:_tracks forKey:kZIXUNRIGHT_AlbumTracks];
    [aCoder encodeDouble:_playTrackId forKey:kZIXUNRIGHT_AlbumPlayTrackId];
    [aCoder encodeBool:_isFavorite forKey:kZIXUNRIGHT_AlbumIsFavorite];
    [aCoder encodeObject:_coverLargePop forKey:kZIXUNRIGHT_AlbumCoverLargePop];
    [aCoder encodeDouble:_serializeStatus forKey:kZIXUNRIGHT_AlbumSerializeStatus];
    [aCoder encodeDouble:_categoryId forKey:kZIXUNRIGHT_AlbumCategoryId];
    [aCoder encodeDouble:_playTimes forKey:kZIXUNRIGHT_AlbumPlayTimes];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_Album *copy = [[ZIXUNRIGHT_Album alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.serialState = self.serialState;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.coverWebLarge = [self.coverWebLarge copyWithZone:zone];
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.hasNew = self.hasNew;
        copy.isPaid = self.isPaid;
        copy.intro = [self.intro copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.isRecordDesc = self.isRecordDesc;
        copy.shares = self.shares;
        copy.avatarPath = [self.avatarPath copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.lastUptrackAt = self.lastUptrackAt;
        copy.updatedAt = self.updatedAt;
        copy.albumId = self.albumId;
        copy.detailCoverPath = [self.detailCoverPath copyWithZone:zone];
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.coverOrigin = [self.coverOrigin copyWithZone:zone];
        copy.uid = self.uid;
        copy.introRich = [self.introRich copyWithZone:zone];
        copy.tracks = self.tracks;
        copy.playTrackId = self.playTrackId;
        copy.isFavorite = self.isFavorite;
        copy.coverLargePop = [self.coverLargePop copyWithZone:zone];
        copy.serializeStatus = self.serializeStatus;
        copy.categoryId = self.categoryId;
        copy.playTimes = self.playTimes;
    }
    
    return copy;
}


@end
