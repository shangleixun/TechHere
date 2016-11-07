//
//  ReMenu_ClassList.h
//
//  Created by 雷勋 尚 on 2016/9/29
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ReMenu_ClassList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *hostname;
@property (nonatomic, strong) NSString *classId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
