//
//  accountModel.h
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface accountModel : NSObject<NSCoding>
//    "access_token": "ACCESS_TOKEN",
//    "expires_in": 1234,
//    "remind_in":"798114",
//    "uid":"12341234"

@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,strong) NSNumber * expires_in;
@property (nonatomic,copy) NSString * remind_in;
@property (nonatomic,copy) NSString *uid;


+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
