//
//  UpdatePasswordStore.h
//  AI_Robot
//
//  Created by Uthealth0122 on 16/5/13.
//  Copyright © 2016年 HSun. All rights reserved.
//

#import "BaseStore.h"

@interface UpdatePasswordStore : BaseStore

@property (copy, nonatomic) NSString *tel;

@property (copy, nonatomic) NSString *password;

@property (copy, nonatomic) NSString *token;

- (instancetype)initWithUsername:(NSString *)tel Password:(NSString *)password
;

@end
