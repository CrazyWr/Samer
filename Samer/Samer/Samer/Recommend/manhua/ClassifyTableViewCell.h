//
//  ClassifyTableViewCell.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *nickName;

@property (strong, nonatomic) IBOutlet UILabel *likes_count;

@property (strong, nonatomic) IBOutlet UILabel *comments_count;

-(void)fillData:(KuaiKanModel *)model;

@end
