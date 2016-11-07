//
//  RadioList_List.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RadioList_List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double serialState;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracks;
@property (nonatomic, strong) NSString *trackTitle;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double isFinished;
@property (nonatomic, assign) double trackId;
@property (nonatomic, strong) NSString *albumCoverUrl290;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
