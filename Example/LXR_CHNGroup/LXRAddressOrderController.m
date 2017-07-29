//
//  LXRAddressOrderController.m
//  LXR_CHNGroup
//
//  Created by MACBOOK on 2017/7/30.
//  Copyright © 2017年 1932121@qq.com. All rights reserved.
//

#import "LXRAddressOrderController.h"
#import "../../LXR_CHNGroup/Classes/LXR_CHNGroup.h"

@interface LXRAddressOrderController ()

@property (nonatomic, strong) NSDictionary<NSString *,NSArray *> *addressBookDict;
@property (nonatomic, strong) NSArray* titles;

@end

@implementation LXRAddressOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = self.titles[section];
    return [self.addressBookDict[key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    NSString *key = self.titles[indexPath.section];
    PersonModel *people = [self.addressBookDict[key] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = people.name;
    
    return cell;
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.titles[section];
}
//右侧的索引
- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.titles;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.titles[indexPath.section];
    PersonModel *people = [self.addressBookDict[key] objectAtIndex:indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:people.name
                                                    message:[NSString stringWithFormat:@"号码:%@",people.mobileArray]
                                                   delegate:nil
                                          cancelButtonTitle:@"知道啦"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
