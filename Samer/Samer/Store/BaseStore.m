//
//  BaseStore.m
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "BaseStore.h"

@implementation BaseStore

/**
 *  @brief 请求
 *
 *  @param success 成功块
 *  @param failure 失败块
 */
- (void)requestWithSuccess:(void (^)(id data))success failure:(void (^)(NSError *error))failure {
    
    abort();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [AFHTTPSessionManager manager];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

/**
 *  @brief 错误类型转换
 *
 *  @param responseObject 输入的参数
 *
 *  @return return NSError
 */
- (NSError *)errorWitherrorResponse:(id)responseObject{

    NSError * error = nil;
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        error = [NSError errorWithDomain:responseObject[@"err_domain"] code:-1 userInfo:@{@"message":responseObject[@"message"]}];
    }else if ([responseObject isKindOfClass:[NSError class]]){
        NSError * rError = (NSError *)responseObject;
        error = [NSError errorWithDomain:rError.domain code:-1 userInfo:@{@"message":rError.localizedDescription}];
    }
    
    return error;
    
}

/**
 *  @brief 无网络连接错误
 *
 *  @param
 *
 *  @return return NSError
 */
- (NSError *)errorNoNetworking{
    
    NSError * error = [NSError errorWithDomain:@"NetWorking" code:-1 userInfo:@{@"message":@"无网络连接,请检查网络设置"}];
    return error;
    
}

/**
 *  @brief 网路类型判断
 *
 *  @return return是否有网络连接
 */
- (void)networkingConnectedSuccess:(void (^)(BOOL b))success{

    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
         AFNetworkReachabilityStatusUnknown          = -1,不能识别
         AFNetworkReachabilityStatusNotReachable     = 0,没有网
         AFNetworkReachabilityStatusReachableViaWWAN = 1,蜂窝网
         AFNetworkReachabilityStatusReachableViaWiFi = 2,局域网
         };
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                success(YES);
                break;
            }
            case AFNetworkReachabilityStatusNotReachable:{
                success(NO);
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                success(YES);
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                success(YES);
                break;
            }
        }
    }];
    
}

@end
