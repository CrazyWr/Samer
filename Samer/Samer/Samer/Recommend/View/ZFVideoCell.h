//
//  ZFVideoCell.h
//  Samer
//
//  Created by Uthealth0122 on 16/6/12.
//
//

#import <UIKit/UIKit.h>
#import "ZFPlayer.h"
#import "ZFPlayerModel.h"

typedef void(^PlayBtnCallBackBlock)(UIButton *);

@interface ZFVideoCell : UITableViewCell

@property (weak, nonatomic  ) IBOutlet UIImageView          *avatarImageView;
@property (weak, nonatomic  ) IBOutlet UIImageView          *picView;
@property (weak, nonatomic  ) IBOutlet UILabel              *titleLabel;
@property (nonatomic, strong) UIButton             *playBtn;
/** model */
@property (nonatomic, strong) ZFPlayerModel        *model;
/** 播放按钮block */
@property (nonatomic, copy  ) PlayBtnCallBackBlock playBlock;

@end
