//
//  ViewController.m
//  ZYCheckBoxDemo
//
//  Created by ifilmo on 8/22/16.
//  Copyright © 2016 zhiyuanFan. All rights reserved.
//

#import "ViewController.h"
#import "ZYCheckBox.h"

@interface ViewController()<ZYCheckBoxDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZYCheckBox *checkBox = [[ZYCheckBox alloc] initWithCheckTitle:@"我同意相关" linkTitle:@"协议与条款" fontSize:13];
    checkBox.frame = CGRectMake(50, 50, 250, 50);
    checkBox.delegate = self;
    checkBox.normalImage = [UIImage imageNamed:@"agreeitems_checkbox_normal"];
    checkBox.selectedImage = [UIImage imageNamed:@"agreeitems_checkbox_highlight"];
    
    [self.view addSubview:checkBox];
    
    ZYCheckBox *checkBox2 = [[ZYCheckBox alloc] initWithCheckTitle:@"我准守" linkTitle:@"准则" fontSize:15];
    checkBox2.frame = CGRectMake(50, 120, 250, 50);
    checkBox2.delegate = self;
    checkBox2.normalImage = [UIImage imageNamed:@"unchecked"];
    checkBox2.selectedImage = [UIImage imageNamed:@"checked"];
    
    [self.view addSubview:checkBox2];
    
    
    ZYCheckBox *checkBox3 = [[ZYCheckBox alloc] initWithCheckTitle:@"请拨打" linkTitle:@"400-123456" fontSize:19];
    checkBox3.frame = CGRectMake(50, 190, 250, 50);
    checkBox3.delegate = self;
    
    [self.view addSubview:checkBox3];
    
    ZYCheckBox *checkBox4 = [[ZYCheckBox alloc] initWithCheckTitle:nil linkTitle:@"400-123456-123" fontSize:21];
    checkBox4.frame = CGRectMake(50, 260, 250, 50);
    checkBox4.delegate = self;
    
    [self.view addSubview:checkBox4];
    
    ZYCheckBox *checkBox5 = [[ZYCheckBox alloc] initWithCheckTitle:@"hello世界" linkTitle:nil fontSize:23];
    checkBox5.frame = CGRectMake(50, 330, 250, 50);
    checkBox5.delegate = self;
    
    [self.view addSubview:checkBox5];
}

#pragma mark - ZYCheckBoxDelegate
- (void)checkBox:(ZYCheckBox *)checkBox didClickCheckButton:(UIButton *)checkBtn {
    NSLog(@"%zd",checkBox.checked);
}

- (void)checkBox:(ZYCheckBox *)checkBox didClickLinkButton:(UIButton *)linkBtn {
    
    //如果是链接,跳转对应网页
    NSLog(@"jump to website");
    
    //如果是电话号码,则可以直接拨打(真机测试)
    NSMutableString *str=[[NSMutableString alloc]initWithFormat:@"telprompt://%@",linkBtn.titleLabel.text];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
}



@end
