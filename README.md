# LXR_CHNGroup

[![CI Status](http://img.shields.io/travis/1932121@qq.com/LXR_CHNGroup.svg?style=flat)](https://travis-ci.org/1932121@qq.com/LXR_CHNGroup)
[![Version](https://img.shields.io/cocoapods/v/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)
[![License](https://img.shields.io/cocoapods/l/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)
[![Platform](https://img.shields.io/cocoapods/p/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)

## Example
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
* 如果 LXR_CHNGroupKit 好用,希望您能Star支持,你的 ⭐️ 是我持续更新的动力!
*********************************************************************************
*/
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LXR_CHNGroup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LXR_CHNGroup"
```

## Author

LXR, 1932121@qq.com


## Examples【示例】

```objc
    /// 方法调用
    /// ContactModels : 传进来模型数组
    /// SortKey       : 排序的Key
    [[LXR_CHNGroupManager sharedContactManager] contactManagerWithContactModels:self.contactSource SortKey:@"userName" CompletionGroupBlock:^(NSMutableArray *titles, NSMutableArray *groupArray) {

    // [A-Z]数组
    self.sectionTitles = titles;
    // 模型数组
    self.dataArray = groupArray;
    // 刷新
    [self.tableView reloadData];

    } Failure:^(NSError *error) {
    NSLog(@"%@",error.description);
    }];
```


## License

LXR_CHNGroup is available under the MIT license. See the LICENSE file for more info.
