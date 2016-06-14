//
//  Networking.m
//  MusicPlayer-liulu
//
//  Created by 刘路 on 16/3/4.
//  Copyright © 2016年 刘路. All rights reserved.
//

#import "Networking.h"

static Networking *network;

@implementation Networking



+(Networking *)shareNetworking{
    
    @synchronized(self){
        
        if (network == nil) {
            
            network = [[Networking alloc]init];
            
        }
        
        return network;
    }
}

//GET异步请求 返回DATA

-(void)networkingGetWithURL:(NSString *)urlString Block:(NetWorkBlock)block{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        block(data);
        
    }];
    

}

@end
