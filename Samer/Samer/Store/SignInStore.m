//
//  SIgnInStore.m
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "SignInStore.h"
#import "UserModel.h"
@implementation SignInStore

- (instancetype)initWithUsername:(NSString *)username Password:(NSString *)password
{
    self = [super init];
    if (self) {
        self.username = username;
        self.password = password;
    }
    return self;
}

- (void)requestWithSuccess:(void (^)(id data))success failure:(void (^)(NSError *))failure{
    
    NSDictionary * parameters = @{@"username":self.username,
                                  @"password":self.password,};
    
    [self networkingConnectedSuccess:^(BOOL b){
        if (!b) {
            failure([self errorNoNetworking]);
            return ;
        }
    }];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("group", DISPATCH_QUEUE_CONCURRENT);
    __block id datas = nil;
    dispatch_group_async(group, queue, ^{
        [self.manager POST:@"http://120.132.75.203:3307/user/sign_in" parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if ([responseObject[@"code"] intValue] == 0) {
                
                UserModel * model = [UserModel sharedUserModel];
                model.token = responseObject[@"user_token"];
                model.username = self.username;
                model.tel = responseObject[@"tel"];
                model.user_id = responseObject[@"user_id"];
                
                datas = responseObject;
            }else{
                failure([self errorWitherrorResponse:responseObject]);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure([self errorWitherrorResponse:error]);
            
        }];

    });
    
    dispatch_group_async(group, queue, ^{
        EMError *error = [[EMClient sharedClient] registerWithUsername:@"8001" password:@"111111"];
        if (error!=nil) {
            failure([self errorWitherrorResponse:error]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        [self saveDataOfUser];
        success(datas);
    });
}

//存储用户数据
- (void)saveDataOfUser{
    
    NSUserDefaults * userDefults = [NSUserDefaults standardUserDefaults];
    UserModel *model = [UserModel sharedUserModel];
    [userDefults setValuesForKeysWithDictionary:@{@"username":self.username,
                                                  @"password":self.password,
                                                  @"tel":model.tel,
                                                  @"user_id":model.user_id,
                                                  @"user_token":model.token}];
    
    //数据同步到磁盘
    [userDefults synchronize];
    
}

@end
