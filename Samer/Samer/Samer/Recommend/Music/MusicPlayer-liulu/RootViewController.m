//
//  RootViewController.m
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/2.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import "RootViewController.h"

#import "MusicListViewController.h"

#import "CollectViewController.h"


@interface RootViewController ()

@property (nonatomic,strong) UIButton *allMusicButton;//全部音乐

@property (nonatomic,strong) UIButton *collectButton;//收藏音乐

@property (nonatomic,strong) UIButton *chatButton;//聊天

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = @"音乐";
    
    //
    [self loadInitView];
    
}
-(void)loadInitView
{
    _allMusicButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _allMusicButton.frame = CGRectMake(100, 100, 100, 40);
    
    [_allMusicButton setTitle:@"全部歌曲" forState:UIControlStateNormal];
    
    [_allMusicButton addTarget:self action:@selector(AllMusicButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_allMusicButton];
    
    _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _collectButton.frame = CGRectMake(100, 200, 100, 40);
    
    [_collectButton setTitle:@"收藏列表" forState:UIControlStateNormal];
    
    [_collectButton addTarget:self action:@selector(collectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_collectButton];
    
    _chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _chatButton.frame = CGRectMake(100, 300, 100, 40);
    
    [_chatButton setTitle:@"向开发者提出建议" forState:UIControlStateNormal];
    
    [_chatButton addTarget:self action:@selector(chatButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.view addSubview:_chatButton];
    
}

-(void)chatButtonAction:(UIButton*)sender
{
    
}

-(void)collectButtonAction:(UIButton*)sender
{
    CollectViewController *COVC = [[CollectViewController alloc]init];
    
    [self.navigationController pushViewController:COVC animated:YES];
}

-(void)AllMusicButtonAction:(UIButton*)sender
{
    //旋转全部歌曲页面
    MusicListViewController *MLVC = [[MusicListViewController alloc]init];
    
    [self.navigationController pushViewController:MLVC animated:YES];
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
