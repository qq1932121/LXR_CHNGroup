//
//  LXR_CHNGroupManager.m
//  Pods
//
//  Created by MACBOOK on 2017/7/22.
//  Copyright © 2017年 LXR. All rights reserved.
//

#import "LXR_CHNGroupManager.h"
#import "NSString+pinYin.h"
#import <objc/runtime.h>

@interface LXR_CHNGroupManager()

@property(nonatomic ,copy)CompletionGroupBlock groupBlock;

/**
 组头数组(A-Z)
 */
@property (nonatomic, strong) NSMutableArray *sectionTitles;

/**
 分组后回调数组
 */
@property (nonatomic, strong) NSMutableArray *groupArray;

/**
 传进来临时数组
 */
@property (nonatomic, strong) NSArray *sourceArray;

@end

@implementation LXR_CHNGroupManager
LXRSingletonM(ContactManager)


/**
 中文分组
 数组模型传入什么模型就返回什么模型
 @param contactModels   数组模型(处理前)
 @param sortKey         排序比较
 @param groupBlock      完成回调(分组数组和模型数组)
 @param failure         错误回调
 */
-(void)contactManagerWithContactModels:(NSArray*)contactModels SortKey:(NSString *)sortKey CompletionGroupBlock:(CompletionGroupBlock)groupBlock Failure:(FailureBlock)failure{
    
    NSError* error = nil;
    error = [self checking:@[contactModels,sortKey]];
    if (error) {
        failure(error);
        return;
    }
    self.sourceArray = contactModels;
    _groupBlock = groupBlock;
    
    // 根据sortKey排序分组
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:YES];
    // 建立索引的核心, 返回27，是a－z和＃
    UILocalizedIndexedCollation *indexCollation = [UILocalizedIndexedCollation currentCollation];
    [self.sectionTitles addObjectsFromArray:[indexCollation sectionTitles]];
    NSInteger highSection = [self.sectionTitles count];
    
    
    NSMutableArray<NSMutableArray *> *sortedArray = [NSMutableArray arrayWithCapacity:highSection];
    for (int i = 0; i < highSection; i++) {
        NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:1];
        [sortedArray addObject:sectionArray];
    }
    self.groupArray = sortedArray;
    
    // 按首字母分组
    for (id model in self.sourceArray) {
        // 名字
        @try {
            [model valueForKeyPath:sortKey];
        } @catch (NSException *exception) {
            error = [[NSError alloc] initWithDomain:@"错误信息" code:NSURLErrorUnknown userInfo:@{NSLocalizedFailureReasonErrorKey: @"SortKey找不多对应值"}];
        } @finally {
            if (error) {
                failure(error);
                return;
            }
        }
        NSString* nameStr = [model valueForKeyPath:sortKey];
        // 转拼音
        NSString* fullPinYinStr = [NSString pinyinOfString:nameStr];
        
        // 获取第一个拼音
        NSString *firstLetter = [NSString firstPinyinLetterOfString:fullPinYinStr];
        
        if (firstLetter == nil) {
            error = [[NSError alloc] initWithDomain:@"错误信息" code:NSURLErrorUnknown userInfo:@{NSLocalizedFailureReasonErrorKey: @"SortKey对应值不能为空"}];
            failure(error);
            return;
        }
        
        NSInteger section = [indexCollation sectionForObject:firstLetter collationStringSelector:@selector(uppercaseString)];
        
        [self.groupArray[section] addObject:model];
    }
    
    //每个section内的数组排序
    for (int i = 0; i < [sortedArray count]; i++) {
        [sortedArray[i] sortUsingDescriptors:@[descriptor]];
    }
    
    //去掉空的section
    for (NSInteger i = [sortedArray count] - 1; i >= 0; i--) {
        NSArray *array = [sortedArray objectAtIndex:i];
        if ([array count] == 0) {
            [sortedArray removeObjectAtIndex:i];
            [self.sectionTitles removeObjectAtIndex:i];
        }
    }
    
    groupBlock(self.sectionTitles,self.groupArray);
}

#pragma mark - 私有方法
/// 校验数组中(数组和字符串)
- (NSError *)checking:(NSArray *)array{
    NSError* error = nil;
    NSDictionary *userInfo = nil;
    for (id objc in array) {
        if ([objc isKindOfClass:[NSArray class]]) {
            if (array || array.count > 0) {continue;}
            userInfo = @{NSLocalizedFailureReasonErrorKey: @"数组不能为空"};
            error = [[NSError alloc] initWithDomain:@"错误信息" code:NSURLErrorUnknown userInfo:userInfo];
        }
        if ([objc isKindOfClass:[NSString class]]) {
            NSString* string = objc;
            if (string || string.length>0) {continue;}
            userInfo = @{NSLocalizedFailureReasonErrorKey: @"Key不能为空"};
            error = [[NSError alloc] initWithDomain:@"错误信息" code:NSURLErrorUnknown userInfo:userInfo];
            return error;
        }
    }
    return nil;
}

+ (void)setMj_error:(NSError *)error
{
    objc_setAssociatedObject(self, '\0', error, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 懒加载
-(NSMutableArray *)sectionTitles{
    if (!_sectionTitles) {
        _sectionTitles = [NSMutableArray new];
    }
    return _sectionTitles;
}
-(NSMutableArray *)groupArray{
    if (!_groupArray) {
        _groupArray = [NSMutableArray new];
    }
    return _groupArray;
}
-(NSArray *)sourceArray{
    if (!_sourceArray) {
        _sourceArray = [NSArray new];
    }
    return _sourceArray;
}
@end
