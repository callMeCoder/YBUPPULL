//
//  YBCustomView.m
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "YBCustomViewOne.h"

@interface YBCustomViewOne ()


@end

@implementation YBCustomViewOne
+ (nullable instancetype)customViewOne
{
    return [[NSBundle mainBundle] loadNibNamed:@"YBCustomViewOne" owner:nil options:nil].lastObject;
}
@end
