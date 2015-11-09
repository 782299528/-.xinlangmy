//
//  accountTool.h
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "accountModel.h"
@interface accountTool : NSObject

- (void)saveAccount:(accountModel *)model;

- (id)getAccount;

@end
