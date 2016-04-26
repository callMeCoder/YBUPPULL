//
//  YBBaseCustomView.h
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YBBaseCustomView;
@protocol YBBaseCustomViewDelegate <NSObject>

@optional
- (void)customViewUpPullActionWithCustomViewOne:(nullable YBBaseCustomView *)customViewOne;

@end
@interface YBBaseCustomView : UIView<UIWebViewDelegate,UIScrollViewDelegate>
@property (nonatomic, copy,nullable) NSString *urlString;
@property (nonatomic, weak)id<YBBaseCustomViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
