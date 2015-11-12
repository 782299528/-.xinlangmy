//
//  UserModel.h
//  新浪微博
//
//  Created by mac on 15/11/10.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *screen_name;
@property (nonatomic,copy) NSString *profile_image_url;

@end
