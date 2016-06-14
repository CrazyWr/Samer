//
//  UserModel.m
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/11.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+ (instancetype)sharedUserModel{

    static UserModel * model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[UserModel alloc] init];
    });
    
    return model;
}

@end
