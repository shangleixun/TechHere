//
//  NewsSmartList_Pics.h
//
//  Created by 雷勋 尚 on 2016/10/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewsSmartList_Pics : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *imgsrc;
@property (nonatomic, strong) NSString *picsIdentifier;
@property (nonatomic, strong) NSString *imgsrc2;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *stitle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
