//
//  CommentViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController

@property KuaiKanModel *model;

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end
