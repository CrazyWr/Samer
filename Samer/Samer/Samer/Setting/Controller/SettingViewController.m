//
//  SettingViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *titles;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    
    [self initArrays];
    [self initTableview];
    
}

- (void)initArrays{

    self.titles = @[@"清理缓存",
                    @"版本信息",
                    @"模式选择"];
    
}

- (void)initTableview{

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titles.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
    
}


@end
