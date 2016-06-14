//
//  AllViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AllViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSString *url;
@property KuaiKanModel *model;

@end
