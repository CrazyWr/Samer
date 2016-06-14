//
//  KuaiKanViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "KuaiKanViewController.h"
#import "MJRefresh.h"
#import "AllViewController.h"
#import "AllTableViewCell.h"
#import "WebViewController.h"

@interface KuaiKanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
    
}


@end

@implementation KuaiKanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    _dataArray=[[NSMutableArray alloc]init];
    
    [self setMyUrl];
    
    //设置默认页
    self.page=1;
    
    //加载状态
    self.isLoading=NO;
   
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
     [self requestData];
    
    

    
}


#pragma mark 创建上拉加载控件
- (void)addFooterRefresh{
    MJRefreshAutoGifFooter * footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //上拉加载
        //1.页数+1
        self.page++;

        [self requestData];
    }];
    //设置动画
    [footer setImages:nil forState:MJRefreshStateRefreshing];
    //添加上拉加载控件
    //self.collectionView.footer=footer;
    
    
}

#pragma mark 创建下拉刷新控件
- (void)addHeaderRefresh{
    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //在Block体中书写下拉刷新的所需操作
        //1.清空数据源
        [_dataArray removeAllObjects];
        //2.重置页数
        self.page = 1;

        [self requestData];
    }];
    //设置动态图片
    NSArray * imageArr = @[[UIImage imageNamed:@"common_loading_anne_0"],[UIImage imageNamed:@"common_loading_anne_1"]];
    //刷新中状态
    [header setImages:imageArr forState:MJRefreshStateRefreshing];
    //闲置状态
    [header setImages:imageArr forState:MJRefreshStateIdle];
    //松手即刷新状态
    [header setImages:imageArr forState:MJRefreshStatePulling];
    //修改对应状态的文字
    [header setTitle:@"ZZZ..." forState:MJRefreshStatePulling];
    //下拉刷新控件添加到数组中
    self.collectionView.header=header;
}














-(void)setMyUrl
{
    self.url=@"http://api.kuaikanmanhua.com/v1/comic_lists/1?offset=133&limit=22";
}

-(void)requestData
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:self.url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_dataArray removeAllObjects];
        
        //NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"comics"];
        for (int i=0; i<20; i++) {
            NSDictionary *dic=arr[i];
            KuaiKanModel *model=[[KuaiKanModel alloc]init];
            model.comicId=dic[@"id"];
            [model setValuesForKeysWithDictionary:dic];
            model.topicTitle=dic[@"topic"][@"title"];
            model.topicId=dic[@"topic"][@"id"];
            model.topicUserNickname=dic[@"topic"][@"user"][@"nickname"];
            model.authorId=dic[@"topic"][@"user"][@"id"];
            model.avatar_url=dic[@"topic"][@"user"][@"avatar_url"];
            model.nickname=dic[@"topic"][@"user"][@"nickname"];
            [_dataArray addObject:model];
        }

        
        
        //去除下拉刷新控件
        [self.collectionView.header endRefreshing];
        
        [self.collectionView.footer endRefreshing];

        [self.collectionView reloadData];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //去除下拉刷新控件
        [self.collectionView.header endRefreshing];
        
        [self.collectionView.footer endRefreshing];
        
        NSLog(@"数据请求失败");
        
    }];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    KuaiKanCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"KuaiKanCollectionViewCell" forIndexPath:indexPath];
    
    [cell.contentView setFrame:cell.bounds];
    [cell.contentView setAutoresizingMask:
     UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    UITapGestureRecognizer *tgr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    if (_dataArray.count>0) {
        cell.topicTitle.text=[NSString stringWithFormat:@"%@(目录)",[_dataArray[indexPath.row] topicTitle]];
        [cell.topicTitle addGestureRecognizer:tgr];
        cell.topicTitle.tag=indexPath.row;
        
        
        UITapGestureRecognizer *tgr1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
        cell.topicUserNickname.userInteractionEnabled=YES;
        cell.topicUserNickname.text=[_dataArray[indexPath.row] topicUserNickname];
        [cell.topicUserNickname addGestureRecognizer:tgr1];
        cell.topicUserNickname.tag=indexPath.row;
        
        cell.topicUserNickname.layer.cornerRadius=15;

        [cell.cover_image_url sd_setImageWithURL:[NSURL URLWithString:[_dataArray[indexPath.row] cover_image_url]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        cell.title.text=[_dataArray[indexPath.row] title];
        
        
        if ([[_dataArray[indexPath.row] likes_count] intValue]>9999) {
            int m=[[_dataArray[indexPath.row] likes_count] intValue]/10000;
            cell.likes_count.text=[NSString stringWithFormat:@"%d万",m];
        }
        else
        {
            cell.likes_count.text=[NSString stringWithFormat:@"%@",[_dataArray[indexPath.row] likes_count]];
        }
        
        if ([[_dataArray[indexPath.row] comments_count] intValue]>9999) {
            int m=[[_dataArray[indexPath.row] comments_count] intValue]/10000;
            cell.comments_count.text=[NSString stringWithFormat:@"%d万",m];
        }
        else
        {
            cell.comments_count.text=[NSString stringWithFormat:@"%@",[_dataArray[indexPath.row] comments_count]];
        }

    }

    return cell;
}

-(void)tap:(UITapGestureRecognizer *)tgr
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllViewController *all=[sb instantiateViewControllerWithIdentifier:@"AllViewController"];
//    all.url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",[_dataArray[tgr.view.tag] topicId]];
    
    all.model=_dataArray[tgr.view.tag];
    
    [self.navigationController pushViewController:all animated:YES];
}

-(void)tap1:(UITapGestureRecognizer *)tgr
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];

    AuthorViewController *ac=[sb instantiateViewControllerWithIdentifier:@"AuthorViewController"];
    ac.url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/users/%@",[_dataArray[tgr.view.tag] authorId]];
    
    [self.navigationController pushViewController:ac animated:YES];
}






-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    WebViewController *wc=[sb instantiateViewControllerWithIdentifier:@"WebViewController"];

    wc.model=_dataArray[indexPath.row];
    
    [self.navigationController pushViewController:wc animated:YES];
    
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width+30, 275);
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
    self.navigationController.navigationBarHidden=NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
