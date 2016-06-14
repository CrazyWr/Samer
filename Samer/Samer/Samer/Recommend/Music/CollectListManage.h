//
//  CollectListManage.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/24.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "Music.h"

@interface CollectListManage : NSObject

+ (CollectListManage *)shareMusicPlayerListManage;


//列表全部歌曲

- (NSMutableArray *)selectAllMusic;

//删除单首歌曲

- (BOOL)deleteMusicWithMusic:(Music *)music;

//删除全部歌曲

- (BOOL)deleteAllMusic;

//播放指定歌曲

- (void)playMusicWithMusic:(Music *)music;

//添加歌曲到播放列表

- (void)addMusicToPlayerList:(Music *)music;

//播放上一首 (传入当前播放的歌曲)

- (void)lastPlayMusic:(Music *)music;

//播放下一首 (传入当前播放的歌曲)

- (void)nextPlayMusic:(Music *)music;


//当前歌曲的上一首

- (Music *)lastPlayingMusic;

//当前歌曲的下一首

- (Music *)nextPlayingMusic;

//当前正在播放的歌曲

- (Music *)playingMusic;

//获取上一次关闭应用时的歌曲信息

- (Music *)newlyPlayMusic;
@end
