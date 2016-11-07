//
//  ZIXUNLEFT_User.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZIXUNLEFT_User : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, assign) double albums;
@property (nonatomic, assign) double followers;
@property (nonatomic, strong) NSString *personalSignature;
@property (nonatomic, assign) BOOL isFollowed;
@property (nonatomic, assign) double followings;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
