//
//  PersonModel.h
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

@interface PersonModel : NSObject

/** 联系人姓名*/
@property (nonatomic, copy) NSString *name;

/** 联系人电话数组,因为一个联系人可能存储多个号码*/
@property (nonatomic, strong) NSMutableArray *mobileArray;

/** 联系人头像*/
@property (nonatomic, strong) UIImage *headerImage;


@end
