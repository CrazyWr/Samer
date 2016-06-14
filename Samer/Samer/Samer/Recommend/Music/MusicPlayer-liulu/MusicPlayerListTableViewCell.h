//
//  MusicPlayerListTableViewCell.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/4.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Music.h"

#import "PlayAnimationView.h"

#import "AVPlayerManage.h"

typedef void(^DeleteBlock)(Music *music);

@interface MusicPlayerListTableViewCell : UITableViewCell

@property (nonatomic,strong) AVPlayerManage *avPlayer;//音乐播放管理

@property (nonatomic,strong) Music *music;

@property (nonatomic,strong) Music *playingMusic;//正在播放的歌曲信息

@property (nonatomic,strong) UILabel *titleLabel;//歌曲名称

@property (nonatomic,strong) PlayAnimationView *playAnimationView;//播放动画视图

@property (nonatomic,strong) UIButton *deleteButton;//删除按钮

@property (nonatomic,copy) DeleteBlock deleteBlock;//删除音乐Block；

@end
