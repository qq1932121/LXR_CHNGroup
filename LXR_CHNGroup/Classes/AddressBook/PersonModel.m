//
//  PersonModel.m
//  Characters
//
//  Created by LXR on 2017/7/25.
//  Copyright © 2017年 mac. All rights reserved.
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
