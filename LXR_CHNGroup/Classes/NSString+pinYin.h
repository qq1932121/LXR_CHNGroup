//
//  NSString+pinYin.h
//  Pods
//
//  Created by LXR on 2017/7/21.
//  Copyright © 2017年 LXR. All rights reserved.
//
/*
 *********************************************************************************
 *
 *⭐️⭐️⭐️ LXR_CHNGroup只为技术交流,如有问题,欢迎各路大神指教 ⭐️⭐️⭐️
 *
 * 如果您在使用 LXR_CHNGroup 的过程中出现bug或有更好的建议,还请及时以下列方式联系我,我会及
 * 时修复bug,解决问题.
 *
 * QQ :    1932121
 * Email : 1932121@qq.com
 * GitHub: https://github.com/qq1932121
 * 简书:    http://www.jianshu.com/u/59557cdcd06e
 *
 * 如果 LXR_CHNGroup 好用,希望您能Star支持,你的 ⭐️ 是我持续更新的动力!
 *********************************************************************************
 */

#import <Foundation/Foundation.h>

@interface NSString (pinYin)

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstPinyinLetterOfString:(NSString *)aString;

//获取拼音
+ (NSString *)pinyinOfString:(NSString *)aString;

//获取字符串首个字大写字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)getFirstLetterFromString:(NSString *)aString;

//多音字处理
+ (NSString *)polyphoneStringHandle:(NSString *)aString pinyinString:(NSString *)pinyinString;

//过滤指定字符串(可自定义添加自己过滤的字符串)
+ (NSString *)removeSpecialSubString: (NSString *)string;
@end
