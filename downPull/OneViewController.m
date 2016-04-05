//
//  OneViewController.m
//  downPull
//
//  Created by pepinot on 16/1/21.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UIScrollViewDelegate,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak)UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.delegate = self;
    UIView *down = [[UIView alloc] initWithFrame:CGRectMake(0, 667, 375, 667)];
    [self.contentView addSubview:down];
    down.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    UIWebView *webView = [[UIWebView alloc] init];
    self.webView = webView;
    webView.frame = self.view.bounds;
    [down addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    
    [webView loadRequest:request];
    webView.delegate = self;
    webView.scrollView.delegate = self;
}
- (void)add
{
      NSLog(@"%s",__FUNCTION__);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y  > scrollView.contentSize.height - [UIScreen mainScreen].bounds.size.height && scrollView.contentOffset.y != -64 && [scrollView isEqual:self.scrollView]) {
        
        [UIView animateWithDuration:0.25f animations:^{
            self.contentView.transform = CGAffineTransformMakeTranslation(0, -[UIScreen mainScreen].bounds.size.height);
        }completion:^(BOOL finished) {
            
        }];
    }
    
    if ([scrollView isEqual:self.webView.scrollView]) {
        NSLog(@"%f",scrollView.contentOffset.y);
        if(scrollView.contentOffset.y < 0){
            [UIView animateWithDuration:0.25f animations:^{
                self.contentView.transform = CGAffineTransformIdentity;
            }];
        }
    }
}
@end
