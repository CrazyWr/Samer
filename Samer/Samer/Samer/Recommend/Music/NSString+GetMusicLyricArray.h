//
//  NSString+GetMusicLyricArray.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GetMusicLyricArray)

//将歌词字符串转换成歌词数组

+(NSMutableArray*)getMusicLyricArrayWithString:(NSString *)string;

@end
