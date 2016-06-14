//
//  AppDelegate.h
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import <UIKit/UIKit.h>
#import "ApplyViewController.h"
#import "MainViewController.h"

@protocol stop <NSObject>
//@property(nonatomic,assign)id <stop>delegate;
-(void)stopPlay;

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate,EMChatManagerDelegate>{

    EMConnectionState _connectionState;
}

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,assign)id <stop>delegate;

@property (strong, nonatomic) MainViewController *mainController;

@end

