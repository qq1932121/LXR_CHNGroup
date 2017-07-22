//
//  NSString+pinYin.h
//  Pods
//
//  Created by LXR on 2017/7/21.
//  Copyright © 2017年 LXR. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (pinYin)

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstPinyinLetterOfString:(NSString *)aString;

//获取拼音
+ (NSString *)pinyinOfString:(NSString *)aString;

@end
