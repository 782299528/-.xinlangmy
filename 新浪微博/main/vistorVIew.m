//
//  vistorVIew.m
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "vistorVIew.h"
#import "Masonry.h"
@interface vistorVIew ()

@property (nonatomic,strong)UIImageView *iconVIew;
@property (nonatomic,strong)UILabel *lab;
@property (nonatomic,strong)UIButton *registerBtn;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIImageView *scroll;

@end

@implementation vistorVIew

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
        self.iconVIew = [[UIImageView alloc]init];
        
        [self addSubview:self.iconVIew];
        
        //设置iconview的自动布局
        self.iconVIew.translatesAutoresizingMaskIntoConstraints = NO;
      NSLayoutConstraint *con1 =  [NSLayoutConstraint constraintWithItem:self.iconVIew attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];

        NSLayoutConstraint *con2= [NSLayoutConstraint constraintWithItem:self.iconVIew attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-100];

          NSLayoutConstraint *con3 =  [NSLayoutConstraint constraintWithItem:self.iconVIew attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:130];

      NSLayoutConstraint *con4 =  [NSLayoutConstraint constraintWithItem:self.iconVIew attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:130];
//        self.iconVIew.backgroundColor = [UIColor redColor];

        [self addConstraint:con1];
         [self addConstraint:con2];
         [self addConstraint:con3];
         [self addConstraint:con4];
        
        
        self.lab = [[UILabel alloc]init];
        [self addSubview:self.lab];
//        self.lab.backgroundColor = [UIColor redColor];
        self.lab.translatesAutoresizingMaskIntoConstraints = NO;
        self.lab.textAlignment = NSTextAlignmentCenter;
        self.lab.font = [UIFont systemFontOfSize:14];
        self.lab.textColor = [UIColor lightGrayColor];
        self.lab.numberOfLines = 0;
        

    }
    return self;
}

- (void)setMytag:(int)mytag{
    _mytag = mytag;
    //设置tab的自动布局
    NSLayoutConstraint *cons1 = [NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.iconVIew attribute:NSLayoutAttributeBottom multiplier:1 constant:10];
    NSLayoutConstraint *cons2 = [NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.iconVIew attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *cons3 = [NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300];
    
    if (mytag == 0) {
        NSString *text = @"关注一些人,看看有什么惊喜";
        CGSize size = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
           cons1 = [NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.iconVIew attribute:NSLayoutAttributeBottom multiplier:1 constant:60];
        
        NSLayoutConstraint *cons4 =[NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
        [self addConstraint:cons4];
        self.lab.text = text;
        
        self.iconVIew.image= [UIImage imageNamed:@"visitordiscover_feed_image_house"];
        
        
//        添加转轮
        UIImageView *scroll = [[UIImageView alloc]init];
        self.scroll = scroll;
        [self addSubview:self.scroll];
        scroll.translatesAutoresizingMaskIntoConstraints = NO;
        NSLayoutConstraint *con1 =  [NSLayoutConstraint constraintWithItem:self.scroll attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
        
        NSLayoutConstraint *con2= [NSLayoutConstraint constraintWithItem:self.scroll attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:-90];
        
        NSLayoutConstraint *con3 =  [NSLayoutConstraint constraintWithItem:self.scroll attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:230];
        
        NSLayoutConstraint *con4 =  [NSLayoutConstraint constraintWithItem:self.scroll attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:230];
        [self addConstraint:con1];
        [self addConstraint:con2];
        [self addConstraint:con3];
        [self addConstraint:con4];
        self.scroll.image = [UIImage imageNamed:@"visitordiscover_feed_image_smallicon"];
        
        self.scroll.layer.anchorPoint = CGPointMake(0.5, 0.5);
        
        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rotate) userInfo:nil repeats:YES];
        
        
        
    }
    if (mytag == 1) {
        NSString *text = @"登陆后,别人评论你的微薄,给你发消息,都会在这里收到通知";
        CGSize size = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        NSLayoutConstraint *cons4 =[NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
        [self addConstraint:cons4];
        self.lab.text = text;
        self.iconVIew.image= [UIImage imageNamed:@"visitordiscover_image_message"];
    }
    if (mytag == 3) {
        NSString *text = @"登陆后,你的微薄,相册,个人资料会显示在这里,展示给他人";
        CGSize size = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        
        NSLayoutConstraint *cons4 =[NSLayoutConstraint constraintWithItem:self.lab attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
        [self addConstraint:cons4];
        self.lab.text = text;
         self.iconVIew.image= [UIImage imageNamed:@"visitordiscover_image_profile"];
    }
    
    [self addConstraint:cons1];
    [self addConstraint:cons2];
    [self addConstraint:cons3];

//            自动布局注册按钮
    self.registerBtn = [[UIButton alloc]init];
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:self.registerBtn];
    [self.registerBtn addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab.mas_bottom).offset(10);
        make.left.mas_equalTo(self.lab.mas_left).offset(+35);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    self.loginBtn = [[UIButton alloc]init];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
      [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"common_button_white_disable"] forState:UIControlStateNormal];
     [self.loginBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self addSubview:self.loginBtn];
    [self.loginBtn addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lab.mas_bottom).offset(10);
        make.right.mas_equalTo(self.lab.mas_right).offset(-35);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
        
    }];
}


- (void)registerClicked:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(vistorView:didClickRegist:)]) {
        [self.delegate vistorView:self didClickRegist:btn];
    }
}

- (void)loginClicked:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(vistorView:didClicklogin:)]) {
        [self.delegate vistorView:self didClicklogin:btn];
    }
}

         - (void)rotate{
             self.scroll.layer.affineTransform = CGAffineTransformRotate(self.scroll.layer.affineTransform, M_PI_2/100);
         }

@end
