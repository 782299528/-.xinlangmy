//
//  vistorVIew.h
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class vistorVIew;
@protocol vistorVIewDelegate <NSObject>

- (void)vistorView:(vistorVIew *)view didClickRegist:(UIButton *)btn;
- (void)vistorView:(vistorVIew *)view didClicklogin:(UIButton *)btn;

@end

@interface vistorVIew : UIView

@property (nonatomic,assign) int mytag;

@property (nonatomic,weak) id<vistorVIewDelegate>delegate;

@end
