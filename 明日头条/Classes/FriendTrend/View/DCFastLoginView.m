//
//  DCFastLoginView.m
//  Baisibudejie
//
//  Created by 董成 on 2018/12/20.
//  Copyright © 2018 董成. All rights reserved.
//

#import "DCFastLoginView.h"

@implementation DCFastLoginView

+ (instancetype)fastView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
