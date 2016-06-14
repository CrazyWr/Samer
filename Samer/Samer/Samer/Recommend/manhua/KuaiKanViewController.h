//
//  KuaiKanViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KuaiKanViewController : UIViewController


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@property NSString *url;

//页数
@property int page;

//判断当前网络是否处于刷新状态
@property BOOL isLoading;

@property int day;



@end
