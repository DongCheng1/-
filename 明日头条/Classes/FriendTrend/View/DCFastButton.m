//
//  DCFastButton.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/21.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCFastButton.h"
#import "UIView+Frame.h"

@implementation DCFastButton

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置图片的位置
    self.imageView.dc_y = 0;
    self.imageView.dc_centerX = self.dc_width * 0.5;
    //设置标题的位置
    self.titleLabel.dc_y = self.dc_height - self.titleLabel.dc_height;
    //计算一下文字的宽度，设置label的宽度
    [self.titleLabel sizeToFit];
    self.titleLabel.dc_centerX = self.dc_width * 0.5;
    
}

@end
