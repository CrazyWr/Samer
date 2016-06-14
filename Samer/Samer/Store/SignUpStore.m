//
//  SignUpStore.m
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "SignUpStore.h"
#import "UserModel.h"

@implementation SignUpStore


- (void)requestWithSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure{

    NSDictionary * parameters = @{@"username":self.username,
                                  @"password":self.password,
                                  @"name":self.name,
                                  @"gender":self.gender,
                                  @"age":@(self.age),
                                  @"tel":self.tel,
                                  @"mail":self.mail,
                                  @"deviceMAC":self.deviceMAC};
    
    
    [self networkingConnectedSuccess:^(BOOL b){
        if (!b) {
            failure([self errorNoNetworking]);
            return ;
        }
    }];
    
    [self.manager POST:@"http://120.132.75.203:3307/user/sign_up" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"code"] intValue] == 0) {
            
            UserModel * model = [UserModel sharedUserModel];
            model.username = self.username;
            model.age = self.age;
            model.name = self.name;
            model.gender = self.gender;
            model.tel = self.tel;
            model.mail = self.mail;
            
            
            success(responseObject);
        }else{
            failure([self errorWitherrorResponse:responseObject]);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure([self errorWitherrorResponse:error]);

    }];

    
}

@end
