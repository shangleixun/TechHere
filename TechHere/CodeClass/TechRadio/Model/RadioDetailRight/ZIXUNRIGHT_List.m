//
//  ZIXUNRIGHT_List.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_List.h"


NSString *const kZIXUNRIGHT_ListStatus = @"status";
NSString *const kZIXUNRIGHT_ListTitle = @"title";
NSString *const kZIXUNRIGHT_ListLikes = @"likes";
NSString *const kZIXUNRIGHT_ListUserSource = @"userSource";
NSString *const kZIXUNRIGHT_ListDuration = @"duration";
NSString *const kZIXUNRIGHT_ListNickname = @"nickname";
NSString *const kZIXUNRIGHT_ListProcessState = @"processState";
NSString *const kZIXUNRIGHT_ListCoverMiddle = @"coverMiddle";
NSString *const kZIXUNRIGHT_ListPlayPathHq = @"playPathHq";
NSString *const kZIXUNRIGHT_ListShares = @"shares";
NSString *const kZIXUNRIGHT_ListIsPaid = @"isPaid";
NSString *const kZIXUNRIGHT_ListPlayPathAacv224 = @"playPathAacv224";
NSString *const kZIXUNRIGHT_ListCreatedAt = @"createdAt";
NSString *const kZIXUNRIGHT_ListSmallLogo = @"smallLogo";
NSString *const kZIXUNRIGHT_ListAlbumId = @"albumId";
NSString *const kZIXUNRIGHT_ListPlaytimes = @"playtimes";
NSString *const kZIXUNRIGHT_ListPlayUrl64 = @"playUrl64";
NSString *const kZIXUNRIGHT_ListPlayPathAacv164 = @"playPathAacv164";
NSString *const kZIXUNRIGHT_ListPlayUrl32 = @"playUrl32";
NSString *const kZIXUNRIGHT_ListUid = @"uid";
NSString *const kZIXUNRIGHT_ListCoverSmall = @"coverSmall";
NSString *const kZIXUNRIGHT_ListCoverLarge = @"coverLarge";
NSString *const kZIXUNRIGHT_ListComments = @"comments";
NSString *const kZIXUNRIGHT_ListTrackId = @"trackId";
NSString *const kZIXUNRIGHT_ListOpType = @"opType";
NSString *const kZIXUNRIGHT_ListIsPublic = @"isPublic";


@interface ZIXUNRIGHT_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_List

