//
//  AllTableViewCell.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *created_at;

@property (strong, nonatomic) IBOutlet UILabel *likes_count;




@end
