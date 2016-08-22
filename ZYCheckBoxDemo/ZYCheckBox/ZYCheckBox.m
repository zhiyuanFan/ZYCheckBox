//
//  ZYCheckBox.m
//  ZYCheckBox
//
//  Created by ifilmo on 8/21/16.
//  Copyright © 2016 zhiyuanFan. All rights reserved.
//

#import "ZYCheckBox.h"

@interface ZYCheckBox() {
    UIButton *_checkBoxBtn;
    UIButton *_linkBtn;
    NSString *_checkTitle;
    NSString *_linkTitle;
    CGFloat _fontSize;
}

@end

@implementation ZYCheckBox

- (void)setChecked:(BOOL)checked {
    _checked = checked;
}

- (void)setNormalImage:(UIImage *)normalImage {
    _normalImage = normalImage;
    [_checkBoxBtn setImage:self.normalImage forState:UIControlStateNormal];
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    _selectedImage = selectedImage;
    [_checkBoxBtn setImage:self.selectedImage forState:UIControlStateSelected];
}

- (instancetype)initWithCheckTitle:(NSString *)checkTitle linkTitle:(NSString *)linkTitle fontSize:(CGFloat)fontSize {
    if (self = [super init]) {
        _checkTitle = checkTitle ? checkTitle : @"";
        _linkTitle = linkTitle ? linkTitle : @"";
        _fontSize = fontSize;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    _checkBoxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_checkBoxBtn addTarget:self action:@selector(changeCheckBoxStatus:) forControlEvents:UIControlEventTouchUpInside];
    _checkBoxBtn.selected = YES;
    [self setChecked:YES];
    _checkBoxBtn.titleLabel.font = [UIFont systemFontOfSize:_fontSize];
    [_checkBoxBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_checkBoxBtn setTitle:_checkTitle forState:UIControlStateNormal];
    [_checkBoxBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:_checkBoxBtn];
    
    
    _linkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_linkBtn addTarget:self action:@selector(showLink:) forControlEvents:UIControlEventTouchUpInside];
    [_linkBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:_linkTitle];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    _linkBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    _linkBtn.titleLabel.font = [UIFont systemFontOfSize:_fontSize];
    _linkBtn.titleLabel.attributedText = title;
    [_linkBtn setTitle:_linkTitle forState:UIControlStateNormal];
    [self addSubview:_linkBtn];
    
    [self setupUI];
}

- (void)setupUI {
    for (UIView *view in self.subviews) {view.translatesAutoresizingMaskIntoConstraints = NO;}
    NSDictionary *views = NSDictionaryOfVariableBindings(_checkBoxBtn,_linkBtn);
    NSDictionary *metrics = @{@"FontSize":@(_fontSize),@"margin":@(-0.5)};
    NSString *checkBoxVFL = @"V:|-[_checkBoxBtn(FontSize)]";
    NSString *protocolVFL = @"V:|-[_linkBtn(FontSize)]";
    NSString *hVFL;
    if ([_checkTitle isEqualToString:@""] && [_linkTitle isEqualToString:@""]) {
        hVFL = @"H:|-[_checkBoxBtn(0)]-(margin)-[_linkBtn(0)]";
    } else if ([_checkTitle isEqualToString:@""]) {
        hVFL = @"H:|-[_checkBoxBtn(0)]-(margin)-[_linkBtn]";
    } else if ([_linkTitle isEqualToString:@""]) {
        hVFL = @"H:|-[_checkBoxBtn]-(margin)-[_linkBtn(0)]";
    } else {
        hVFL = @"H:|-[_checkBoxBtn]-(margin)-[_linkBtn]";
    }
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:checkBoxVFL options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:protocolVFL options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:metrics views:views]];
    self.clipsToBounds = YES;
}

- (void)changeCheckBoxStatus:(UIButton *)checkBtn {
    checkBtn.selected = !checkBtn.selected;
    [self setChecked:checkBtn.selected];
    if ([self.delegate respondsToSelector:@selector(checkBox:didClickCheckButton:)]) {
        [self.delegate checkBox:self didClickCheckButton:checkBtn];
    }
}

- (void)showLink:(UIButton *)linkBtn {
    if ([self.delegate respondsToSelector:@selector(checkBox:didClickLinkButton:)]) {
        [self.delegate checkBox:self didClickLinkButton:linkBtn];
    }
}

@end
