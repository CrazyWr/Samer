//
//  Music.m
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/3.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import "Music.h"

@implementation Music

- (instancetype)initWithName:(NSString *)name ImageUrl:(NSString *)url Singer:(NSString *)singer{

    Music *m = [[Music alloc] init];
    m.name = name;
    m.picUrl = url;
    m.singer = singer;
    m.artistsName = singer;
    return m;
    
}

@end
