//
//  ZIXUNRIGHT_Data.m
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZIXUNRIGHT_Data.h"
#import "ZIXUNRIGHT_Tracks.h"
#import "ZIXUNRIGHT_Album.h"
#import "ZIXUNRIGHT_User.h"


NSString *const kZIXUNRIGHT_DataViewTab = @"viewTab";
NSString *const kZIXUNRIGHT_DataTracks = @"tracks";
NSString *const kZIXUNRIGHT_DataShowFeedButton = @"showFeedButton";
NSString *const kZIXUNRIGHT_DataAlbum = @"album";
NSString *const kZIXUNRIGHT_DataUser = @"user";


@interface ZIXUNRIGHT_Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZIXUNRIGHT_Data

@synthesize viewTab = _viewTab;
@synthesize tracks = _tracks;
@synthesize showFeedButton = _showFeedButton;
@synthesize album = _album;
@synthesize user = _user;


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
            self.viewTab = [self objectOrNilForKey:kZIXUNRIGHT_DataViewTab fromDictionary:dict];
            self.tracks = [ZIXUNRIGHT_Tracks modelObjectWithDictionary:[dict objectForKey:kZIXUNRIGHT_DataTracks]];
            self.showFeedButton = [[self objectOrNilForKey:kZIXUNRIGHT_DataShowFeedButton fromDictionary:dict] boolValue];
            self.album = [ZIXUNRIGHT_Album modelObjectWithDictionary:[dict objectForKey:kZIXUNRIGHT_DataAlbum]];
            self.user = [ZIXUNRIGHT_User modelObjectWithDictionary:[dict objectForKey:kZIXUNRIGHT_DataUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.viewTab forKey:kZIXUNRIGHT_DataViewTab];
    [mutableDict setValue:[self.tracks dictionaryRepresentation] forKey:kZIXUNRIGHT_DataTracks];
    [mutableDict setValue:[NSNumber numberWithBool:self.showFeedButton] forKey:kZIXUNRIGHT_DataShowFeedButton];
    [mutableDict setValue:[self.album dictionaryRepresentation] forKey:kZIXUNRIGHT_DataAlbum];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kZIXUNRIGHT_DataUser];

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

    self.viewTab = [aDecoder decodeObjectForKey:kZIXUNRIGHT_DataViewTab];
    self.tracks = [aDecoder decodeObjectForKey:kZIXUNRIGHT_DataTracks];
    self.showFeedButton = [aDecoder decodeBoolForKey:kZIXUNRIGHT_DataShowFeedButton];
    self.album = [aDecoder decodeObjectForKey:kZIXUNRIGHT_DataAlbum];
    self.user = [aDecoder decodeObjectForKey:kZIXUNRIGHT_DataUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_viewTab forKey:kZIXUNRIGHT_DataViewTab];
    [aCoder encodeObject:_tracks forKey:kZIXUNRIGHT_DataTracks];
    [aCoder encodeBool:_showFeedButton forKey:kZIXUNRIGHT_DataShowFeedButton];
    [aCoder encodeObject:_album forKey:kZIXUNRIGHT_DataAlbum];
    [aCoder encodeObject:_user forKey:kZIXUNRIGHT_DataUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZIXUNRIGHT_Data *copy = [[ZIXUNRIGHT_Data alloc] init];
    
    if (copy) {

        copy.viewTab = [self.viewTab copyWithZone:zone];
        copy.tracks = [self.tracks copyWithZone:zone];
        copy.showFeedButton = self.showFeedButton;
        copy.album = [self.album copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
