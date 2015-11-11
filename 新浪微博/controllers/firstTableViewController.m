//
//  firstTableViewController.m
//  新浪微博
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "firstTableViewController.h"
#import "AFNetworking.h"
#import "accountTool.h"
#import "accountModel.h"
#import "MJExtension.h"
#import "UserModel.h"
#import "statusModel.h"
#import "MJRefresh.h"

@interface firstTableViewController ()

@property (nonatomic,strong) NSMutableArray *modelArr;


@end

@implementation firstTableViewController

//https://api.weibo.com/2/users/show.json

- (NSMutableArray *)modelArr{
    
    if (_modelArr == nil) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

- (void)loadView{
//    NSLog(@"jiazai");
    self.mytag = 0;
    [super loadView];

}

//下拉加载最新的数据
- (void) loadNew{
    accountTool *tool = [[accountTool alloc]init];
    accountModel *account = [tool getAccount];
    NSString *urlStr =@"https://api.weibo.com/2/statuses/friends_timeline.json";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"access_token":account.access_token,
                           @"since_id":[[self.modelArr firstObject] id],
//      一次刷新几条
//                            @"count":@5
                           };
    
    [manager GET:urlStr parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSArray *dictArr = responseObject[@"statuses"];
        NSArray *objArr =  [statusModel mj_objectArrayWithKeyValuesArray:dictArr];
        
//         把获取的最新数据插入数组中
        int i =0;
        for (statusModel *model in objArr) {
            [self.modelArr insertObject:model atIndex:i];
            i++;
        }
        
        [self.tableView reloadData];
         [self.tableView headerEndRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

/**
 *  第一次进来,获取账号用户数据
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    把tableview的无数据的cell去掉
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self.tableView addHeaderWithTarget:self action:@selector(loadNew)];
    [self.tableView addFooterWithTarget:self action:@selector(pullUp)];
    
    
//    self.title = @"主页";
    accountTool *tool = [[accountTool alloc]init];
    accountModel *account = [tool getAccount];
    if(account){
    NSString *title = [[NSUserDefaults standardUserDefaults]objectForKey:@"title"];
    self.navigationItem.title = title;
        
    NSString *token = account.access_token;
    NSString *uid = account.uid;
    NSString *urlStr = @"https://api.weibo.com/2/users/show.json";
    NSDictionary *dict = @{
                           @"access_token":token,
                           @"uid":uid
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlStr parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dict = responseObject;
//        NSLog(@"%@",dict);
        UserModel *model = [[UserModel alloc]init];
//        mjextention 一句话搜索模型中的key,给它赋值value
        [model mj_setKeyValues:dict];
        
        
        if (!title) {
            self.navigationItem.title = dict[@"screen_name"];
            [[NSUserDefaults standardUserDefaults]setObject:dict[@"screen_name"] forKey:@"title"];
//            李马存
            [[NSUserDefaults standardUserDefaults] synchronize];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
        //获取其他信息
        [self getData];
        
    }
}

//获取表格数据
//https://api.weibo.com/2/statuses/friends_timeline.json
- (void)getData{
    accountTool *tool = [[accountTool alloc]init];
    accountModel *account = [tool getAccount];
    NSString *token = account.access_token;
    NSString *urlStr =@"https://api.weibo.com/2/statuses/friends_timeline.json";
    
    NSDictionary *dict = @{
                           @"access_token":token,
//                           获取几条数据
                           @"count":@5
                           };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlStr parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
//        NSLog(@"%@",responseObject);
        NSArray *dictArr = responseObject[@"statuses"];
        
//        把字典数组传进来,我转成模型数组
        NSArray * modelArr = [statusModel mj_objectArrayWithKeyValuesArray:dictArr];
        
//        把一个数组赋值给另一个可变数组  用这个方法
        [self.modelArr addObjectsFromArray:modelArr];

        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.modelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
//    取出模型赋值
    statusModel *model = self.modelArr[indexPath.row];
    cell.textLabel.text = model.text;
    // Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    分割线样式
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}



//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offsetY = scrollView.contentOffset.y;
//    CGFloat contentHeight = scrollView.contentSize.height;
//    NSLog(@"%f===%f",offsetY,contentHeight);
//    NSLog(@"%f",self.tabBarController.tabBar.bounds.size.height);
//    
//    if (contentHeight-offsetY+self.tabBarController.tabBar.bounds.size.height<self.view.bounds.size.height) {
//        NSLog(@"开始刷新");
//        
//    }
//}


//上啦刷新
- (void)pullUp{
    accountTool *tool = [[accountTool alloc]init];
    accountModel *account = [tool getAccount];
    NSString *token = account.access_token;
    NSString *urlStr =@"https://api.weibo.com/2/statuses/friends_timeline.json";
    NSDictionary *dict = @{
                             @"access_token":token,
                               @"max_id":@([[[self.modelArr lastObject] id]integerValue]-1),
                             @"count":@5
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlStr parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *dict = responseObject;
        NSArray *dictArr = dict[@"statuses"];
        NSArray *objArr = [statusModel mj_objectArrayWithKeyValuesArray:dictArr];
        [self.modelArr addObjectsFromArray:objArr];
        [self.tableView footerEndRefreshing];
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

@end
