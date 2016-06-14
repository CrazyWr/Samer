//
//  MusicBarMusicView.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Music.h"

@interface MusicBarMusicView : UIView

@property (nonatomic,strong)Music *music;

@property (nonatomic,strong)UIImageView *PicImageView;//专辑图

@property (nonatomic,strong)UILabel *titleLabel;//标题

@property (nonatomic,strong)UILabel *singerLabel;// 歌手

//旋转专辑图

-(void)rotatePicImageView;

@end