@synthesize status = _status;
@synthesize title = _title;
@synthesize likes = _likes;
@synthesize userSource = _userSource;
@synthesize duration = _duration;
@synthesize nickname = _nickname;
@synthesize processState = _processState;
@synthesize coverMiddle = _coverMiddle;
@synthesize playPathHq = _playPathHq;
@synthesize shares = _shares;
@synthesize isPaid = _isPaid;
@synthesize playPathAacv224 = _playPathAacv224;
@synthesize createdAt = _createdAt;
@synthesize smallLogo = _smallLogo;
@synthesize albumId = _albumId;
@synthesize playtimes = _playtimes;
@synthesize playUrl64 = _playUrl64;
@synthesize playPathAacv164 = _playPathAacv164;
@synthesize playUrl32 = _playUrl32;
@synthesize uid = _uid;
@synthesize coverSmall = _coverSmall;
@synthesize coverLarge = _coverLarge;
@synthesize comments = _comments;
@synthesize trackId = _trackId;
@synthesize opType = _opType;
@synthesize isPublic = _isPublic;


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
            self.status = [[self objectOrNilForKey:kZIXUNRIGHT_ListStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZIXUNRIGHT_ListTitle fromDictionary:dict];
            self.likes = [[self objectOrNilForKey:kZIXUNRIGHT_ListLikes fromDictionary:dict] doubleValue];
            self.userSource = [[self objectOrNilForKey:kZIXUNRIGHT_ListUserSource fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kZIXUNRIGHT_ListDuration fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZIXUNRIGHT_ListNickname fromDictionary:dict];
            self.processState = [[self objectOrNilForKey:kZIXUNRIGHT_ListProcessState fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kZIXUNRIGHT_ListCoverMiddle fromDictionary:dict];
            self.playPathHq = [self objectOrNilForKey:kZIXUNRIGHT_ListPlayPathHq fromDictionary:dict];
            self.shares = [[self objectOrNilForKey:kZIXUNRIGHT_ListShares fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kZIXUNRIGHT_ListIsPaid fromDictionary:dict] boolValue];
            self.playPathAacv224 = [self objectOrNilForKey:kZIXUNRIGHT_ListPlayPathAacv224 fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kZIXUNRIGHT_ListCreatedAt fromDictionary:dict] doubleValue];
            self.smallLogo = [self objectOrNilForKey:kZIXUNRIGHT_ListSmallLogo fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kZIXUNRIGHT_ListAlbumId fromDictionary:dict] doubleValue];
            self.playtimes = [[self objectOrNilForKey:kZIXUNRIGHT_ListPlaytimes fromDictionary:dict] doubleValue];
            self.playUrl64 = [self objectOrNilForKey:kZIXUNRIGHT_ListPlayUrl64 fromDictionary:dict];
            self.playPathAacv164 = [self objectOrNilForKey:kZIXUNRIGHT_ListPlayPathAacv164 fromDictionary:dict];
            self.playUrl32 = [self objectOrNilForKey:kZIXUNRIGHT_ListPlayUrl32 fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZIXUNRIGHT_ListUid fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kZIXUNRIGHT_ListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kZIXUNRIGHT_ListCoverLarge fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kZIXUNRIGHT_ListComments fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kZIXUNRIGHT_ListTrackId fromDictionary:dict] doubleValue];
            self.opType = [[self objectOrNilForKey:kZIXUNRIGHT_ListOpType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kZIXUNRIGHT_ListIsPublic fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kZIXUNRIGHT_ListStatus];
    [mutableDict setValue:self.title forKey:kZIXUNRIGHT_ListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kZIXUNRIGHT_ListLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userSource] forKey:kZIXUNRIGHT_ListUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kZIXUNRIGHT_ListDuration];
    [mutableDict setValue:self.nickname forKey:kZIXUNRIGHT_ListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.processState] forKey:kZIXUNRIGHT_ListProcessState];
    [mutableDict setValue:self.coverMiddle forKey:kZIXUNRIGHT_ListCoverMiddle];
    [mutableDict setValue:self.playPathHq forKey:kZIXUNRIGHT_ListPlayPathHq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kZIXUNRIGHT_ListShares];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kZIXUNRIGHT_ListIsPaid];
    [mutableDict setValue:self.playPathAacv224 forKey:kZIXUNRIGHT_ListPlayPathAacv224];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kZIXUNRIGHT_ListCreatedAt];
    [mutableDict setValue:self.smallLogo forKey:kZIXUNRIGHT_ListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kZIXUNRIGHT_ListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playtimes] forKey:kZIXUNRIGHT_ListPlaytimes];
    [mutableDict setValue:self.playUrl64 forKey:kZIXUNRIGHT_ListPlayUrl64];
    [mutableDict setValue:self.playPathAacv164 forKey:kZIXUNRIGHT_ListPlayPathAacv164];
    [mutableDict setValue:self.playUrl32 forKey:kZIXUNRIGHT_ListPlayUrl32];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNRIGHT_ListUid];
    [mutableDict setValue:self.coverSmall forKey:kZIXUNRIGHT_ListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kZIXUNRIGHT_ListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kZIXUNRIGHT_ListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kZIXUNRIGHT_ListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opType] forKey:kZIXUNRIGHT_ListOpType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kZIXUNRIGHT_ListIsPublic];

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

    self.status = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListStatus];
    self.title = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListTitle];
    self.likes = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListLikes];
    self.userSource = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListUserSource];
    self.duration = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListDuration];
    self.nickname = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListNickname];
    self.processState = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListProcessState];
    self.coverMiddle = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListCoverMiddle];
    self.playPathHq = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListPlayPathHq];
    self.shares = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListShares];
    self.isPaid = [aDecoder decodeBoolForKey:kZIXUNRIGHT_ListIsPaid];
    self.playPathAacv224 = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListPlayPathAacv224];
    self.createdAt = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListCreatedAt];
    self.smallLogo = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListSmallLogo];
    self.albumId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListAlbumId];
    self.playtimes = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListPlaytimes];
    self.playUrl64 = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListPlayUrl64];
    self.playPathAacv164 = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListPlayPathAacv164];
    self.playUrl32 = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListPlayUrl32];
    self.uid = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListUid];
    self.coverSmall = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kZIXUNRIGHT_ListCoverLarge];
    self.comments = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListComments];
    self.trackId = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListTrackId];
    self.opType = [aDecoder decodeDoubleForKey:kZIXUNRIGHT_ListOpType];
    self.isPublic = [aDecoder decodeBoolForKey:kZIXUNRIGHT_ListIsPublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kZIXUNRIGHT_ListStatus];
    [aCoder encodeObject:_title forKey:kZIXUNRIGHT_ListTitle];
    [aCoder encodeDouble:_likes forKey:kZIXUNRIGHT_ListLikes];
    [aCoder encodeDouble:_userSource forKey:kZIXUNRIGHT_ListUserSource];
    [aCoder encodeDouble:_duration forKey:kZIXUNRIGHT_ListDuration];
    [aCoder encodeObject:_nickname forKey:kZIXUNRIGHT_ListNickname];
    [aCoder encodeDouble:_processState forKey:kZIXUNRIGHT_ListProcessState];
    [aCoder encodeObject:_coverMiddle forKey:kZIXUNRIGHT_ListCoverMiddle];
    [aCoder encodeObject:_playPathHq forKey:kZIXUNRIGHT_ListPlayPathHq];
    [aCoder encodeDouble:_shares forKey:kZIXUNRIGHT_ListShares];
    [aCoder encodeBool:_isPaid forKey:kZIXUNRIGHT_ListIsPaid];
    [aCoder encodeObject:_playPathAacv224 forKey:kZIXUNRIGHT_ListPlayPathAacv224];
    [aCoder encodeDouble:_createdAt forKey:kZIXUNRIGHT_ListCreatedAt];
    [aCoder encodeObject:_smallLogo forKey:kZIXUNRIGHT_ListSmallLogo];
    [aCoder encodeDouble:_albumId forKey:kZIXUNRIGHT_ListAlbumId];
    [aCoder encodeDouble:_playtimes forKey:kZIXUNRIGHT_ListPlaytimes];
    [aCoder encodeObject:_playUrl64 forKey:kZIXUNRIGHT_ListPlayUrl64];
    [aCoder encodeObject:_playPathAacv164 forKey:kZIXUNRIGHT_ListPlayPathAacv164];
    [aCoder encodeObject:_playUrl32 forKey:kZIXUNRIGHT_ListPlayUrl32];
    [aCoder encodeDouble:_uid forKey:kZIXUNRIGHT_ListUid];
    [aCoder encodeObject:_coverSmall forKey:kZIXUNRIGHT_ListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kZIXUNRIGHT_ListCoverLarge];
    [aCoder encodeDouble:_comments forKey:kZIXUNRIGHT_ListComments];
    [aCoder encodeDouble:_trackId forKey:kZIXUNRIGHT_ListTrackId];
    [aCoder encodeDouble:_opType forKey:kZIXUNRIGHT_ListOpType];
    [aCoder encodeBool:_isPublic forKey:kZIXUNRIGHT_ListIsPublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_List *copy = [[ZIXUNRIGHT_List alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.title = [self.title copyWithZone:zone];
        copy.likes = self.likes;
        copy.userSource = self.userSource;
        copy.duration = self.duration;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.processState = self.processState;
        copy.coverMiddle = [self.coverMiddle copyWithZone:zone];
        copy.playPathHq = [self.playPathHq copyWithZone:zone];
        copy.shares = self.shares;
        copy.isPaid = self.isPaid;
        copy.playPathAacv224 = [self.playPathAacv224 copyWithZone:zone];
        copy.createdAt = self.createdAt;
        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.albumId = self.albumId;
        copy.playtimes = self.playtimes;
        copy.playUrl64 = [self.playUrl64 copyWithZone:zone];
        copy.playPathAacv164 = [self.playPathAacv164 copyWithZone:zone];
        copy.playUrl32 = [self.playUrl32 copyWithZone:zone];
        copy.uid = self.uid;
        copy.coverSmall = [self.coverSmall copyWithZone:zone];
        copy.coverLarge = [self.coverLarge copyWithZone:zone];
        copy.comments = self.comments;
        copy.trackId = self.trackId;
        copy.opType = self.opType;
        copy.isPublic = self.isPublic;
    }
    
    return copy;
}


@end
