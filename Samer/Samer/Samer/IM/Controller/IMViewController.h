//
//  IMViewController.h
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface IMViewController : EaseConversationListViewController

@property (strong, nonatomic) NSMutableArray *conversationsArray;

- (void)refresh;
- (void)refreshDataSource;

- (void)isConnect:(BOOL)isConnect;
- (void)networkChanged:(EMConnectionState)connectionState;


@end
