//
//  vistorTableViewController.m
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "vistorTableViewController.h"
#import "vistorVIew.h"
#import "LoginVc.h"
#import "accountModel.h"
#import "accountTool.h"

@interface vistorTableViewController ()<vistorVIewDelegate>

@end

@implementation vistorTableViewController

//重写这个方法 根据用户是否登录来显示内容
- (void)loadView{
    accountTool *tool = [[accountTool alloc]init];
    accountModel *model =  [tool getAccount];
    if (model.access_token) {
        self.hasLogin = YES;
    }
    NSLog(@"%@",NSHomeDirectory());
 
    if (self.hasLogin == YES||self.mytag == 2) {
         [super loadView];
    }
    
    else{
        vistorVIew *view = [[vistorVIew alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.view = view;
        view.delegate = self;
        view.mytag = self.mytag;
    }
    
}


- (void)setMytag:(int)mytag{
    _mytag = mytag;
    accountTool *tool = [[accountTool alloc]init];
    accountModel *model =  [tool getAccount];

    switch (mytag) {
        case 0:
            
            if (!model.access_token) {
//            登录前
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRegist)];
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLogin)];
                [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
                [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
                self.navigationItem.title = @"首页";
            }else{
//                登陆后

                
            }
            
 
          
            break;
        case 1:
            
            break;
        case 2:
            
            if (!model.access_token) {
                //            登录前
                self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRegist)];
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLogin)];
                [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
                [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
            }else{
                //            登录后
            
            }
            
           break;
        case 3:
                self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(mySet)];
            
              [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
             break;
        default:
            break;
    }
}

//navbar点击注册
- (void)didClickRegist{
    NSLog(@"点击注册");

    
}
- (void)didClickLogin{
    NSLog(@"点击登录");
    
    LoginVc *login = [[LoginVc alloc]init];
    
    UINavigationController *logNav = [[UINavigationController alloc]initWithRootViewController:login];
//    login.modalPresentationStyle = UIModalPresentationFormSheet;
//    login.wantsFullScreenLayout = NO;
//    [self presentViewController:login animated:YES completion:nil];
    [self presentViewController:logNav animated:YES completion:nil];
    
    
    
}

- (void)mySet{
    NSLog(@"点击设置");
}

//代理方法
- (void)vistorView:(vistorVIew *)view didClicklogin:(UIButton *)btn{
    
    [self didClickLogin];
}
- (void)vistorView:(vistorVIew *)view didClickRegist:(UIButton *)btn{
    [self didClickRegist];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
