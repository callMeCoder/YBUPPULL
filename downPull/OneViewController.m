//
//  OneViewController.m
//  downPull
//
//  Created by pepinot on 16/1/21.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "OneViewController.h"
#import "UIView+Ex.h"
#import "YBCustomViewOne.h"
#import "YBCustomViewThree.h"
#import "YBCustomViewTwo.h"
#import "YBTitleView.h"
#define SCREEN_HIGTH [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define ITEMINDEX 3
@interface OneViewController ()<UIScrollViewDelegate,UIWebViewDelegate,YBBaseCustomViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewHeight;

@end

@implementation OneViewController
{
    UIView *_customScrollView;
    YBCustomViewOne *_oneView;
    YBCustomViewTwo *_twoView;
    YBCustomViewThree *_threeView;
    UIView *_downView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.contentHeight.constant = SCREEN_HIGTH * 2;
    self.scrollViewHeight.constant = SCREEN_HIGTH;
    [self.contentView layoutIfNeeded];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView.contentOffset.y  > scrollView.contentSize.height - SCREEN_HIGTH + 64 && scrollView.contentOffset.y != -64 && [scrollView isEqual:self.scrollView]) {// 上拉幅度
        [UIView animateWithDuration:0.4f animations:^{
            if (SCREEN_HIGTH == 480) {
                self.contentView.y = - SCREEN_HIGTH;
            }else{
                self.contentView.transform = CGAffineTransformMakeTranslation(0, - SCREEN_HIGTH);
            }
        }completion:^(BOOL finished) {
            [self downView];
        }];
    }
}
/**  上拉后弹出的View*/
- (void)downView
{
    if (_downView == nil) {
         // 下半部分的容器View
        _downView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HIGTH, SCREEN_WIDTH, SCREEN_HIGTH)];
        [self.contentView addSubview:_downView];
        
        
        {
            YBTitleView *titleView = [YBTitleView customTitleView];
            titleView.frame = CGRectMake(0, 64, _downView.width, 40);
            [titleView setScrollActionBlock:^(KTITLEVIEWTAG titleTag) {
                    if (titleTag == KTITLEVIEWTAGFIRST) {
                        if (_oneView) {
                            [_customScrollView bringSubviewToFront:_oneView];
                        }
                    }else if (titleTag == KTITLEVIEWTAGSECOND){
                        if (_twoView) {
                            [_customScrollView bringSubviewToFront:_twoView];
                        }else{
                            _twoView = [YBCustomViewTwo customViewTwo];
                            [self setUpCustomViewWithBaseCustomView:_twoView];
                            _twoView.urlString = @"https://www.google.com";
                        }
                    }else{
                        if (_threeView) {
                            [_customScrollView bringSubviewToFront:_threeView];
                        }else{
                            _threeView = [YBCustomViewThree customViewThree];
                            [self setUpCustomViewWithBaseCustomView:_threeView];
                            _threeView.urlString = @"https://github.com";
                        }
                    }
                    NSLog(@"%zd",_customScrollView.subviews.count);
            }];
            [_downView addSubview:titleView];
        }
         // 左右滑动的scrollView
        {
            _customScrollView = [[UIScrollView alloc] init];
            _customScrollView.frame = CGRectMake(0, 64 + 40, _downView.width * ITEMINDEX, _downView.height - _customScrollView.y);
            [_downView addSubview:_customScrollView];
            
        }
        {
            _oneView = [YBCustomViewOne customViewOne];
            [self setUpCustomViewWithBaseCustomView:_oneView];
            _oneView.urlString = @"https://www.baidu.com";
        }
    }
}
- (void)setUpCustomViewWithBaseCustomView:(YBBaseCustomView *)baseCustomView
{
    baseCustomView.delegate = self;
    baseCustomView.frame = CGRectMake(0, 0, _downView.width, _downView.height- _customScrollView.y);
    [_customScrollView addSubview:baseCustomView];
}
#pragma mark -
#pragma mark - 自定义视图回调
- (void)customViewUpPullActionWithCustomViewOne:(YBBaseCustomView *)customViewOne
{
    [self upActionWithWebView:customViewOne.webView];
}
- (void)upActionWithWebView:(UIWebView *)webView
{
    if(webView.scrollView.contentOffset.y < 0){
        [UIView animateWithDuration:0.4f animations:^{
            if (SCREEN_HIGTH == 480) {
                self.contentView.y = 0;
            }else{
                self.contentView.transform = CGAffineTransformIdentity;
            }
        }completion:^(BOOL finished) {
            
        }];
    }
}
@end
