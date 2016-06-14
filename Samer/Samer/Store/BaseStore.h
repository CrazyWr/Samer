//
//  BaseStore.h
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface BaseStore : NSObject

@property (strong, nonatomic) AFHTTPSessionManager * manager;

/**
 *  @brief 请求
 *
 *  @param success 成功块
 *  @param failure 失败块
 */
- (void)requestWithSuccess:(void (^)(id))success failure:(void (^)(NSError *error))failure;

/**
 *  @brief 网路类型判断
 *
 *  @return return是否有网络连接
 */
- (void)networkingConnectedSuccess:(void (^)(BOOL b))success;

/**
 *  @brief 错误类型转换
 *
 *  @param responseObject 输入的参数
 *
 *  @return return NSError
 */
- (NSError *)errorWitherrorResponse:(id)responseObject;

/**
 *  @brief 无网络连接错误
 *
 *  @param
 *
 *  @return return NSError
 */
- (NSError *)errorNoNetworking;

@end
