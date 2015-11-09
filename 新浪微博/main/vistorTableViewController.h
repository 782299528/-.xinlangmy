//
//  vistorTableViewController.h
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "vistorVIew.h"
@interface vistorTableViewController : UITableViewController

@property(nonatomic,strong)vistorVIew *vistorView;
@property (nonatomic,assign) BOOL hasLogin;
@property (nonatomic,assign) int mytag;

@end
