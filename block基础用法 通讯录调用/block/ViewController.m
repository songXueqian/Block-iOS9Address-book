//
//  ViewController.m
//  block
//
//  Created by 宋学谦 on 16/1/13.
//  Copyright © 2016年 Song Xueqian. All rights reserved.
//


//此demo两个功能
//1.block回调传值
//  block Controller中上面是一个空白label,下面是跳转label,给了手势点击方法
//  回调 Controller中一个textField,输入值后，点击空白处把值回传给block Controller中上面的空白label
//2.iOS9后，调用系统通讯录，取通讯录中值的方法
//  block Controller中上面是一个空白label,给了手势点击方法,方法中是调用系统通讯录

//3.调用window 盖住navcontroller 的大灰背景
//4.OC基础方法


#import "ViewController.h"
#import "FirstViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import <ContactsUI/CNContactPickerViewController.h>
#import <ContactsUI/CNContactViewController.h>

@interface ViewController ()<CNContactPickerDelegate, CNContactViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"block";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 150, 30)];
    self.label.textColor = [UIColor blackColor];
    self.label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 150, 30)];
    self.label2.textColor = [UIColor blackColor];
    self.label2.backgroundColor = [UIColor whiteColor];
    self.label2.text = @"下一页";
    self.label2.textAlignment = 1;
    [self.view addSubview:self.label2];
    self.label2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    [self.label2 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(phone:)];
    [self.view addGestureRecognizer:tap2];
    
    //4.OC基础方法
    //创建一个时间对象
    NSDate * date = [NSDate date];
    //打印时间
    NSLog(@"today is %@",date);
    
    //再获取的时间date减去24小时的时间（昨天的这个时候）
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];
    NSLog(@"yesterday is %@",yesterday);//打印昨天的时间
    
    /*字符串换成时间*/
    //设置一个字符串的时间
    NSString *datestring = [NSString stringWithFormat:@"1999-09-03"];
    //想要设置自己想要的格式，可以用nsdateformatter这个类，这里是初始化
    NSDateFormatter *dm = [[NSDateFormatter alloc] init];
    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
    [dm setDateFormat:@"yyyy-MM-dd"];
    //把字符串的时间转换成Date对象，用dateFromString方法
    NSDate * newdate = [dm dateFromString:datestring];
    //输出
    NSLog(@"newdate is %@",newdate);
    
    
    /*把时间转换成字符串*/
    //把Date对象转换成String对象  用stringFromDate方法
    NSString * datestring2 = [dm stringFromDate:newdate];
    //打印
    NSLog(@"datestring2 is %@",datestring2);

    self.view.layer.masksToBounds = YES;
    self.view.layer.cornerRadius = 10;
  
    
    //3.调用window 盖住navcontroller 的大灰背景
//    self.watiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//    self.watiView.backgroundColor = [UIColor lightGrayColor];
//    [[UIApplication sharedApplication].keyWindow addSubview:self.watiView];

       
}


//1.block回调传值
//按钮点击事件方法，block回调
- (void)next:(UITapGestureRecognizer *)tap{
    

    //block方法顺序 先走外面，后走block中方法
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    
    // block回调方法[self resetLabel]
    firstVC.BackBlock1 = ^(NSString *string) {
        [self resetLabel:string];

    };
    
    [self.navigationController pushViewController:firstVC animated:YES];
    
}

- (void)resetLabel:(NSString *)str{
    //弱引用 避免循环引用
    __weak ViewController *weakSelf = self;

//    self.label.text = str;
    
    weakSelf.label.text = str;
}



//2.iOS9后，调用系统通讯录，及取通讯录中值的方法
- (void)phone:(UITapGestureRecognizer *)tap{
    
    //调用系统通讯录
    CNContactPickerViewController * con = [[CNContactPickerViewController alloc]init];
    con.delegate = self;
    [self presentViewController:con animated:YES completion:nil];
    
    
    
    //取出系统通讯录里的名子和电话号码
    CNContactStore * stroe = [[CNContactStore alloc]init];
    CNContactFetchRequest * request = [[CNContactFetchRequest alloc]initWithKeysToFetch:@[CNContactGivenNameKey,CNContactMiddleNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey]];
    
    //下面block中要输出得NSLog在上面request中必须要有,否则会崩溃
    [stroe enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        NSLog(@"name ======= %@", contact.familyName);
        NSLog(@"contact ======= %@", contact);
        for (CNLabeledValue *number in contact.phoneNumbers) {
            CNPhoneNumber *value = number.value;
            NSLog(@"phone ==== %@", value.stringValue);
        }
        
    }];
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
