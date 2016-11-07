//
//  Total_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Total_CategoryContents, Total_Keywords, Total_FocusImages;

@interface Total_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Total_CategoryContents *categoryContents;
@property (nonatomic, assign) BOOL hasRecommendedZones;
@property (nonatomic, strong) Total_Keywords *keywords;
@property (nonatomic, strong) Total_FocusImages *focusImages;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, assign) double ret;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
