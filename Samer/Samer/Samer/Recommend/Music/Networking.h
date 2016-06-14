//
//  Networking.h
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/4.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NetWorkBlock)(id object);

@interface Networking : NSObject


+(Networking *)shareNetworking;

//GET异步请求

-(void)networkingGetWithURL:(NSString *)urlString Block:(NetWorkBlock)block;

@end
