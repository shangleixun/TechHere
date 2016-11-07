//
//  NetWorkRequest.h
//  TechHere
//
//  Created by 尚雷勋 on 16/9/12.
//  Copyright © 2016年 尚雷勋. All rights reserved.
//

#import <Foundation/Foundation.h>

// 枚举


@interface NetWorkRequest : NSObject
typedef NS_ENUM(NSInteger, RequestType) {
    GET = 0,
    POST = 1
};
// 成功、失败 block
typedef void(^success)(NSData *data);
typedef void(^fail)(NSError *error);

+ (void)requestWithMethod:(RequestType)method URL:(NSString *)requestURL parameter:(NSDictionary *)paraDictionary success:(success)successMSG error:(fail)failError;

@end
