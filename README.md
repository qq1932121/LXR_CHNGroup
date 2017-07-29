# LXR_CHNGroup

[![CI Status](http://img.shields.io/travis/1932121@qq.com/LXR_CHNGroup.svg?style=flat)](https://travis-ci.org/1932121@qq.com/LXR_CHNGroup)
[![Version](https://img.shields.io/cocoapods/v/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)
[![License](https://img.shields.io/cocoapods/l/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)
[![Platform](https://img.shields.io/cocoapods/p/LXR_CHNGroup.svg?style=flat)](http://cocoapods.org/pods/LXR_CHNGroup)

```objc

⭐️⭐️⭐️ LXR_CHNGroup只为技术交流,如有问题,欢迎各路大神指教 ⭐️⭐️⭐️

如果您在使用 LXR_CHNGroup 的过程中出现bug或有更好的建议,还请及时以下列方式联系我,我会及时修复bug,解决问题.

* QQ :    1932121
* Email : 1932121@qq.com
* GitHub: https://github.com/qq1932121
* 简书:    http://www.jianshu.com/u/59557cdcd06e

如果 LXR_CHNGroupKit 好用,希望您能Star支持,你的 ⭐️ 是我持续更新的动力!

```
## 主要功能分为两个功能类

- `LXR_CHNGroupManager`根据模型数组和根据Key排序
    - 示例代码 

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
- `AddressBookManager`调用系统通讯录就行分组 
    - 示例代码(获取原始顺序排列的所有联系人)

```objc
//1.获取通讯录权限
[[AddressBookManager sharedManager] requestAuthorizationWithSuccessBlock:^(BOOL isSuccess) {
    if (isSuccess) {
    //2.获取通讯录
    [[AddressBookManager sharedManager] getOriginalAddressBook:^(NSArray<PersonModel *> *addressBookArray) {
        self.addressArray = addressBookArray;
        [self.tableView reloadData];
    } authorizationFailure:^{
        //2 弹框
        [self showAlert];
    }];
}
}];

```
    - 示例代码(获取按A~Z顺序排列的所有联系人)

```objc
//1.获取通讯录权限
[[AddressBookManager sharedManager] requestAuthorizationWithSuccessBlock:^(BOOL isSuccess) {
    if (isSuccess) {
        //2.获取分组通讯录
        [[AddressBookManager sharedManager] getOrderAddressBook:^(NSDictionary<NSString *,NSArray *> *addressBookDict, NSArray *nameKeys) {

        self.addressBookDict = addressBookDict;
        self.titles = nameKeys;
        [self.tableView reloadData];

        } authorizationFailure:^{
        // 失败操作处理...
        }];
    }else{
    // 失败操作处理...
    }
}];
```

- 此功能参考PPGetAddressBook框架,十分感谢,从中学到很多知识

## CocoaPods安装
LXR_CHNGroup is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LXR_CHNGroup"
```

## 作者

LXR, 1932121@qq.com

## License

LXR_CHNGroup is available under the MIT license. See the LICENSE file for more info.
