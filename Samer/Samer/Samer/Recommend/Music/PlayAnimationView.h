//
//  PlayAnimationView.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/8.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface PlayAnimationView : UIView

@property (nonatomic,assign) CGFloat animationTime;//动画时长

//播放歌曲

-(void)playMusic;

//暂停歌曲

-(void)pauserMusic;
@end
