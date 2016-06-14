//
//  AllViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "AllViewController.h"
#import "AllTableViewCell.h"

@interface AllViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UILabel * label;
    
}

@property (nonatomic,strong)UIImageView * headImageView;

@end

@implementation AllViewController

KuaiKanModel *topModel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",self.model.topicId];
    
    [self requestData];
    
}


-(void)requestData
{
    _dataArray=[[NSMutableArray alloc]init];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSLog(@"全集接口:%@",_url);
    [manager GET:_url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        topModel=[[KuaiKanModel alloc]init];
    topModel.cover_image_url=dicy[@"cover_image_url"];
        topModel.title=dicy[@"title"];
        topModel.likes_count=dicy[@"likes_count"];
        topModel.comments_count=dicy[@"comments_count"];
        
        NSArray *arr=[dicy objectForKey:@"comics"];
        
        for (NSDictionary *dic in arr) {
            KuaiKanModel *model=[[KuaiKanModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            model.avatar_url=dic[@"topic"][@"user"][@"avatar_url"];
            model.nickname=dic[@"topic"][@"user"][@"nickname"];
            
        model.comments_count=dicy[@"comments_count"];
            
            
            model.comicId=dic[@"id"];
            
            
            
            ////////////////////////////////
            model.topicTitle=dic[@"title"];
            model.topicId=dic[@"topic_id"];
            model.topicUserNickname=dicy[@"user"][@"nickname"];
            model.authorId=dicy[@"user"][@"id"];
            
            
            
            
            [_dataArray addObject:model];
        }
        
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        [self initHeaderView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据请求失败");
        
    }];
    
}

-(void)initHeaderView
{
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -235, self.view.bounds.size.width, 235)];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:topModel.cover_image_url]];
    //停靠模式  根据原有图片比例进行缩放
    self.headImageView.contentMode = UIViewContentModeScaleAspectFill;
    //切除多余图片
    self.headImageView.clipsToBounds = YES;
    //直接以addSubview的方式添加到TableView上
    [self.tableView addSubview:self.headImageView];
    
///////////////////////////////////////////////////////////
    //Label固定宽度     让其高度随字体缩放
    float labelWidth = self.view.bounds.size.width;
    //计算Label所需高度
    /*
     1.CGSize（固定宽，高度随之改变）
     2. options 选项/设置  用于设置换行形式。
     3.attributes 属性字符串（对文字进行设置  比如设置字体）
     4.context 额外的预留设置  通常传入空
     */

    CGSize size = [topModel.title boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:30]} context:nil].size;
    
    //创建UILabel
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -50, size.width, size.height)];

    //创建UILabel
