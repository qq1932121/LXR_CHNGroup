//
//  LXR_CHNGroupManager.h
//  Pods
//
//  Created by MACBOOK on 2017/7/22.
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
#import "LXRSingle.h"

/** 分组后联系人的相关信息Block*/
typedef void(^CompletionGroupBlock)(NSMutableArray* titles, NSMutableArray* groupArray);
/** 参数错误回调Block*/
typedef void (^FailureBlock)(NSError *error);

@interface LXR_CHNGroupManager : NSObject
LXRSingletonH(ContactManager)


/**
 中文分组(数组模型传入什么模型就返回什么模型)
 
 @param contactModels   数组模型(处理前)
 @param sortKey         排序比较
 @param groupBlock      完成回调(分组数组和模型数组)
 @param failure         错误回调
 */
-(void)contactManagerWithContactModels:(NSArray*)contactModels SortKey:(NSString *)sortKey CompletionGroupBlock:(CompletionGroupBlock)groupBlock Failure:(FailureBlock)failure;
@end
