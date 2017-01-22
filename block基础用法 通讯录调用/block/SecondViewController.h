//
//  SecondViewController.h
//  block
//
//  Created by 宋学谦 on 2017/1/20.
//  Copyright © 2017年 Song Xueqian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackStr)(NSString *str, NSInteger num);

@interface SecondViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *textField;

@property (nonatomic, copy)BackStr backStr;

- (void)xing:(NSString *)str1 midXing:(NSString *)str2 name:(BackStr)str3;
- (void)action;
@end
