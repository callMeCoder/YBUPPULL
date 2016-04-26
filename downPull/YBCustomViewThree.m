//
//  YBCustomViewThree.m
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "YBCustomViewThree.h"

@implementation YBCustomViewThree

+ (nullable instancetype)customViewThree
{
    return [[NSBundle mainBundle] loadNibNamed:@"YBCustomViewThree" owner:nil options:nil].lastObject;
}

@end
