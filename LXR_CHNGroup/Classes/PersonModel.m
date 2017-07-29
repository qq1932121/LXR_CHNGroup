//
//  PersonModel.h
//  Pods
//
//  Created by MACBOOK on 2017/7/22.
//  Copyright © 2017年 LXR. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (NSMutableArray *)mobileArray
{
    if(!_mobileArray)
    {
        _mobileArray = [NSMutableArray array];
    }
    return _mobileArray;
}
@end
