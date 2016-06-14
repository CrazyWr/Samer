//
//  ActivityModel.h
//  Samer
//
//  Created by wei on 16/6/4.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityModel : NSObject

@property (nonatomic, copy) NSString *activityTitle;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *adddress;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, strong) NSMutableArray *userList;
@property (nonatomic, strong) UIImage *headImage;

@end
