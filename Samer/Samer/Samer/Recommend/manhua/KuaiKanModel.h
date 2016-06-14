//
//  KuaiKanModel.h
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KuaiKanModel : NSObject

@property NSString *cover_image_url;
@property NSString *title;  //2
@property NSNumber *likes_count;
@property NSNumber *comments_count;
@property NSString *url;

@property NSNumber *comicId;

@property NSString *topicTitle;
@property NSNumber *topicId;
@property NSString *topicUserNickname;



@property NSNumber *created_at;


@property NSString *authorId;
@property NSString *avatar_url;
@property NSString *nickname;

//////

//////



//评论页属性
@property NSString *content;




@end
