//

#import "LXRViewController.h"
#import "LXRContactModel.h"

#import "../../LXR_CHNGroup/Classes/LXR_CHNGroup.h"
@interface LXRViewController ()

@property (nonatomic) NSMutableArray *sectionTitles;
@property (nonatomic) NSMutableArray<NSMutableArray<LXRContactModel *> *> *dataArray;
@property (nonatomic) NSMutableArray<LXRContactModel *> *contactSource;

@end

@implementation LXRViewController

 - (void)viewDidLoad {
    [super viewDidLoad];
     
    self.title = @"通讯录";
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = self.tableView.backgroundColor;
    CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, height)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor redColor];
    [label setText:[self.sectionTitles objectAtIndex:(section)]];
    [contentView addSubview:label];
    return contentView;
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
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"反而而我送龙膜明logo",
                              },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"d我送龙膜明logo",
                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"刚刚滚到o",
                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"防守打法地方logo",
                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"的负担我141424do",
                                                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"龙我送龙膜明lo123o",
                                                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"送龙膜明l",
                                                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"1",
                                                               },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"e",
                                 },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"我",
                                 },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"2",
                                 },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"#",
                                 },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"破1231231",
                                 },
                             @{
                                 @"logoUrl": @"http://lxrtest.oss-cn-beijing.aliyuncs.com/test/alioss_1498208401015.jpg",
                                 @"companyShortName": @"比比",
                                }
                             ];
        for (NSDictionary* dict in arr) {
                NSString *name = dict[@"companyShortName"];
                LXRContactModel* model = [LXRContactModel new]; //[[LXRContactModel alloc]initWithBuddy:name];
                model.userName = name;
                model.avatarImage = [UIImage imageNamed:@"icon_avatar"];
                [_contactSource addObject:model];
            }
        
    }
    return _contactSource;

}
    @end
