//
//  ClassifyViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/3/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ClassifyViewController.h"
#import "MJRefresh.h"

@interface ClassifyViewController ()
{
    NSMutableArray *_dataArray;
    UIRefreshControl *refresh;
    
}
@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray=[[NSMutableArray alloc]init];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
    [self.tableView addSubview:refresh];
    
    self.isLoading=NO;
    self.page=1;
    
    [self requestData];
    
}

-(void)requestData
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    //[NSString stringWithFormat:@"%d",self.page]
    NSDictionary *dic =@{@"offset":[NSString stringWithFormat:@"%d",self.page],@"limit":@"50",@"tag":self.model.title};
    
    [manager GET:@"http://api.kuaikanmanhua.com/v1/topics" parameters:dic
 progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"topics"];
        
        for (NSDictionary *dic in arr) {
            KuaiKanModel *model=[[KuaiKanModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            
            model.topicId=dic[@"id"];
            
            model.authorId=dic[@"user"][@"id"];
            model.avatar_url=dic[@"user"][@"avatar_url"];
            model.nickname=dic[@"user"][@"nickname"];
            
            [_dataArray addObject:model];
        }
     
     [self.tableView.header endRefreshing];
     [self.tableView.footer endRefreshing];
        [self.tableView reloadData];
     
     
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"数据请求失败");
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClassifyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ClassifyTableViewCell"];
    if (_dataArray.count>0) {
        [cell fillData:_dataArray[indexPath.row]];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllViewController *all=[sb instantiateViewControllerWithIdentifier:@"AllViewController"];
    //    all.url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",[_dataArray[tgr.view.tag] topicId]];
    
    all.model=_dataArray[indexPath.row];
    
    [self.navigationController pushViewController:all animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title=self.model.title;
    self.navigationController.navigationBarHidden=NO;
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
    //NSArray * imageArr = @[[UIImage imageNamed:@"loading_teemo_1"],[UIImage imageNamed:@"loading_teemo_2"]];
    [footer setImages:nil forState:MJRefreshStateRefreshing];
    //添加上拉加载控件
    self.tableView.footer=footer;
    
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
    self.tableView.header=header;
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
