//
//  AddressBookManager.h
//  Characters
//
//  Created by LXR on 2017/7/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PersonModel;



/** 一个联系人的相关信息*/
typedef void(^PPPersonModelBlock)(PersonModel *model);

/** 授权失败的Block*/
typedef void(^AuthorizationFailure)(void);
/**
 *  获取原始顺序的所有联系人的Block
 */
typedef void(^AddressBookArrayBlock)(NSArray<PersonModel *> *addressBookArray);

/**
 *  获取按A~Z顺序排列的所有联系人的Block
 *
 *  @param addressBookDict 装有所有联系人的字典->每个字典key对应装有多个联系人模型的数组->每个模型里面包含着用户的相关信息.
 *  @param nameKeys   联系人姓名的大写首字母的数组
 */
typedef void(^AddressBookDictBlock)(NSDictionary<NSString *,NSArray *> *addressBookDict,NSArray *nameKeys);


@interface AddressBookManager : NSObject

+ (instancetype)sharedInstance;
/**
 *  请求用户是否授权APP访问通讯录的权限
 */
- (void)requestAuthorizationWithSuccessBlock:(void (^)(BOOL isSuccess))success;

/**
 *  获取原始顺序排列的所有联系人
 *
 *  @param addressBookArray 装着原始顺序的联系人字典Block回调
 */
- (void)getOriginalAddressBook:(AddressBookArrayBlock)addressBookArray authorizationFailure:(AuthorizationFailure)failure;

/**
 *  获取按A~Z顺序排列的所有联系人
 *
 *  @param addressBookInfo 装着A~Z排序的联系人字典Block回调
 *  @param failure         授权失败的Block
 */
- (void)getOrderAddressBook:(AddressBookDictBlock)addressBookInfo authorizationFailure:(AuthorizationFailure)failure;

@end
