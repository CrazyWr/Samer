//
//  KKModel+CoreDataProperties.h
//  KuaiKan
//
//  Created by qianfeng on 16/3/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KKModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *authorId;
@property (nullable, nonatomic, retain) NSString *avatar_url;
@property (nullable, nonatomic, retain) NSNumber *comicId;
@property (nullable, nonatomic, retain) NSString *cover_image_url;
@property (nullable, nonatomic, retain) NSString *nickname;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *topicId;
@property (nullable, nonatomic, retain) NSString *topicTitle;
@property (nullable, nonatomic, retain) NSString *topicUserNickname;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSNumber *comments_count;

@end

NS_ASSUME_NONNULL_END
