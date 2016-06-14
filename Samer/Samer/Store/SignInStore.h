//
//  SIgnInStore.h
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/5.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStore.h"

@interface SignInStore : BaseStore

@property (copy, nonatomic) NSString * username;

@property (copy, nonatomic) NSString * password;

- (instancetype)initWithUsername:(NSString *)username Password:(NSString *)password;

@end
