//
//  YBCustomViewTwo.m
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "YBCustomViewTwo.h"

@implementation YBCustomViewTwo
+ (nullable instancetype)customViewTwo
{
    return [[NSBundle mainBundle] loadNibNamed:@"YBCustomViewTwo" owner:nil options:nil].lastObject;
}

@end
