//
//  ZYCheckBox.h
//  ZYCheckBox
//
//  Created by ifilmo on 8/21/16.
//  Copyright © 2016 zhiyuanFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYCheckBox;
@protocol ZYCheckBoxDelegate <NSObject>

@optional
- (void)checkBox:(ZYCheckBox *)checkBox didClickCheckButton:(UIButton *)checkBtn;
- (void)checkBox:(ZYCheckBox *)checkBox didClickLinkButton:(UIButton *)linkBtn;

@end


@interface ZYCheckBox : UIView

@property (nonatomic, assign, readonly) BOOL checked;
@property (nonatomic, weak) id<ZYCheckBoxDelegate> delegate;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;

- (instancetype)initWithCheckTitle:(NSString *)checkTitle linkTitle:(NSString *)linkTitle fontSize:(CGFloat)fontSize;

@end