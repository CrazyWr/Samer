//
//  MusicCell.m
//  Samer
//
//  Created by Uthealth0122 on 16/6/3.
//
//

#import "MusicCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MusicCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation MusicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)loadDataFromModel:(Music *)model{

    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"Music215"]];
    self.title.text = model.name;
    self.name.text = model.singer;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
