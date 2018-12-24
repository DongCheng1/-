//
//  DCLoginRegisterView.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/19.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCLoginRegisterView.h"

@interface DCLoginRegisterView()
@property (weak, nonatomic) IBOutlet UIButton *buttonDL;
@end

@implementation DCLoginRegisterView
//类方法，返回xib视图
+ (instancetype)loginView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
+ (instancetype)registerView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
//让button登陆按钮背景图片不被拉伸
- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *image = self.buttonDL.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [self.buttonDL setBackgroundImage:image forState:UIControlStateNormal];
}
@end
