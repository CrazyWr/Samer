//
//  SearchViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchModel.h"
#import "SearchCollectionViewCell.h"
#import "ClassifyViewController.h"

@interface SearchViewController ()
{
    NSMutableArray *_dataArray;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UITextField * txt = [[UITextField alloc]initWithFrame:CGRectMake(0, 42, 210, 30)];
//    txt.backgroundColor=[UIColor whiteColor];
//    txt.placeholder=@"搜索作品名，作者名";
//    txt.layer.cornerRadius=10;
//    self.navigationItem.titleView = txt;
    
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self requestData];
    
}



-(void)requestData
{
    
    _dataArray=[[NSMutableArray alloc]init];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:@"http://api.kuaikanmanhua.com/v1/tag/suggestion" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"suggestion"];
        
        for (NSDictionary *dic in arr) {
            SearchModel *model=[[SearchModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [_dataArray addObject:model];
        }
        
        [self.collectionView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据请求失败");
        
    }];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    SearchCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"SearchCollectionViewCell" forIndexPath:indexPath];
    
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:(NSString *)[_dataArray[indexPath.row] icon]]];
    cell.title.text=[_dataArray[indexPath.row] title];
    cell.icon.clipsToBounds = YES;
    
    //cell.icon.layer.cornerRadius=cell.icon.frame.size.width/2;
    cell.icon.layer.cornerRadius=40;
    
    [cell.contentView setFrame:cell.bounds];
    [cell.contentView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ClassifyViewController *cc=[sb instantiateViewControllerWithIdentifier:@"ClassifyViewController"];
    cc.model=_dataArray[indexPath.row];
    [self.navigationController pushViewController:cc animated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title=@"漫画分类";
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
