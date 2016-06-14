//
//  MusicPlayerListViewController.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/3.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Music.h"

typedef void (^DisappearBlock)();

@interface MusicPlayerListViewController : UIViewController

@property (nonatomic,copy)DisappearBlock disappearBlack;//视图消失时候调用的black

@end
