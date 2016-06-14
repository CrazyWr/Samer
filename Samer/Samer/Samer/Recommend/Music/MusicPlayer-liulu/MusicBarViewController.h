//
//  MusicBarViewController.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/2.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVPlayerManage.h"
@interface MusicBarViewController : UITabBarController

@property (nonatomic,strong) AVPlayerManage *avPlayer;//音乐播放管理

@end
