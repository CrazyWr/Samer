//
//  MeViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import "MeViewController.h"
#import "MyMusicListViewController.h"
#import "MyVideoListViewController.h"
#import "MyActivityListViewController.h"
#import "MyCollectionListViewController.h"
#import "ZFDownloadViewController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([defaults valueForKey:@"username"] != nil) {
//        
//        self.title = @"我";
//        [self initArrays];
//        [self initTableView];
//        
//    }else{
//        
//        self.title = @"用户未登陆";
//        UIButton *button = [[UIButton alloc] initWithFrame:self.view.frame];
//        [button setTitle:@"登陆" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [button setBackgroundColor:[UIColor whiteColor]];
//        [button addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button];
//    }
    [self initArrays];
    [self initTableView];
    
}

- (void)login:(UIButton *)sender{

    
    
}

- (void)initArrays{

    self.titles = @[@"我的信息",
                    @"我的收藏",
                    @"我的音乐",
                    @"我的视频",
                    @"我的活动"];
    
}

- (void)initTableView{
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.rowHeight = 60;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UserCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titles.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:{
            
            break;
        }
        case 1:{
            MyCollectionListViewController *collection = [story instantiateViewControllerWithIdentifier:@"MyCollectionListViewController"];
            [self.navigationController pushViewController:collection animated:YES];
            break;
        }
        case 2:{
            MyMusicListViewController *music = [story instantiateViewControllerWithIdentifier:@"MyMusicListViewController"];
            [self.navigationController pushViewController:music animated:YES];
            break;
        }
        case 3:{
//            MyVideoListViewController *video = [story instantiateViewControllerWithIdentifier:@"MyVideoListViewController"];
            ZFDownloadViewController *download = [story instantiateViewControllerWithIdentifier:@"ZFDownloadViewController"];
            [self.navigationController pushViewController:download animated:YES];
            break;
        }
        case 4:{
            MyActivityListViewController *activity = [story instantiateViewControllerWithIdentifier:@"MyActivityListViewController"];
            [self.navigationController pushViewController:activity animated:YES];
            break;
        }
        default:
            break;
    }

}

@end
