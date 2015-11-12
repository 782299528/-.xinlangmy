//
//  WelcomeViewController.m
//  新浪微博
//
//  Created by mac on 15/11/12.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MytabBarCon.h"
#import "AppDelegate.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface WelcomeViewController ()

@property (nonatomic,strong) UIImageView *back;
@property (nonatomic,strong) UILabel *welcomeLable;
@property (nonatomic,strong) UIImageView *iconView;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.back = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.back.image = [UIImage imageNamed:@"ad_background"];
    [self.view addSubview:self.back];
    
    [self setUI];
}
- (void)setUI{
    self.iconView = [[UIImageView alloc]init];
    __weak typeof (self) weakSelf = self;
      [self.view addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.mas_equalTo(weakSelf.back.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.back.mas_centerY).offset(-200);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];

  

    UIImage *image = [UIImage imageNamed:@"avatar_default_big"];
    NSURL *imgUrl = [NSURL URLWithString:self.imgUrl];
    [self.iconView sd_setImageWithURL:imgUrl placeholderImage:image options:SDWebImageHighPriority];

    self.iconView.layer.cornerRadius = 40;
    self.iconView.clipsToBounds = YES;
    self.welcomeLable = [[UILabel alloc]init];
    NSString *text = [NSString stringWithFormat:@"新浪欢迎你,%@",self.userName];
     self.welcomeLable.numberOfLines = 0;
    CGSize size = [text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    
    [self.view addSubview:self.welcomeLable];
    [self.welcomeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
        make.height.mas_equalTo(70);
        make.centerX.mas_equalTo(self.back.mas_centerX);
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(10);
    }];
    self.welcomeLable.text = text;
    self.welcomeLable.textColor = [UIColor lightGrayColor];
    self.welcomeLable.textAlignment = NSTextAlignmentCenter;
    self.welcomeLable.font = [UIFont systemFontOfSize:16];

}

- (void)viewDidAppear:(BOOL)animated{
    self.welcomeLable.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
         self.welcomeLable.alpha = 1;
    }];
    
    [UIView animateWithDuration:1.0 // 动画时长
                          delay:0.0 // 动画延迟
         usingSpringWithDamping:0.2 // 类似弹簧振动效果 0~1
          initialSpringVelocity:1.8 // 初始速度
                        options:UIViewAnimationOptionCurveEaseInOut // 动画过渡效果
                     animations:^{
                         // code...
                         CGPoint point = self.iconView.center;
                         point.y += 50;
                         [self.iconView setCenter:point];
                     } completion:^(BOOL finished) {

                             MytabBarCon *controller = [[MytabBarCon alloc]init];
                             UIWindow *window = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
                             window.rootViewController = controller;

                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
