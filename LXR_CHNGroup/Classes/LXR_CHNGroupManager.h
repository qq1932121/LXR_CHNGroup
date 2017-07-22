//
//  LXR_CHNGroupManager.h
//  Pods
//
//  Created by MACBOOK on 2017/7/22.
//  Copyright © 2017年 LXR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXRSingle.h"

/** 分组后联系人的相关信息Block*/
typedef void(^CompletionGroupBlock)(NSMutableArray* titles, NSMutableArray* groupArray);
/** 参数错误回调Block*/
typedef void (^FailureBlock)(NSError *error);

@interface LXR_CHNGroupManager : NSObject
LXRSingletonH(ContactManager)


/**
 中文分组
 数组模型传入什么模型就返回什么模型
 @param contactModels   数组模型(处理前)
 @param sortKey         排序比较
 @param groupBlock      完成回调(分组数组和模型数组)
 @param failure         错误回调
 */
-(void)contactManagerWithContactModels:(NSArray*)contactModels SortKey:(NSString *)sortKey CompletionGroupBlock:(CompletionGroupBlock)groupBlock Failure:(FailureBlock)failure;
@end
