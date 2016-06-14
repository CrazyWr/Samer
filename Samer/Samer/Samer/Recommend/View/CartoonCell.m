//
//  CartoonCell.m
//  Samer
//
//  Created by Uthealth0122 on 16/6/14.
//
//

#import "CartoonCell.h"

@implementation CartoonCell

- (void)awakeFromNib {
    // Initialization code
}

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

@end
