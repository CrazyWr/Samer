//
//  CartoonCell.h
//  Samer
//
//  Created by Uthealth0122 on 16/6/14.
//
//

#import <UIKit/UIKit.h>


@interface CartoonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *cover_image_url;

@property (strong, nonatomic) IBOutlet UILabel *title;

@property (strong, nonatomic) IBOutlet UILabel *nickName;

@property (strong, nonatomic) IBOutlet UILabel *likes_count;

@property (strong, nonatomic) IBOutlet UILabel *comments_count;

-(void)fillData:(KuaiKanModel *)model;


@end
