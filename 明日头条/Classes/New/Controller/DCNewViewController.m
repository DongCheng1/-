//
//  DCNewViewController.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/10.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCNewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "DCBQTableViewController.h"
@interface DCNewViewController ()

@end

@implementation DCNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor greenColor];
    //设置导航条
    [self setupNavBar];
}
//设置导航条
- (void)setupNavBar {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tiao)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

//进入标签界面
- (void)tiao {
    DCBQTableViewController *bq = [[DCBQTableViewController alloc]init];
    [self.navigationController pushViewController:bq animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
