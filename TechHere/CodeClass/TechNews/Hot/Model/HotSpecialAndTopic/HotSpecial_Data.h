//
//  HotSpecial_Data.h
//
//  Created by 雷勋 尚 on 2016/10/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotSpecial_Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id isfollow;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, assign) id originimage;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *tpimg;
@property (nonatomic, strong) NSString *followcount;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, strong) NSString *articlecount;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
