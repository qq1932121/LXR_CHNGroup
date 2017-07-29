//
//  LXRAddressOriginalController.m
//  LXR_CHNGroup
//
//  Created by MACBOOK on 2017/7/30.
//  Copyright © 2017年 1932121@qq.com. All rights reserved.
//

#import "LXRAddressOriginalController.h"
#import "../../LXR_CHNGroup/Classes/LXR_CHNGroup.h"


@interface LXRAddressOriginalController ()

@property (nonatomic, strong)NSArray<PersonModel*>* addressArray;

@end

@implementation LXRAddressOriginalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.addressArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    PersonModel* model = self.addressArray[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonModel *people = self.addressArray[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:people.name
                                                    message:[NSString stringWithFormat:@"号码:%@",people.mobileArray]
                                                   delegate:nil
                                          cancelButtonTitle:@"知道啦"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showAlert{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:@"请在iPhone的“设置-隐私-通讯录”选项中，允许<你的应用名称>访问您的通讯录" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];

    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([action.title isEqualToString:@"设置"]) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
