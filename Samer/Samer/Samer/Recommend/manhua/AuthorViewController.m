//
//  AuthorViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "AuthorViewController.h"
#import "AllViewController.h"

@interface AuthorViewController ()
{
    NSMutableArray *_dataArray;
}
@end

@implementation AuthorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.authorView.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    _dataArray=[[NSMutableArray alloc]init];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self requestData];
    
}


-(void)requestData
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:self.url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_dataArray removeAllObjects];
        
        //NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        [self.avatar_url sd_setImageWithURL:[NSURL URLWithString:dicy[@"avatar_url"]]];
        self.nickname.text=dicy[@"nickname"];
        self.intro.text=dicy[@"intro"];
        
        NSArray *arr=[dicy objectForKey:@"topics"];
        
        for (NSDictionary *dic in arr) {
            AuthorModel *model=[[AuthorModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            model.Id=dic[@"id"];
            model.detail=dic[@"description"];
            [_dataArray addObject:model];
        }
        
        self.tableView.tableHeaderView=self.authorView;
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据请求失败");
        
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            cell.textLabel.text=@"TA的作品";
        }
        return cell;
    }
    AuthorTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"AuthorTableViewCell" forIndexPath:indexPath];
    
    [cell.cover_image_url sd_setImageWithURL:[NSURL URLWithString:[_dataArray[indexPath.row-1] cover_image_url]]];
    cell.title.text=[_dataArray[indexPath.row-1] title];
    cell.detail.text=(NSString *)[_dataArray[indexPath.row-1] detail];
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return;
    }
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllViewController *all=[sb instantiateViewControllerWithIdentifier:@"AllViewController"];
//    all.url=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",[_dataArray[indexPath.row-1] Id]];
    KuaiKanModel *model=[[KuaiKanModel alloc]init];
    model.topicId=[_dataArray[indexPath.row-1] Id];
    
    all.model=model;
    //NSLog(@"ALL网址:%@",all.url);
    
    
    [self.navigationController pushViewController:all animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 50;
    }
    else
    {
        return 100;
    }
}


-(void)viewWillAppear:(BOOL)animated
{
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
