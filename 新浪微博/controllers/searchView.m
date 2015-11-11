//
//  searchView.m
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "searchView.h"

@interface searchView ()
@property (nonatomic,strong) UITextField *field;
@end

@implementation searchView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.field = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        UIImageView *leftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.height-15, self.bounds.size.height-15)];
        leftView.image = [UIImage imageNamed:@"tabbar_discover"];
//        leftView.contentMode = UIViewContentModeCenter;
        self.field.leftView = leftView;
//        UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
//        rightBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
//        rightBtn.backgroundColor = [UIColor clearColor];
//        [rightBtn setTitle:@"取消" forState:UIControlStateNormal];
//        rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//        rightBtn.tintColor = [UIColor blackColor];
//        rightBtn.contentMode = UIViewContentModeCenter;
//        self.field.rightView = rightBtn;
//        self.field.rightViewMode = UITextFieldViewModeAlways;
        self.field.leftViewMode = UITextFieldViewModeAlways;
        self.field.placeholder = @"微博搜索";
        self.field.font = [UIFont systemFontOfSize:15];
        self.field.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:self.field];
        
    }
    return self;
}

@end
