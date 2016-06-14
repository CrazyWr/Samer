//
//  AppDelegate.h
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import <UIKit/UIKit.h>

@protocol stop <NSObject>
//@property(nonatomic,assign)id <stop>delegate;
-(void)stopPlay;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,assign)id <stop>delegate;


@end

