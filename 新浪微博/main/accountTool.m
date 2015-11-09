//
//  accountTool.m
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "accountTool.h"

@implementation accountTool

- (void)saveAccount:(accountModel *)model{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"account.archive"];
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
}

- (id)getAccount{
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"account.archive"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}



@end
