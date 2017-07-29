//
//  PersonModel.h
//  Characters
//
//  Created by LXR on 2017/7/25.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

/** 联系人姓名*/
@property (nonatomic, copy) NSString *name;

/** 联系人电话数组,因为一个联系人可能存储多个号码*/
@property (nonatomic, strong) NSMutableArray *mobileArray;

/** 联系人头像*/
@property (nonatomic, strong) UIImage *headerImage;


@end
