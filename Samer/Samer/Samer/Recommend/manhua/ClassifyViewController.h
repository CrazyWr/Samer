//
//  ClassifyViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClassifyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property NSString *url;
@property KuaiKanModel *model;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property int page;

//判断当前网络是否处于刷新状态
@property BOOL isLoading;

@end
