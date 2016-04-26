//
//  YBBaseCustomView.m
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "YBBaseCustomView.h"

@interface YBBaseCustomView ()

@end


@implementation YBBaseCustomView
- (void)setUrlString:(NSString *)urlString
{
     _urlString = urlString;
     self.webView.delegate = self;
     self.webView.scrollView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [self.webView loadRequest:request];   
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(scrollView.contentOffset.y < 0){
        if ([self.delegate respondsToSelector:@selector(customViewUpPullActionWithCustomViewOne:)]) {
            [self.delegate customViewUpPullActionWithCustomViewOne:self];
        }
    }
}
@end
