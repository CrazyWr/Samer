//
//  CommentTableViewCell.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"




@interface CommentTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *avatar_url;

@property (strong, nonatomic) IBOutlet UILabel *nickname;

@property (strong, nonatomic) IBOutlet UILabel *created_at;

@property (strong, nonatomic) IBOutlet UILabel *content;


@end
