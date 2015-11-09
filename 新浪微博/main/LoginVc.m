//
//  LoginVc.m
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "LoginVc.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "accountModel.h"
#import "accountTool.h"
#import "MytabBarCon.h"
#import "AppDelegate.h"
@interface LoginVc ()<UIWebViewDelegate>

@end

@implementation LoginVc
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

    // Do any additional setup after loading the view.
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:webView];
    webView.scrollView.scrollEnabled = NO;
    NSString *key = @"4211768567";
    NSString *back = @"https://api.weibo.com/oauth2/default.html";
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",key,back];
    
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    }];

    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    webView.delegate = self;
    
}

//App Key：4211768567
//App Secret：2077ec17d66f73a3d06dccdded5b8c6d
//授权回调页：https://api.weibo.com/oauth2/default.html
//取消授权回调页：http://www.baidu.com

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)setupUI{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.title = @"登录新浪微博";
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateNormal];
}


- (void)close{
       [SVProgressHUD dismiss];
    [self dismissViewControllerAnimated:YES completion:nil];
   
}


- (void)getAccessTockenWithCode:(NSString *)code{
    //获取令牌的接口
    
    NSString *urlStr = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *dict = @{
                           @"client_id":@"4211768567",
                           @"client_secret":@"2077ec17d66f73a3d06dccdded5b8c6d",
                           @"grant_type":@"authorization_code",
                           @"code":code,
                           @"redirect_uri":@"https://api.weibo.com/oauth2/default.html"
                           };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:urlStr parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
//        NSLog(@"%@",responseObject);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSLog(@"%@",dict);
//        "access_token" = "2.004I7fFGF6JCbE7389c2870c5qo9KB";
//        "expires_in" = 157679999;
//        "remind_in" = 157679999;
//        uid = 5580550583;
//        将账号存入本地
        accountModel *model = [accountModel modelWithDict:dict];
        
        accountTool *tool = [[accountTool alloc]init];
        [tool saveAccount:model];
        
//        跳转控制器  (通过window的rootviewCon跳转的方式)
        MytabBarCon *controller = [[MytabBarCon alloc]init];
        
        UIWindow *window = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;

        window.rootViewController = controller;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
//        NSLog(@"%@",error);
        
    }];
    
    
    
}

#pragma mark - webViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *urlStr = request.URL.absoluteString;
//    NSLog(@"%@",urlStr);
    
    NSString *back = @"https://api.weibo.com/oauth2/default.html";
    if ([urlStr hasPrefix:back]) {
//        登陆成功才会来这里往下走
//      动态登陆成功码
//        code=85f4a990031c536d93ba16c6f31fd0ee
        NSRange range = [urlStr rangeOfString:@"code="];
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        
//       用code 去获取accessTocken
        [self getAccessTockenWithCode:code];
        
    }
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD showWithStatus:@"加载中"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
}

//________________________________________________________________________________________________________


@end
