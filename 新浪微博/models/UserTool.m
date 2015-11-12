//
//  UserTool.m
//  新浪微博
//
//  Created by mac on 15/11/12.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "UserTool.h"

@implementation UserTool

static id _instance;
+ (instancetype)userTool{
    if (_instance == nil) {
        @synchronized(self) {
            if (_instance == nil) {
                _instance = [[self alloc]init];
            }
        }
    }
    return _instance;
}

- (void)saveUser:(UserModel *)user{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"user.archiver"];
    [NSKeyedArchiver archiveRootObject:user toFile:filePath];

}

- (UserModel *)getUser{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"user.archiver"];
    UserModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return model;

}

@end
