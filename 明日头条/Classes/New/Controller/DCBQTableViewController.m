//
//  DCBQTableViewController.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/17.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCBQTableViewController.h"
#import "DCSubTagItem.h"
#import "DCSubTagCell.h"
#import "UIView+Frame.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import <SVProgressHUD/SVProgressHUD.h>
#define DColor(r,g,b)[UIColor colorWithRed:(r)/256.0 green:(g)/256.0 blue:(b)/256.0 alpha:1]
static NSString * const ID = @"cell";
@interface DCBQTableViewController ()
@property (strong,nonatomic) NSArray *arr;
@property (weak,nonatomic) AFHTTPSessionManager *mgr;
@end

@implementation DCBQTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.title = @"推荐标签";
    //设置分隔符
    self.tableView.separatorInset = UIEdgeInsetsZero;
    //设置背景颜色
    self.tableView.backgroundColor = DColor(210, 200, 220);
    //提示用户正在加载数据
    [SVProgressHUD showWithStatus:@"正在加载ing..."];
    //加载数据
    [self data];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DCSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
}


//界面即将消失时调用
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //销毁指示器
    [SVProgressHUD dismiss];
    //取消之前的afn请求
    [_mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}

//请求数据
- (void)data {
    AFHTTPSessionManager *mgr = [[AFHTTPSessionManager alloc]init];
    _mgr = mgr;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        //[responseObject writeToFile:@"/Users/dongcheng/Desktop/Baisibudejie/Baisibudejie/Classes/New/Controller/tag2.plist" atomically:YES];
        
        //字典数组转模型数组
        self.arr =  [DCSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        //刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //自定义cell
    DCSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //得到每一行的item
    DCSubTagItem *item = self.arr[indexPath.row];
    //将每一行的item赋值给cell
    cell.item = item;
    //返回cell
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
