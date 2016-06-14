//
//  LyricTableView.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockLyric)(CGFloat time,NSString *text);

typedef void(^BlockSetPlayTime)(CGFloat time);


@interface LyricTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSString *lyricString;//歌词字符串

@property (nonatomic,assign) CGFloat nowTime;//当前播放的时间

@property (nonatomic,assign) CGFloat totalTime;//歌曲总时长

@property (nonatomic,copy)BlockLyric blockLyric;//block传递当前播放的歌词秒与内容

@property (nonatomic,copy)BlockSetPlayTime setPlayTimeBlock;//设置播放时间Block

@property (nonatomic,assign) BOOL isPlayer;//是否停止播放

@end
