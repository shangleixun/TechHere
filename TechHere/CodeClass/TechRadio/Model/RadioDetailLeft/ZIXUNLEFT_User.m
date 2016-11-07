//
//  ZIXUNLEFT_User.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNLEFT_User.h"


NSString *const kZIXUNLEFT_UserSmallLogo = @"smallLogo";
NSString *const kZIXUNLEFT_UserTracks = @"tracks";
NSString *const kZIXUNLEFT_UserUid = @"uid";
NSString *const kZIXUNLEFT_UserNickname = @"nickname";
NSString *const kZIXUNLEFT_UserIsVerified = @"isVerified";
NSString *const kZIXUNLEFT_UserAlbums = @"albums";
NSString *const kZIXUNLEFT_UserFollowers = @"followers";
NSString *const kZIXUNLEFT_UserPersonalSignature = @"personalSignature";
NSString *const kZIXUNLEFT_UserIsFollowed = @"isFollowed";
NSString *const kZIXUNLEFT_UserFollowings = @"followings";


@interface ZIXUNLEFT_User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNLEFT_User

@synthesize smallLogo = _smallLogo;
@synthesize tracks = _tracks;
@synthesize uid = _uid;
@synthesize nickname = _nickname;
@synthesize isVerified = _isVerified;
@synthesize albums = _albums;
@synthesize followers = _followers;
@synthesize personalSignature = _personalSignature;
@synthesize isFollowed = _isFollowed;
@synthesize followings = _followings;


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
            self.smallLogo = [self objectOrNilForKey:kZIXUNLEFT_UserSmallLogo fromDictionary:dict];
            self.tracks = [[self objectOrNilForKey:kZIXUNLEFT_UserTracks fromDictionary:dict] doubleValue];
            self.uid = [[self objectOrNilForKey:kZIXUNLEFT_UserUid fromDictionary:dict] doubleValue];
            self.nickname = [self objectOrNilForKey:kZIXUNLEFT_UserNickname fromDictionary:dict];
            self.isVerified = [[self objectOrNilForKey:kZIXUNLEFT_UserIsVerified fromDictionary:dict] boolValue];
            self.albums = [[self objectOrNilForKey:kZIXUNLEFT_UserAlbums fromDictionary:dict] doubleValue];
            self.followers = [[self objectOrNilForKey:kZIXUNLEFT_UserFollowers fromDictionary:dict] doubleValue];
            self.personalSignature = [self objectOrNilForKey:kZIXUNLEFT_UserPersonalSignature fromDictionary:dict];
            self.isFollowed = [[self objectOrNilForKey:kZIXUNLEFT_UserIsFollowed fromDictionary:dict] boolValue];
            self.followings = [[self objectOrNilForKey:kZIXUNLEFT_UserFollowings fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.smallLogo forKey:kZIXUNLEFT_UserSmallLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tracks] forKey:kZIXUNLEFT_UserTracks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kZIXUNLEFT_UserUid];
    [mutableDict setValue:self.nickname forKey:kZIXUNLEFT_UserNickname];
    [mutableDict setValue:[NSNumber numberWithBool:self.isVerified] forKey:kZIXUNLEFT_UserIsVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.albums] forKey:kZIXUNLEFT_UserAlbums];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followers] forKey:kZIXUNLEFT_UserFollowers];
    [mutableDict setValue:self.personalSignature forKey:kZIXUNLEFT_UserPersonalSignature];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFollowed] forKey:kZIXUNLEFT_UserIsFollowed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followings] forKey:kZIXUNLEFT_UserFollowings];

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

    self.smallLogo = [aDecoder decodeObjectForKey:kZIXUNLEFT_UserSmallLogo];
    self.tracks = [aDecoder decodeDoubleForKey:kZIXUNLEFT_UserTracks];
    self.uid = [aDecoder decodeDoubleForKey:kZIXUNLEFT_UserUid];
    self.nickname = [aDecoder decodeObjectForKey:kZIXUNLEFT_UserNickname];
    self.isVerified = [aDecoder decodeBoolForKey:kZIXUNLEFT_UserIsVerified];
    self.albums = [aDecoder decodeDoubleForKey:kZIXUNLEFT_UserAlbums];
    self.followers = [aDecoder decodeDoubleForKey:kZIXUNLEFT_UserFollowers];
    self.personalSignature = [aDecoder decodeObjectForKey:kZIXUNLEFT_UserPersonalSignature];
    self.isFollowed = [aDecoder decodeBoolForKey:kZIXUNLEFT_UserIsFollowed];
    self.followings = [aDecoder decodeDoubleForKey:kZIXUNLEFT_UserFollowings];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_smallLogo forKey:kZIXUNLEFT_UserSmallLogo];
    [aCoder encodeDouble:_tracks forKey:kZIXUNLEFT_UserTracks];
    [aCoder encodeDouble:_uid forKey:kZIXUNLEFT_UserUid];
    [aCoder encodeObject:_nickname forKey:kZIXUNLEFT_UserNickname];
    [aCoder encodeBool:_isVerified forKey:kZIXUNLEFT_UserIsVerified];
    [aCoder encodeDouble:_albums forKey:kZIXUNLEFT_UserAlbums];
    [aCoder encodeDouble:_followers forKey:kZIXUNLEFT_UserFollowers];
    [aCoder encodeObject:_personalSignature forKey:kZIXUNLEFT_UserPersonalSignature];
    [aCoder encodeBool:_isFollowed forKey:kZIXUNLEFT_UserIsFollowed];
    [aCoder encodeDouble:_followings forKey:kZIXUNLEFT_UserFollowings];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNLEFT_User *copy = [[ZIXUNLEFT_User alloc] init];
    
    if (copy) {

        copy.smallLogo = [self.smallLogo copyWithZone:zone];
        copy.tracks = self.tracks;
        copy.uid = self.uid;
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.isVerified = self.isVerified;
        copy.albums = self.albums;
        copy.followers = self.followers;
        copy.personalSignature = [self.personalSignature copyWithZone:zone];
        copy.isFollowed = self.isFollowed;
        copy.followings = self.followings;
    }
    
    return copy;
}


@end
