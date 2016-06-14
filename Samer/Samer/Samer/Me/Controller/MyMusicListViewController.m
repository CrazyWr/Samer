//
//  MyMusicListViewController.m
//  Samer
//
//  Created by wei on 16/6/4.
//
//

#import "MyMusicListViewController.h"

@interface MyMusicListViewController ()

@end

@implementation MyMusicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的音乐列表";
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    
    
    return cell;
}



@end
