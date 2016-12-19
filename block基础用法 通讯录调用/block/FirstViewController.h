//
//  FirstViewController.h
//  block
//
//  Created by 宋学谦 on 16/1/13.
//  Copyright © 2016年 Song Xueqian. All rights reserved.
//

#import <UIKit/UIKit.h>

//申明BackBlock(字符串类型)
typedef  void(^BackBlock)(NSString *string);



@interface FirstViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *textField;

// 用上面申明的BackBlock设置一个属性BackBlock
@property (nonatomic, copy) BackBlock BackBlock1;





@end
