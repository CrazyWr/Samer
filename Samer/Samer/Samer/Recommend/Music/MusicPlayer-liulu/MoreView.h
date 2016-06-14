//
//  MoreView.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BlockFloat)(CGFloat index);

@interface MoreView : UIView

@property (nonatomic,copy)BlockFloat block;//传递音量大小值

@property (nonatomic,assign) CGFloat nowVolume;//当前音量

@end
