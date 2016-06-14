//
//  KuaiKanCollectionViewCell.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KuaiKanCollectionViewCell : UICollectionViewCell


@property (strong, nonatomic) IBOutlet UILabel *topicTitle;

@property (strong, nonatomic) IBOutlet UILabel *topicUserNickname;

@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *likes_count;

@property (strong, nonatomic) IBOutlet UILabel *comments_count;


@end
