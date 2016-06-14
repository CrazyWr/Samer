//
//  LyricTableViewCell.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LyricView_A.h"

#import "LyricView_T.h"

@interface LyricTableViewCell : UITableViewCell

@property (nonatomic ,strong)LyricView_A *lyricView;//歌词视图

@property (nonatomic,assign)CGFloat time;//当前播放时间

@property (nonatomic,copy)NSString *text;//当前播放歌词

@property (nonatomic,assign)BOOL isPlaying;//是否为正在播放的歌词cell

@end
