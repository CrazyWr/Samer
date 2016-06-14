//
//  CommentViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/3/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CommentViewController.h"
#import "MJRefresh.h"

#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"


@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    NSString *url;
    BOOL isNew;
    CGFloat heigt;
}

@property int page;

@end

@implementation CommentViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    isNew=YES;
    [self initSegement];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.page=1;
    
    [self addHeaderRefresh];
    [self addFooterRefresh];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _dataArray=[[NSMutableArray alloc]init];
    
    url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
    
    [self requestData];
    
}

-(void)initSegement
{
    NSArray * array=@[@"最新评论",@"最热评论"];
    
    //分段控件
    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:array];
    
    
    seg.frame=CGRectMake(0 , 20, 150, 30);
    
    //设置分段器默认的宽度有默认值
    [seg setWidth:100 forSegmentAtIndex:0];
    [seg setWidth:100 forSegmentAtIndex:1];
    
    [seg setSelectedSegmentIndex:0];
    
    [seg addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView=seg;
    
}

-(void)onClicked:(UISegmentedControl *)seg
{
    NSString *content=[seg titleForSegmentAtIndex:seg.selectedSegmentIndex];
    if ([content isEqualToString:@"最热评论"]) {
        isNew=NO;
        [_dataArray removeAllObjects];
        self.page=1;
        url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=score&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        
        [self requestData];
    }
    else
    {
        isNew=YES;
        [_dataArray removeAllObjects];
        self.page=1;
        url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        
        [self requestData];
    }
}


-(void)requestData
{
    NSLog(@"评论网址:%@",url);
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"comments"];
        
        for (NSDictionary *dic in arr) {
            KuaiKanModel *model=[[KuaiKanModel alloc]init];
            model.avatar_url=dic[@"user"][@"avatar_url"];
            model.nickname=dic[@"user"][@"nickname"];
            model.created_at=dic[@"created_at"];
            model.content=dic[@"content"];
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



//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    // 2.1 注册模型cell
//    [self.tableView startAutoCellHeightWithCellClass:[CommentTableViewCell class] contentViewWidth:100];
//    return _dataArray.count;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 2.2 根据模型取得cell高度
//    return [self.tableView cellHeightForIndexPath:indexPath model:_dataArray[indexPath.row] keyPath:@"content"];
//}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
    if (_dataArray.count>0) {
        [cell.avatar_url sd_setImageWithURL:[NSURL URLWithString:[_dataArray[indexPath.row] avatar_url]]];
        cell.nickname.text=[_dataArray[indexPath.row] nickname];
        
        NSDate * date = [NSDate date];
        NSTimeInterval xianzai=[date timeIntervalSince1970]*1;
        int late = [[_dataArray[indexPath.row] created_at ]intValue];
        int  now = (int)xianzai;
        int cha = now - late;
        if (cha/60==0) {
            cell.created_at.text = @"刚刚";
        }
        else if(cha/60>0&&cha/60/60<1)
        {
            cell.created_at.text = [NSString stringWithFormat:@"%d分钟前",cha/60];
        }
        else if(cha/3600>1&&cha/3600/24<1)
        {
            cell.created_at.text = [NSString stringWithFormat:@"%d小时前",cha/3600];
        }
        else if(cha/3600/24>1)
        {
            cell.created_at.text = [NSString stringWithFormat:@"%d天前",cha/3600/24];
        }
        else if (cha/3600/24/365>1)
        {
            cell.created_at.text = [NSString stringWithFormat:@"%d年前",cha/3600/24/365];
        }
        
        cell.content.text=[_dataArray[indexPath.row] content];
    }
    
    cell.content.sd_layout.leftEqualToView(cell.created_at).topSpaceToView(cell.created_at,5);
    NSLog(@"%ld",indexPath.row);
    cell.content.sd_layout.autoHeightRatio(0);
    cell.content.height=heigt;
    [cell setupAutoHeightWithBottomView:cell.contentView bottomMargin:10];
    
    return cell;
}



#pragma mark 创建上拉加载控件
- (void)addFooterRefresh{
    MJRefreshAutoGifFooter * footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //上拉加载
        //1.页数+1
        self.page=self.page+20;
        if (isNew==YES) {
            
            url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        }
        else
        {
            url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=score&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        }
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
        if (isNew==YES) {
            url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        }
        else
        {
            url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@/comments?order=score&offset=%@&limit=20",self.model.comicId,[NSString stringWithFormat:@"%d",self.page]];
        }
        
        
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
