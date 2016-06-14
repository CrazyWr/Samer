//
//  AuthorTableViewCell.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthorTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;


@property (strong, nonatomic) IBOutlet UILabel *title;


@property (strong, nonatomic) IBOutlet UILabel *detail;




@end
