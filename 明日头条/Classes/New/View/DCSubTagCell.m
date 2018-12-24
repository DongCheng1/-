//
//  DCSubTagCell.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/17.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCSubTagCell.h"
#import "DCSubTagItem.h"
#import <UIImageView+WebCache.h>
@interface DCSubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *numView;
@end

@implementation DCSubTagCell


- (void)setItem:(DCSubTagItem *)item {
    _item = item;
    //设置内容
    _nameView.text = item.theme_name;
    //订阅人数格式
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",item.sub_number];
    NSInteger num = item.sub_number.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",numF];
        numStr = [numStr stringByReplacingOccurrencesOfString:@"0.1" withString:@""];
    }
    _numView.text = numStr;
    //订阅栏图片设置
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

//这个方法从xib加载就会调用，只会调用一次
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 30;
    self.iconView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
