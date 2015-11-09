//
//  MytabBarCon.m
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "MytabBarCon.h"
#import "meTableViewController.h"
#import "discoverTableViewController.h"
#import "messageTableViewController.h"
#import "firstTableViewController.h"
#import "navCon.h"
#import "MytabBar.h"

@interface MytabBarCon ()

@end

@implementation MytabBarCon



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    firstTableViewController *first = [[firstTableViewController alloc]initWithStyle:UITableViewStylePlain];
    messageTableViewController *message = [[messageTableViewController alloc]initWithStyle:UITableViewStylePlain];
    discoverTableViewController *discover = [[discoverTableViewController alloc]initWithStyle:UITableViewStylePlain];
    meTableViewController *me = [[meTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    navCon *nav1 = [[navCon alloc]initWithRootViewController:first];
     navCon *nav2 = [[navCon alloc]initWithRootViewController:message];
     navCon *nav3 = [[navCon alloc]initWithRootViewController:discover];
     navCon *nav4 = [[navCon alloc]initWithRootViewController:me];
    
    [self addChildViewController:nav1];
    [self addChildViewController:nav2];
    [self addChildViewController:nav3];
    [self addChildViewController:nav4];
    
    UIImage *old1 = [UIImage imageNamed:@"tabbar_home"];
    UIImage *new1 = [old1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [nav1.tabBarItem setImage:new1 ];
    [nav1.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_home_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nav2.tabBarItem setImage:[[UIImage imageNamed:@"tabbar_message_center"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav2.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_message_center_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nav3.tabBarItem setImage:[[UIImage imageNamed:@"tabbar_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav3.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_discover_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nav4.tabBarItem setImage:[[UIImage imageNamed:@"tabbar_profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav4.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar_profile_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nav1.tabBarItem setTitle:@"主页"];
    [nav2.tabBarItem setTitle:@"消息"];
    [nav3.tabBarItem setTitle:@"发现"];
    [nav4.tabBarItem setTitle:@"更多"];
    
//    nav1.title = @"主页";
    
    [nav1.tabBarItem setTitleTextAttributes:@{
                                              NSForegroundColorAttributeName:[UIColor orangeColor]
                                             } forState:UIControlStateSelected];
    [nav2.tabBarItem setTitleTextAttributes:@{
                                              NSForegroundColorAttributeName:[UIColor orangeColor]
                                              } forState:UIControlStateSelected];
    [nav3.tabBarItem setTitleTextAttributes:@{
                                              NSForegroundColorAttributeName:[UIColor orangeColor]
                                              } forState:UIControlStateSelected];
    [nav4.tabBarItem setTitleTextAttributes:@{
                                              NSForegroundColorAttributeName:[UIColor orangeColor]
                                              } forState:UIControlStateSelected];
    
    //自定义导航栏

    MytabBar *tabBar = [[MytabBar alloc]init];
    [self setValue:tabBar forKey:@"tabBar"];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(tabBar.bounds.size.width/5.0*2, -20, tabBar.bounds.size.width/5.0, tabBar.bounds.size.height)];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
//    btn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    [self.tabBar addSubview:btn];

    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
