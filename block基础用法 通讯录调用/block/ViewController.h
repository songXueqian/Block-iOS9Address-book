//
//  ViewController.h
//  block
//
//  Created by 宋学谦 on 16/1/13.
//  Copyright © 2016年 Song Xueqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UILabel *label2;
@property (nonatomic, strong)UIButton *button;

@property (nonatomic, strong)UIView *watiView;

//- (void)apiGet:(NSString *)function Dat:(id)dat Result:(void (^)(id result_data, NSInteger result_status, NSString *api))result;




@end

