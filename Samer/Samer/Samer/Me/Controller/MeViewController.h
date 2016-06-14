//
//  MeViewController.h
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"
#import "UserModel.h"

@interface MeViewController : MyViewController

@property (nonatomic, strong) UserModel *model;

@end
