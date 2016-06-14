//
//  SearchViewController.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;





@end
