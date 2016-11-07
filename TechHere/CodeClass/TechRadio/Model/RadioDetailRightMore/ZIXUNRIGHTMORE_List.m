//
//  ZIXUNRIGHTMORE_List.m
//
//  Created by 雷勋 尚 on 2016/10/10
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHTMORE_List.h"


NSString *const kZIXUNRIGHTMORE_ListStatus = @"status";
NSString *const kZIXUNRIGHTMORE_ListTitle = @"title";
NSString *const kZIXUNRIGHTMORE_ListLikes = @"likes";
NSString *const kZIXUNRIGHTMORE_ListUserSource = @"userSource";
NSString *const kZIXUNRIGHTMORE_ListDuration = @"duration";
NSString *const kZIXUNRIGHTMORE_ListNickname = @"nickname";
NSString *const kZIXUNRIGHTMORE_ListProcessState = @"processState";
NSString *const kZIXUNRIGHTMORE_ListCoverMiddle = @"coverMiddle";
NSString *const kZIXUNRIGHTMORE_ListPlayPathHq = @"playPathHq";
NSString *const kZIXUNRIGHTMORE_ListShares = @"shares";
NSString *const kZIXUNRIGHTMORE_ListIsPaid = @"isPaid";
NSString *const kZIXUNRIGHTMORE_ListPlayPathAacv224 = @"playPathAacv224";
NSString *const kZIXUNRIGHTMORE_ListCreatedAt = @"createdAt";
NSString *const kZIXUNRIGHTMORE_ListSmallLogo = @"smallLogo";
NSString *const kZIXUNRIGHTMORE_ListAlbumId = @"albumId";
NSString *const kZIXUNRIGHTMORE_ListPlaytimes = @"playtimes";
NSString *const kZIXUNRIGHTMORE_ListPlayUrl64 = @"playUrl64";
NSString *const kZIXUNRIGHTMORE_ListPlayPathAacv164 = @"playPathAacv164";
NSString *const kZIXUNRIGHTMORE_ListPlayUrl32 = @"playUrl32";
NSString *const kZIXUNRIGHTMORE_ListUid = @"uid";
NSString *const kZIXUNRIGHTMORE_ListCoverSmall = @"coverSmall";
NSString *const kZIXUNRIGHTMORE_ListCoverLarge = @"coverLarge";
NSString *const kZIXUNRIGHTMORE_ListComments = @"comments";
NSString *const kZIXUNRIGHTMORE_ListTrackId = @"trackId";
NSString *const kZIXUNRIGHTMORE_ListOpType = @"opType";
NSString *const kZIXUNRIGHTMORE_ListIsPublic = @"isPublic";


