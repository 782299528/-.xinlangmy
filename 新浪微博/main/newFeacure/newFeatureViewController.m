//
//  newFeatureViewController.m
//  新浪微博
//
//  Created by mac on 15/11/9.
//  Copyright © 2015年 miaoyi. All rights reserved.
//

#import "newFeatureViewController.h"
#import "AppDelegate.h"
#import "MytabBarCon.h"

@interface newFeatureViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIPageControl *page;

@end

@implementation newFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
  
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=  CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
    
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
   
    self.collectionView.bounces = NO;
       [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"new"];
    self.collectionView.pagingEnabled = YES;
    
    self.page = [[UIPageControl alloc]init];
    self.page.bounds = CGRectMake(0, 0, 60, 20);
    self.page.center = CGPointMake(self.view.center.x, self.view.center.y+50);
    self.page.numberOfPages =   4;
    self.page.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.page.pageIndicatorTintColor = [UIColor darkGrayColor];
    [self.view addSubview:self.page];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int a = scrollView.contentOffset.x;
    int b = self.view.bounds.size.width;
    int c = a/b;
    self.page.currentPage = c;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 4;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//new_feature_1
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%zd",indexPath.item+1];
    
//    static NSString *ID = @"new";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"new" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    view.image = [UIImage imageNamed:imageName];
    [cell.contentView addSubview:view];
    
    if (indexPath.item == 3) {
        CGFloat x = self.view.center.x;
        CGFloat y = self.view.center.y+180;
        CGPoint center = CGPointMake(x, y);
        CGFloat width = 120;
        CGFloat height = 30;
        UIButton *btn = [[UIButton alloc]init];
        btn.bounds = CGRectMake(0, 0, width, height);
        btn.center = center;
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitle:@"立即体验" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(gogogoClicked) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
    }
    
    return cell;
}

- (void)gogogoClicked{
    UIWindow *window = ((AppDelegate *)[UIApplication sharedApplication].delegate).window;
    MytabBarCon *main = [[MytabBarCon alloc]init];
    window.rootViewController = main;
}

@end
