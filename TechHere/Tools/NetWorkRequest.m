//
//  NetWorkRequest.m
//  TechHere
//
//  Created by 尚雷勋 on 16/9/12.
//  Copyright © 2016年 尚雷勋. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

+ (void)requestWithMethod:(RequestType)method URL:(NSString *)requestURL parameter:(NSDictionary *)paraDictionary success:(success)successMSG error:(fail)failError {
    
    // 判断网络 没有网络，给用户一个提示，return
    // HUD 正在加载
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
    if (method == POST) {
        request.HTTPMethod = @"POST";
        request.HTTPBody = [NSJSONSerialization dataWithJSONObject:paraDictionary options:NSJSONWritingPrettyPrinted error:nil];
    }
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            // HUD 取消
            successMSG(data);
        }
        else {
            // HUD 取消并给用户一个请求失败的提示
            failError(error);
        }
    }];
    [task resume];
    
}



@end
