//
//  ZIXUNRIGHT_Data.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZIXUNRIGHT_Tracks, ZIXUNRIGHT_Album, ZIXUNRIGHT_User;

@interface ZIXUNRIGHT_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *viewTab;
@property (nonatomic, strong) ZIXUNRIGHT_Tracks *tracks;
@property (nonatomic, assign) BOOL showFeedButton;
@property (nonatomic, strong) ZIXUNRIGHT_Album *album;
@property (nonatomic, strong) ZIXUNRIGHT_User *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
