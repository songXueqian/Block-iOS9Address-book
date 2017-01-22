//
//  SecondViewController.m
//  block
//
//  Created by 宋学谦 on 2017/1/20.
//  Copyright © 2017年 Song Xueqian. All rights reserved.
//

#import "SecondViewController.h"
#import "PushState.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"第三页";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    self.textField.placeholder = @"请输入......";
    self.textField.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    [self.view addGestureRecognizer:tap];


    [self xing:@"" midXing:@"" name:^(NSString *str, NSInteger num) {
        self.textField.text = [NSString stringWithFormat:@"%@/////%ld", str, (long)num];
    }];
}

- (void)back:(UITapGestureRecognizer *)tap{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (void)xing:(NSString *)str1 midXing:(NSString *)str2 name:(BackStr)str3{
    
    str1 = @"111111";
    str2 = @"222222";
    str3(@"3333333", 2);
}

- (void)action{
    PushState *string = [PushState PushStateManage];
    string.stateString = @"123123";
    NSLog(@"string.stateString ====== %@", string.stateString);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
