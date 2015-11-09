//
//  MytabBar.m
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "MytabBar.h"

@implementation MytabBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
      
 
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
   
    CGFloat w = self.bounds.size.width/5.0;
    CGFloat h = self.bounds.size.height;
    int index = 0;

    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [self bringSubviewToFront:subview];
        }
        
        if ([subview isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            subview.frame = CGRectMake(w*index, 0, w, h);
            
            if (index == 1) {
                index ++;
            }

            index ++;
  
        }
    }

    
}

@end
