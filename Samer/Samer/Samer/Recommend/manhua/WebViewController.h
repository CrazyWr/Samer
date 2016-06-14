//
//  WebViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property KuaiKanModel *model;


- (IBAction)pinglun:(UIButton *)sender;

- (IBAction)shareBtn:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *pinglunNum;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)shoucangBtn:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UIButton *shoucangBtn;


@end
