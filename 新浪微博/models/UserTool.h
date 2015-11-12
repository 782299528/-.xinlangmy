//
//  UserTool.h
//  新浪微博
//
//  Created by mac on 15/11/12.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@interface UserTool : NSObject

+(instancetype)userTool;

- (void)saveUser:(UserModel *)user;
- (UserModel *)getUser;

@end
