//
//  ActivityDetailViewController.m
//  Samer
//
//  Created by wei on 16/6/4.
//
//

#import "ActivityDetailViewController.h"
#import "UserModel.h"

@interface ActivityDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *actitvityTitle;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *users;

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initArrays];
    [self initTableView];
    
}

- (void)initArrays{

    self.users = self.model.userList;
    
}

- (void)initTableView{

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UserCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.users.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];

    UserModel *model = self.users[indexPath.row];
//    cell.imageView.image =
    cell.textLabel.text = model.name;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    

}

@end
