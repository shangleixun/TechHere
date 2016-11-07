//
//  ZIXUNRIGHT_User.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZIXUNRIGHT_User : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
