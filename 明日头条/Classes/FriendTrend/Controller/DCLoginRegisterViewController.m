//
//  DCLoginRegisterViewController.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/19.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCLoginRegisterViewController.h"
#import "DCLoginRegisterView.h"
#import "UIView+Frame.h"
#import "DCFastLoginView.h"
@interface DCLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leading;
@property (weak, nonatomic) IBOutlet UIView *bottleView;

@end

@implementation DCLoginRegisterViewController
//关闭模态视图
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//设置注册按钮
- (IBAction)register:(UIButton *)sender {
    sender.selected = !sender.selected;
    //平移中间的view
    self.leading.constant = self.leading.constant == 0? -self.middleView.dc_width * 0.5:0;
    //动画效果
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //创建登陆界面
    DCLoginRegisterView *lrView = [DCLoginRegisterView loginView];
    //添加到中间view
    [self.middleView addSubview:lrView];
    //创建注册界面
    DCLoginRegisterView *registerView = [DCLoginRegisterView registerView];
    registerView.dc_x = self.middleView.dc_width * 0.5;
    //添加到中间view
    [self.middleView addSubview:registerView];
    DCFastLoginView *fastView = [DCFastLoginView fastView];
    [self.bottleView addSubview:fastView];
}


//1.文本框光标变成白色

//2.文本框开始时，占位文字变成白色



//在viewDidLayoutSubviews中布局
- (void)viewDidLayoutSubviews {
    //一定要用super调用
    [super viewDidLayoutSubviews];
    //屏幕适配1
    DCLoginRegisterView *lrView = self.middleView.subviews[0];
    lrView.frame = CGRectMake(0, 0, self.middleView.dc_width * 0.5, self.middleView.dc_height);
    
    //屏幕适配2
    DCLoginRegisterView *registerView = self.middleView.subviews[1];
    registerView.frame = CGRectMake(self.middleView.dc_width * 0.5, 0, self.middleView.dc_width * 0.5, self.middleView.dc_height);
    
    //快速登陆
    DCFastLoginView *fastView = self.bottleView.subviews.firstObject;
    fastView.frame = self.bottleView.bounds;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
