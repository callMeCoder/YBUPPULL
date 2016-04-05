//
//  ViewController.m
//  downPull
//
//  Created by pepinot on 16/1/21.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    OneViewController *one = [[OneViewController alloc] init];
    [self.navigationController pushViewController:one animated:YES];
}
@end
