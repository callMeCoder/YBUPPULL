//
//  YBTitleView.h
//  downPull
//
//  Created by pepinot on 16/4/26.
//  Copyright © 2016年 CMC. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, KTITLEVIEWTAG) {
    KTITLEVIEWTAGFIRST = 1000,
    KTITLEVIEWTAGSECOND = 2000,
    KTITLEVIEWTAGTHREE = 3000,
};
@interface YBTitleView : UIView

@property (nonatomic, copy) void(^__nullable scrollActionBlock)(KTITLEVIEWTAG titleViewTag);
+ (nullable instancetype)customTitleView;
@end
