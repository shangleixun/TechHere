//
//  Total_List.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Total_List : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double priceTypeEnum;
@property (nonatomic, strong) NSString *trackTitle;
@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, assign) double listIdentifier;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *coverPathBig;
@property (nonatomic, assign) double keywordId;
@property (nonatomic, strong) NSString *displayPrice;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double releasedAt;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, assign) BOOL isShare;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isExternalUrl;
@property (nonatomic, assign) double subType;
@property (nonatomic, assign) double realCategoryId;
@property (nonatomic, assign) double score;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *contentType;
@property (nonatomic, strong) NSString *displayDiscountedPrice;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, assign) double isFinished;
@property (nonatomic, assign) double trackId;
@property (nonatomic, assign) double specialId;
@property (nonatomic, assign) double discountedPrice;
@property (nonatomic, assign) double serialState;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) BOOL isHot;
@property (nonatomic, strong) NSString *tagName;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, strong) NSString *footnote;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) double keywordType;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double moduleType;
@property (nonatomic, strong) NSString *coverPathSmall;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *longTitle;
@property (nonatomic, strong) NSString *calcDimension;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *albumCoverUrl290;
@property (nonatomic, strong) NSString *keywordName;
@property (nonatomic, strong) NSString *coverSmall;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
