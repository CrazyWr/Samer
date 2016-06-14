//
//  MusicStore.m
//  Samer
//
//  Created by Uthealth0122 on 16/6/3.
//
//

#import "MusicStore.h"

@implementation MusicStore

- (void)requestWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    [self networkingConnectedSuccess:^(BOOL b){
        if (!b) {
            failure([self errorNoNetworking]);
            return ;
        }
    }];
    
    [self.manager GET:self.url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject[@"song_list"] != NULL) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

@end
