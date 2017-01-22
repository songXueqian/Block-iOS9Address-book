//
//  FirstViewController.m
//  block
//
//  Created by 宋学谦 on 16/1/13.
//  Copyright © 2016年 Song Xueqian. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"回调";
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    self.textField.placeholder = @"请输入......";
    self.textField.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    label.text = @"下一页";
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back2:)];
    [label addGestureRecognizer:tap2];
    
    
}


- (void)back:(UITapGestureRecognizer *)tap{
    
   
    self.BackBlock1(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)back2:(UITapGestureRecognizer *)tap{
    
    SecondViewController *secVC = [[SecondViewController alloc] init];    
    [self.navigationController pushViewController:secVC animated:YES];
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
