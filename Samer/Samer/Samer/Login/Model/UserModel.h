//
//  UserModel.h
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/11.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (copy, nonatomic) NSString *user_id;
@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *gender;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *tel;
@property (assign, nonatomic) NSInteger age;
@property (copy, nonatomic) NSString *mail;
@property (copy, nonatomic) NSString *deviceMAC;

@property (copy, nonatomic) NSString *token;

+ (instancetype)sharedUserModel;

@end
