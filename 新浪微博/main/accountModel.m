//
//  accountModel.m
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "accountModel.h"

@implementation accountModel

+(instancetype)modelWithDict:(NSDictionary *)dict{
    accountModel *model = [[accountModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict
     ];
    
    return model;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
//    @property (nonatomic,copy) NSString *access_token;
//    @property (nonatomic,assign) NSInteger expires_in;
//    @property (nonatomic,assign) NSInteger remind_in;
//    @property (nonatomic,copy) NSString *uid;
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.creatDate forKey:@"creatDate"];

}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.creatDate = [aDecoder decodeObjectForKey:@"creatDate"];
    }
    return self;
}

//accesstocken是和creat关联的 所以重写set方法
- (void)setAccess_token:(NSString *)access_token{
    _access_token = access_token;
    _creatDate = [NSDate date];
}

@end
