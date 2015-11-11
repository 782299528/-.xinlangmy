//
//  AppDelegate.m
//  新浪微博
//
//  Created by mac on 15/11/6.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "MytabBarCon.h"
#import "newFeatureViewController.h"
#import "accountModel.h"
#import "accountTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    
//    加逻辑判断  跳哪个界面
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    NSString *rightNowVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    if (!localVersion||[localVersion compare:rightNowVersion] == NSOrderedAscending) {
//        如果是本地版本号没值或者本地版本号偏低,就显示新特性
        [[NSUserDefaults standardUserDefaults] setObject:rightNowVersion forKey:@"version"];
        
        newFeatureViewController *new = [[newFeatureViewController alloc]init];
        self.window.rootViewController = new;
    }else{
        MytabBarCon *main = [[MytabBarCon alloc]init];
        self.window.rootViewController = main;
    }
    
    
    [self.window makeKeyAndVisible];
    
//    取出账号 判断是否过期
    accountTool *tool = [[accountTool alloc]init];
    accountModel *account = [tool getAccount];
    NSNumber *timeInterval = account.expires_in;
    NSDate *creatDate = account.creatDate;
    
    NSDate *nowDate = [NSDate date];
    NSDate *outOfDate =[creatDate addTimeInterval:timeInterval.doubleValue];
    NSLog(@"%@%@",nowDate,outOfDate);
    
//    过期时间比当前时间小,说明过期
    if ([outOfDate compare:nowDate] == NSOrderedAscending) {
//        过期的话就删除账户
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *filePath = [docPath stringByAppendingPathComponent:@"account.archive"];
        NSFileManager *manager = [NSFileManager defaultManager];
        [manager removeItemAtPath:filePath error:nil];
    }
    
    

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
