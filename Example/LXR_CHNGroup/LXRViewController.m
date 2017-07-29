//

#import "LXRViewController.h"

#import "../../LXR_CHNGroup/Classes/LXR_CHNGroup.h"
@interface LXRViewController ()
@property (nonatomic, strong) NSDictionary *rows;

@end

@implementation LXRViewController

-(NSDictionary *)rows{
    if (!_rows) {
        _rows = @{
                  @"Group分组"                 : @"LXRGroupController",
                  @"获取原始顺序排列的所有联系人"  : @"LXRAddressOriginalController",
                  @"获取按A~Z顺序排列的所有联系人" : @"LXRAddressOrderController"
                  };
    }
    return _rows;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = self.rows.allKeys[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* className = self.rows.allValues[indexPath.row];
    Class cls = NSClassFromString(className);
    UIViewController* vc = [[cls alloc] init];
    vc.title = self.rows.allKeys[indexPath.row];
    NSLog(@"%@",[vc class]);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
