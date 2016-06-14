//
//  SignUpStore.h
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStore.h"

@interface SignUpStore : BaseStore

@property (copy, nonatomic) NSString *username;

@property (copy, nonatomic) NSString *password;

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *tel;

@property (copy, nonatomic) NSString *gender;

@property (assign, nonatomic) NSInteger age;

@property (copy, nonatomic) NSString *mail;

@property (copy, nonatomic) NSString *deviceMAC;

@end
