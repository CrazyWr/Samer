//
//  ContentsViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import "ActivityViewController.h"
#import "ActivityDetailViewController.h"
#import "ActivityModel.h"
#import "ActivityCell.h"

@interface ActivityViewController ()

@property NSMutableArray *dataArray;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"活动";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    [self.tableView registerNib:[UINib nibWithNibName:@"Activity" bundle:nil] forCellReuseIdentifier:@"ActivityCell"];
    
}

- (void)initArrays{
    
    self.dataArray = [[NSMutableArray alloc] init];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell"];
    [cell loadDataFromModel:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ActivityDetailViewController *detail = [story instantiateViewControllerWithIdentifier:@"ActivityDetailViewController"];
    detail.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
    
}

@end