//    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, -50, 100,30)];
//    titleLabel.textColor=[UIColor colorWithRed:251%255/255.0 green:220%255/255.0 blue:30%255/255.0 alpha:1];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.tag=300;
    titleLabel.text = topModel.title;
    titleLabel.numberOfLines=0;
    titleLabel.backgroundColor=[UIColor grayColor];
    titleLabel.textAlignment=1;
    titleLabel.alpha=0.6;
    titleLabel.clipsToBounds=YES;
    titleLabel.layer.cornerRadius=5;
    
    //字体一定要保证与计算时相同
    label.font = [UIFont boldSystemFontOfSize:30];
    [self.tableView addSubview:titleLabel];
    
    
    
    
    
    
    
    //contenInSet   额外滑动区域
    //UIEdgeInsetsMake   调整的为相对于原有坐标位置
    //上左下右
    self.tableView.contentInset = UIEdgeInsetsMake(235, 0, 0, 0);
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 40)];
    [btn1 setTitle:@"简介" forState:UIControlStateNormal];
    btn1.tag=101;
    [btn1 setTitleColor:[UIColor colorWithRed:130%255/255.0 green:130%255/255.0 blue:130%255/255.0 alpha:1] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(onClickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitleColor:[UIColor colorWithRed:172%255/255.0 green:172%255/255.0 blue:172%255/255.0 alpha:1] forState:UIControlStateNormal];
    btn1.titleLabel.font=[UIFont systemFontOfSize:13];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, 40)];
    [btn2 setTitle:@"内容" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor colorWithRed:130%255/255.0 green:130%255/255.0 blue:130%255/255.0 alpha:1] forState:UIControlStateNormal];
    btn2.tag=102;
    [btn2 addTarget:self action:@selector(onClickBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitleColor:[UIColor colorWithRed:172%255/255.0 green:172%255/255.0 blue:172%255/255.0 alpha:1] forState:UIControlStateNormal];
    btn2.titleLabel.font=[UIFont systemFontOfSize:13];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [label addSubview:btn1];
    [label addSubview:btn2];
    
    UILabel *lineLabel1=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, 2, 40)];
    lineLabel1.backgroundColor=[UIColor grayColor];
    [label addSubview:lineLabel1];
    
    
    UILabel *lineLabel2=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 2)];
    lineLabel2.tag=201;
    lineLabel2.backgroundColor=[UIColor grayColor];
    
    UILabel *lineLabel3=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 40, self.view.frame.size.width/2, 2)];
    lineLabel3.backgroundColor=[UIColor colorWithRed:226%255/255.0 green:174%255/255.0 blue:0%255/255.0 alpha:1];
    lineLabel3.tag=202;
    [label addSubview:lineLabel2];
    [label addSubview:lineLabel3];
    
    
    UILabel *textLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 40, self.view.frame.size.width/2, 40)];
    textLabel.text=@"漫画列表";
    textLabel.textColor=[UIColor colorWithRed:130%255/255.0 green:130%255/255.0 blue:130%255/255.0 alpha:1];
    textLabel.font=[UIFont systemFontOfSize:13];
    UIButton *btn3=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 40, self.view.frame.size.width/2, 40)];
    [btn3 setTitle:@"倒序" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor colorWithRed:130%255/255.0 green:130%255/255.0 blue:130%255/255.0 alpha:1] forState:UIControlStateNormal];
    [btn3 setImage:[UIImage imageNamed:@"daoxu16"] forState:UIControlStateNormal];
    btn3.titleLabel.font=[UIFont systemFontOfSize:12];
    [btn3 addTarget:self action:@selector(exchange:) forControlEvents:UIControlEventTouchUpInside];
    [label addSubview:textLabel];
    [label addSubview:btn3];
    
    
    //上方返回按钮
    UIButton *backBtn=[[UIButton alloc]initWithFrame:CGRectMake(27, 33, 40, 40)];
    [backBtn setImage:[UIImage imageNamed:@"ZFPlayer_back_full"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *btnLabel=[[UILabel alloc]initWithFrame:CGRectMake(29, 32, 40, 40)];
    btnLabel.clipsToBounds=YES;
    btnLabel.layer.cornerRadius=20;
    btnLabel.backgroundColor=[UIColor whiteColor];
    btnLabel.alpha=0.7;
    
    [self.view addSubview:btnLabel];
    [self.view addSubview:backBtn];
///////////////////////////////////////////////////////////
    
    label.userInteractionEnabled=YES;
    self.tableView.tableHeaderView=label;
    
    
//模糊效果
//    FXBlurView *fv=[[FXBlurView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    fv.blurRadius=15;
//    fv.tintColor=[UIColor clearColor];
//    [self.view addSubview:fv];
    
    
}

//只要滑动就会调用的方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //contentInSet  150 => contentOffSet  -150
    //    NSLog(@"%f",scrollView.contentOffset.y);
    float offSet = scrollView.contentOffset.y;
    if (offSet < -235) {//说明在下拉
        //获得当前头部视图坐标
        CGRect rect = self.headImageView.frame;
        //1.头部图片的顶部始终处于屏幕顶端
        rect.origin.y = offSet;
        //2.头部图片的高度跟随拉伸而放大
        rect.size.height = -offSet;
        self.headImageView.frame = rect;

    }

//    if (offSet>-60) {
//        [UIView animateWithDuration:0.2 animations:^{
//            UILabel *label=[self.view viewWithTag:300];
//            label.center=CGPointMake(self.view.frame.size.width/2, 45);
//        }];
//    }



    //NSLog(@"滚动视图偏移量:%f",offSet);
}

-(void)onClickBtn1:(UIButton *)btn
{
    
    [UIView animateWithDuration:0.2 animations:^{
        UILabel *label=[self.view viewWithTag:202];
        label.frame=CGRectMake(10, 40, self.view.frame.size.width/2, 2);
    }];
}

-(void)onClickBtn2:(UIButton *)btn
{
    [UIView animateWithDuration:0.2 animations:^{
        UILabel *label=[self.view viewWithTag:202];
        label.frame=CGRectMake(self.view.frame.size.width/2, 40, self.view.frame.size.width/2, 2);
    }];
}



-(void)exchange:(UIButton *)btn
{
    static BOOL y=1;
    if (y==1) {
        [btn setTitle:@"升序" forState:UIControlStateNormal];
    }
    else
    {
        [btn setTitle:@"倒序" forState:UIControlStateNormal];
    }
    
    for (int i=0; i<_dataArray.count/2; i++) {
        [_dataArray exchangeObjectAtIndex:i withObjectAtIndex:_dataArray.count-i-1];
    }
    [self.tableView reloadData];
    y=!y;
}

-(void)goBack:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"AllTableViewCell"];
    
    [cell.cover_image_url sd_setImageWithURL:[NSURL URLWithString:[_dataArray[indexPath.row] cover_image_url]]];
    cell.title.text=[_dataArray[indexPath.row] title];
    
    //////////////////////////////////
    int m=[[_dataArray[indexPath.row] created_at] intValue];
    cell.created_at.text = [self timeFormatted:m];
    //////////////////////////////////
    
    if ([[_dataArray[indexPath.row] likes_count] intValue]>9999) {
        int m=[[_dataArray[indexPath.row] likes_count] intValue]/10000;
        cell.likes_count.text=[NSString stringWithFormat:@"%d万",m];
    }
    else
    {
        cell.likes_count.text=[NSString stringWithFormat:@"%@",[_dataArray[indexPath.row] likes_count]];
    }
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

//时间转换
- (NSString *)timeFormatted:(int)totalSeconds
{
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString *str=[NSString stringWithFormat:@"%@",localeDate];
    NSString *str1=[str substringToIndex:str.length-5];
    return str1;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    WebViewController *wc=[sb instantiateViewControllerWithIdentifier:@"WebViewController"];
    
    wc.model=_dataArray[indexPath.row];
    
    [self.navigationController pushViewController:wc animated:YES];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    
}




@end


