@interface ZIXUNRIGHTMORE_List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHTMORE_List

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
            self.status = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListStatus fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListTitle fromDictionary:dict];
            self.likes = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListLikes fromDictionary:dict] doubleValue];
            self.userSource = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListUserSource fromDictionary:dict] doubleValue];
            self.duration = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListDuration fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListNickname fromDictionary:dict];
            self.processState = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListProcessState fromDictionary:dict] doubleValue];
            self.coverMiddle = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListCoverMiddle fromDictionary:dict];
            self.playPathHq = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlayPathHq fromDictionary:dict];
            self.shares = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListShares fromDictionary:dict] doubleValue];
            self.isPaid = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListIsPaid fromDictionary:dict] boolValue];
            self.playPathAacv224 = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlayPathAacv224 fromDictionary:dict];
            self.createdAt = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListCreatedAt fromDictionary:dict] doubleValue];
            self.smallLogo = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListSmallLogo fromDictionary:dict];
            self.albumId = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListAlbumId fromDictionary:dict] doubleValue];
            self.playtimes = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlaytimes fromDictionary:dict] doubleValue];
            self.playUrl64 = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlayUrl64 fromDictionary:dict];
            self.playPathAacv164 = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlayPathAacv164 fromDictionary:dict];
            self.playUrl32 = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListPlayUrl32 fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListUid fromDictionary:dict] doubleValue];
            self.coverSmall = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListCoverSmall fromDictionary:dict];
            self.coverLarge = [self objectOrNilForKey:kZIXUNRIGHTMORE_ListCoverLarge fromDictionary:dict];
            self.comments = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListComments fromDictionary:dict] doubleValue];
            self.trackId = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListTrackId fromDictionary:dict] doubleValue];
            self.opType = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListOpType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kZIXUNRIGHTMORE_ListIsPublic fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kZIXUNRIGHTMORE_ListStatus];
    [mutableDict setValue:self.title forKey:kZIXUNRIGHTMORE_ListTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likes] forKey:kZIXUNRIGHTMORE_ListLikes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userSource] forKey:kZIXUNRIGHTMORE_ListUserSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.duration] forKey:kZIXUNRIGHTMORE_ListDuration];
    [mutableDict setValue:self.nickname forKey:kZIXUNRIGHTMORE_ListNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.processState] forKey:kZIXUNRIGHTMORE_ListProcessState];
    [mutableDict setValue:self.coverMiddle forKey:kZIXUNRIGHTMORE_ListCoverMiddle];
    [mutableDict setValue:self.playPathHq forKey:kZIXUNRIGHTMORE_ListPlayPathHq];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shares] forKey:kZIXUNRIGHTMORE_ListShares];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPaid] forKey:kZIXUNRIGHTMORE_ListIsPaid];
    [mutableDict setValue:self.playPathAacv224 forKey:kZIXUNRIGHTMORE_ListPlayPathAacv224];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdAt] forKey:kZIXUNRIGHTMORE_ListCreatedAt];
    [mutableDict setValue:self.smallLogo forKey:kZIXUNRIGHTMORE_ListSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albumId] forKey:kZIXUNRIGHTMORE_ListAlbumId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.playtimes] forKey:kZIXUNRIGHTMORE_ListPlaytimes];
    [mutableDict setValue:self.playUrl64 forKey:kZIXUNRIGHTMORE_ListPlayUrl64];
    [mutableDict setValue:self.playPathAacv164 forKey:kZIXUNRIGHTMORE_ListPlayPathAacv164];
    [mutableDict setValue:self.playUrl32 forKey:kZIXUNRIGHTMORE_ListPlayUrl32];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNRIGHTMORE_ListUid];
    [mutableDict setValue:self.coverSmall forKey:kZIXUNRIGHTMORE_ListCoverSmall];
    [mutableDict setValue:self.coverLarge forKey:kZIXUNRIGHTMORE_ListCoverLarge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.comments] forKey:kZIXUNRIGHTMORE_ListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.trackId] forKey:kZIXUNRIGHTMORE_ListTrackId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opType] forKey:kZIXUNRIGHTMORE_ListOpType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kZIXUNRIGHTMORE_ListIsPublic];

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

    self.status = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListStatus];
    self.title = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListTitle];
    self.likes = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListLikes];
    self.userSource = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListUserSource];
    self.duration = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListDuration];
    self.nickname = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListNickname];
    self.processState = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListProcessState];
    self.coverMiddle = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListCoverMiddle];
    self.playPathHq = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListPlayPathHq];
    self.shares = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListShares];
    self.isPaid = [aDecoder decodeBoolForKey:kZIXUNRIGHTMORE_ListIsPaid];
    self.playPathAacv224 = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListPlayPathAacv224];
    self.createdAt = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListCreatedAt];
    self.smallLogo = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListSmallLogo];
    self.albumId = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListAlbumId];
    self.playtimes = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListPlaytimes];
    self.playUrl64 = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListPlayUrl64];
    self.playPathAacv164 = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListPlayPathAacv164];
    self.playUrl32 = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListPlayUrl32];
    self.uid = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListUid];
    self.coverSmall = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListCoverSmall];
    self.coverLarge = [aDecoder decodeObjectForKey:kZIXUNRIGHTMORE_ListCoverLarge];
    self.comments = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListComments];
    self.trackId = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListTrackId];
    self.opType = [aDecoder decodeDoubleForKey:kZIXUNRIGHTMORE_ListOpType];
    self.isPublic = [aDecoder decodeBoolForKey:kZIXUNRIGHTMORE_ListIsPublic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kZIXUNRIGHTMORE_ListStatus];
    [aCoder encodeObject:_title forKey:kZIXUNRIGHTMORE_ListTitle];
    [aCoder encodeDouble:_likes forKey:kZIXUNRIGHTMORE_ListLikes];
    [aCoder encodeDouble:_userSource forKey:kZIXUNRIGHTMORE_ListUserSource];
    [aCoder encodeDouble:_duration forKey:kZIXUNRIGHTMORE_ListDuration];
    [aCoder encodeObject:_nickname forKey:kZIXUNRIGHTMORE_ListNickname];
    [aCoder encodeDouble:_processState forKey:kZIXUNRIGHTMORE_ListProcessState];
    [aCoder encodeObject:_coverMiddle forKey:kZIXUNRIGHTMORE_ListCoverMiddle];
    [aCoder encodeObject:_playPathHq forKey:kZIXUNRIGHTMORE_ListPlayPathHq];
    [aCoder encodeDouble:_shares forKey:kZIXUNRIGHTMORE_ListShares];
    [aCoder encodeBool:_isPaid forKey:kZIXUNRIGHTMORE_ListIsPaid];
    [aCoder encodeObject:_playPathAacv224 forKey:kZIXUNRIGHTMORE_ListPlayPathAacv224];
    [aCoder encodeDouble:_createdAt forKey:kZIXUNRIGHTMORE_ListCreatedAt];
    [aCoder encodeObject:_smallLogo forKey:kZIXUNRIGHTMORE_ListSmallLogo];
    [aCoder encodeDouble:_albumId forKey:kZIXUNRIGHTMORE_ListAlbumId];
    [aCoder encodeDouble:_playtimes forKey:kZIXUNRIGHTMORE_ListPlaytimes];
    [aCoder encodeObject:_playUrl64 forKey:kZIXUNRIGHTMORE_ListPlayUrl64];
    [aCoder encodeObject:_playPathAacv164 forKey:kZIXUNRIGHTMORE_ListPlayPathAacv164];
    [aCoder encodeObject:_playUrl32 forKey:kZIXUNRIGHTMORE_ListPlayUrl32];
    [aCoder encodeDouble:_uid forKey:kZIXUNRIGHTMORE_ListUid];
    [aCoder encodeObject:_coverSmall forKey:kZIXUNRIGHTMORE_ListCoverSmall];
    [aCoder encodeObject:_coverLarge forKey:kZIXUNRIGHTMORE_ListCoverLarge];
    [aCoder encodeDouble:_comments forKey:kZIXUNRIGHTMORE_ListComments];
    [aCoder encodeDouble:_trackId forKey:kZIXUNRIGHTMORE_ListTrackId];
    [aCoder encodeDouble:_opType forKey:kZIXUNRIGHTMORE_ListOpType];
    [aCoder encodeBool:_isPublic forKey:kZIXUNRIGHTMORE_ListIsPublic];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHTMORE_List *copy = [[ZIXUNRIGHTMORE_List alloc] init];
    
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
