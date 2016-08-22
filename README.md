# ZYCheckBox

A ZYCheckBox object is a view permits the user to make a binary choice.
这是一个类似CheckBox功能的控件,该控件分为两部分,一部分是确认 用户是否点击选择 , 另一部分 可以处理 后半部加下划线的文字的 点击事件.

在代理方法- (void)checkBox:(ZYCheckBox *)checkBox didClickLinkButton:(UIButton *)linkBtn;中,
既可以 实现跳转至对应协议条款页面, 也可以 实现拨打电话功能

在代理方法- (void)checkBox:(ZYCheckBox *)checkBox didClickCheckButton:(UIButton *)checkBtn;中,
可以获取用户是否同意 相关协议, 从而判断按钮是否禁用,或下一步操作是否继续.


# 使用方式
1. 导入头文件 #import "ZYCheckBox.h"
2. 遵循协议"<ZYCheckBoxDelegate>"
3. 使用
```
ZYCheckBox *checkBox = [[ZYCheckBox alloc] initWithCheckTitle:@"我同意相关" linkTitle:@"协议与条款" fontSize:13];
checkBox.delegate = self;
//选择的图片最好是@2x和@3x的
checkBox.normalImage = [UIImage imageNamed:@"agreeitems_checkbox_normal"];
checkBox.selectedImage = [UIImage imageNamed:@"agreeitems_checkbox_highlight"];
```
4. 在代理方法中监听事件
```
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
```
![image](https://github.com/zhiyuanFan/ZYCheckBox/raw/master/Demo.png)
