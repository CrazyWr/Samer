//
//  AVPlayerManage.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/3.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import "Music.h"

#import <CoreMedia/CMTime.h>

@protocol AVPlayerManageDelegate <NSObject>

@optional //代表以下方法可实现 可不实现



/// @brief 歌曲总时长

-(void)returnDurationTime:(CGFloat)time;

//  @brief 当前播放时间

- (void)returnNowPlayTime:(CGFloat)time;

//  @brief 当前播放进度

- (void)returnNowPlayProgress:(CGFloat)Progress;

//  @brief 当前缓冲进度

- (void)returnNowBufferProgress:(CGFloat)Progress;


//  @brief 当前播放状态 播放/暂停 YES/NO

- (void)isPlay:(BOOL)isPlay;

//  @brief 当前正在播放的歌曲

- (void)playingMusic:(Music *)music;

// @ brief  当前歌曲播放完

- (void)musicPlayEnd:(Music *)music;


@end

@interface AVPlayerManage : NSObject

/// @brief  音乐栏代理对象
@property (nonatomic,weak) id<AVPlayerManageDelegate> delegateMB;

/// @brief  音乐播放视图控制器代理对象
@property (nonatomic,weak) id<AVPlayerManageDelegate> delegateMP;

/// @brief   音乐列表代理对象
@property (nonatomic,weak) id<AVPlayerManageDelegate> delegateMPL;

/// @brief   播放列表管理代理对象
@property (nonatomic,weak) id<AVPlayerManageDelegate> delegateMPLM;

/// @brief   AVPlayerMAnager单列
+(AVPlayerManage*)shareAVPlayerManage;

/// @brief 添加播放的歌曲
-(void)addMusic:(Music*)music;

/// @brief 重新播放上一首
-(void)repeatPlayMusic;

/// @brief 播放歌曲
-(BOOL)playMusic;

/// @biref 暂停歌曲
-(BOOL)pauseMusic;

/// @biref  当前播放状态  播放／暂停
-(BOOL)isPlay;

/// @biref  当前播放状态  播放／暂停
-(Music *)playingMusic;

/// @brief  设置播放时间
-(void)setPlayToTime:(CMTime)time;

/// @brief  总播放时间
-(CGFloat)getDurationTime;

/// @brief   读取当前播放的音量
-(CGFloat)getPlayVolume;

/// @brief   修改当前播放的音量
-(void)setPlayVolume:(CGFloat)volume;






@end
