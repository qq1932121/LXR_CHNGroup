//
//  LXRContactModel.h
//  Pods
//
//  Created by LXR on 2017/7/21.
//  Copyright © 2017年 LXR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXRContactModel : NSObject

@property (nonatomic, copy) NSString *userName;

/**
 拼音名称
 */
@property (nonatomic, copy) NSString *pinyinOfUserName;

/**
 昵称
 */
@property (copy, nonatomic) NSString *nickname;

/**
 头像URL
 */
@property (copy, nonatomic) NSString *avatarURLPath;

/**
 头像图片
 */
@property (copy, nonatomic) UIImage *avatarImage;



@end
