//
//  AuthorViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AuthorViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *avatar_url;

@property (strong, nonatomic) IBOutlet UILabel *nickname;


@property (strong, nonatomic) IBOutlet UILabel *intro;


@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) IBOutlet UIView *authorView;

@property NSString *url;

@end
