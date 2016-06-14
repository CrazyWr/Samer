//
//  UpdatePasswordStore.m
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/13.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "UpdatePasswordStore.h"
#import "UserModel.h"

@implementation UpdatePasswordStore

- (instancetype)initWithUsername:(NSString *)tel Password:(NSString *)password
{
    self = [super init];
    if (self) {
        self.tel = tel;
        self.password = password;
    }
    return self;
}

- (void)requestWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure{

    NSDictionary * parameters = @{@"tel":self.tel,
                                  @"password":self.password,
                                  @"token":self.token};
    
    [self networkingConnectedSuccess:^(BOOL b){
        if (!b) {
            failure([self errorNoNetworking]);
            return ;
        }
    }];
    
    [self.manager POST:@"http://120.132.75.203:3307/user/update_password" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
              success(responseObject);
        }else{
            failure([self errorWitherrorResponse:responseObject]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure([self errorWitherrorResponse:error]);
    }];

}


@end
