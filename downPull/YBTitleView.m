//
//  YBTitleView.m
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import "YBTitleView.h"
#import "UIView+Ex.h"

@interface YBTitleView ()
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;

@end

@implementation YBTitleView
{
    UIView *_tempView;
    UIView *_bottomLineView;
}

+ (nullable instancetype)customTitleView
{
    return [[NSBundle mainBundle] loadNibNamed:@"YBTitleView" owner:nil options:nil].firstObject;
}
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    {
        _bottomLineView = [UIView new];
        _bottomLineView.frame = CGRectMake(0, frame.size.height - 2, frame.size.width / 3.f, 2);
        _bottomLineView.backgroundColor = [UIColor redColor];
        [self addSubview:_bottomLineView];
    }
}
- (IBAction)titleViewClickAction:(UITapGestureRecognizer *)sender
{
    if (_tempView.tag == sender.view.tag) {
        return;
    }
    
    if (sender.view.tag == KTITLEVIEWTAGFIRST) {
        [UIView animateWithDuration:.25f animations:^{
            _bottomLineView.x = self.firstView.x;
        }];
    }else if (sender.view.tag == KTITLEVIEWTAGSECOND){
        [UIView animateWithDuration:.25f animations:^{
            _bottomLineView.x = self.secondView.x;
        }];
    }else{
        [UIView animateWithDuration:.25f animations:^{
            _bottomLineView.x = self.thirdView.x;
        }];
    }
    _tempView = sender.view;
    if (self.scrollActionBlock) {
        self.scrollActionBlock(sender.view.tag);
    }
}
@end
