//
//  NSString+GetMusicLyricArray.m
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/10.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import "NSString+GetMusicLyricArray.h"

@implementation NSString (GetMusicLyricArray)

+(NSMutableArray*)getMusicLyricArrayWithString:(NSString *)string
{
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@"\n"]];
    
    //删除最后一个空元素
    
    [mutableArray removeLastObject];
    
    return mutableArray;
}

@end
