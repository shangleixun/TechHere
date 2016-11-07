//
//  ToolsHelper.h
//  TechHere
//
//  Created by 尚雷勋 on 2016/9/28.
//  Copyright © 2016年 samike. All rights reserved.
//

#ifndef ToolsHelper_h
#define ToolsHelper_h

// 屏幕尺寸
#define LX_SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define LX_SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define LX_SCREENBOUNDS ([UIScreen mainScreen].bounds)
#define Ratio  (([UIScreen mainScreen].bounds.size.width) / 320.0)

// 判断字符串是否为空
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )
// 可以打印出当前行，函数
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#endif /* ToolsHelper_h */
