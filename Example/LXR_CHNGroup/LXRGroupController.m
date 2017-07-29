//
//  LXRGroupController.m
//  LXR_CHNGroup
//
//  Created by MACBOOK on 2017/7/30.
//  Copyright © 2017年 1932121@qq.com. All rights reserved.
//

#import "LXRGroupController.h"
#import "LXRContactModel.h"
#import "../../LXR_CHNGroup/Classes/LXR_CHNGroup.h"

@interface LXRGroupController ()
@property (nonatomic) NSMutableArray *sectionTitles;
@property (nonatomic) NSMutableArray<NSMutableArray<LXRContactModel *> *> *dataArray;
@property (nonatomic) NSMutableArray<LXRContactModel *> *contactSource;
@end

@implementation LXRGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.rowHeight = 56;
    /// 方法调用
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
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    LXRContactModel *userModel = self.dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = userModel.userName;
    cell.imageView.image = userModel.avatarImage;
    return cell;
}

#pragma mark - Section Titles

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}


-(NSMutableArray<NSMutableArray<LXRContactModel *> *> *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

-(NSMutableArray<NSString *> *)sectionTitles{
    if (!_sectionTitles) {
        _sectionTitles = [NSMutableArray new];
    }
    return _sectionTitles;
}

-(NSMutableArray<LXRContactModel *> *)contactSource{
    
    if (!_contactSource) {
        _contactSource = [NSMutableArray new];
        NSArray* arr = @[
                         @{@"companyShortName": @"反而而我送龙膜明logo"},
                         @{@"companyShortName": @"d我送龙膜明logo"},
                         @{@"companyShortName": @"刚刚滚到o"},
                         @{@"companyShortName": @"防守打法地方logo"},
                         @{@"companyShortName": @"的负担我141424do"},
                         @{@"companyShortName": @"龙我送龙膜明lo123o"},
                         @{@"companyShortName": @"送龙膜明l"},
                         @{@"companyShortName": @"1"},
                         @{@"companyShortName": @"e"},
                         @{@"companyShortName": @"我"},
                         @{@"companyShortName": @"2"},
                         @{@"companyShortName": @"#"},
                         @{@"companyShortName": @"破1231231"},
                         @{@"companyShortName": @"比比"}
                         ];
        for (NSDictionary* dict in arr) {
            NSString *name = dict[@"companyShortName"];
            LXRContactModel* model = [LXRContactModel new];
            model.userName = name;
            model.avatarImage = [UIImage imageNamed:@"icon_avatar"];
            [_contactSource addObject:model];
        }
    }
    return _contactSource;
}

@end
