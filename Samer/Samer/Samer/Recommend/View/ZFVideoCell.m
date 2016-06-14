//
//  ZFVideoCell.m
//  Samer
//
//  Created by Uthealth0122 on 16/6/12.
//
//

#import "ZFVideoCell.h"
#import <UIImageView+WebCache.h>

@implementation ZFVideoCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self cutRoundView:self.avatarImageView];
    
    // 设置imageView的tag，在PlayerView中取（建议设置100以上）
    self.picView.tag = 101;
    
    // 代码添加playerBtn到imageView上
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setImage:[UIImage imageNamed:@"video_list_cell_big_icon"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.picView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.picView);
    }];
}

// 切圆角
- (void)cutRoundView:(UIImageView *)imageView
{
    CGFloat corner = imageView.frame.size.width / 2;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)];
    shapeLayer.path = path.CGPath;
    imageView.layer.mask = shapeLayer;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setModel:(ZFPlayerModel *)model
{
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.coverForFeed] placeholderImage:[UIImage imageNamed:@"loading_bgView"]];
    self.titleLabel.text = model.title;
}

- (void)play:(UIButton *)sender {
    if (self.playBlock) {
        self.playBlock(sender);
    }
}


@end
