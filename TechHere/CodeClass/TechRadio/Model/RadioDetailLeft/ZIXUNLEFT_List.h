//
//  ZIXUNLEFT_List.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZIXUNLEFT_List : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *displayDiscountedPrice;
@property (nonatomic, strong) NSString *displayPrice;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) double playsCounts;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) BOOL isPaid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *recSrc;
@property (nonatomic, assign) double score;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, strong) NSString *recTrack;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double priceTypeId;
@property (nonatomic, assign) double totalTrackCount;
@property (nonatomic, assign) double discountedPrice;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) double playTimes;
@property (nonatomic, assign) double priceTypeEnum;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
