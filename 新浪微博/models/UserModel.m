//
//  UserModel.m
//  新浪微博
//
//  Created by mac on 15/11/10.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.screen_name forKey:@"screen_name"];
    [aCoder encodeObject:self.profile_image_url forKey:@"profile_image_url"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.screen_name = [aDecoder decodeObjectForKey:@"screen_name"];
        self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
    }
    return self;
}

@end
