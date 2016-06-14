//
//  ClassifyTableViewCell.m
//  KuaiKan
//
//  Created by qianfeng on 16/3/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ClassifyTableViewCell.h"

@implementation ClassifyTableViewCell


-(void)fillData:(KuaiKanModel *)model
{
    [self.cover_image_url sd_setImageWithURL:[NSURL URLWithString:model.cover_image_url]];
    self.title.text=model.title;
    self.nickName.text=model.nickname;
    if ([model.likes_count intValue]>9999) {
        int m=[model.likes_count intValue]/10000;
        self.likes_count.text=[NSString stringWithFormat:@"%d万",m];
    }
    else
    {
        self.likes_count.text=[NSString stringWithFormat:@"%@",model.likes_count];
    }
    if ([model.comments_count intValue]>9999) {
        int m=[model.comments_count intValue]/10000;
        self.comments_count.text=[NSString stringWithFormat:@"%d万",m];
    }
    else
    {
        self.comments_count.text=[NSString stringWithFormat:@"%@",model.comments_count];
    }
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
