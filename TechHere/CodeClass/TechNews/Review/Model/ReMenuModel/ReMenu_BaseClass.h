//
//  ReMenu_BaseClass.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReMenu_BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *resVersion;
@property (nonatomic, strong) NSString *docUpdateNums;
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) NSArray *classList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
