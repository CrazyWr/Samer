//
//  IMViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import "IMViewController.h"
#import "LoginViewController.h"


@interface IMViewController ()<EaseConversationListViewControllerDelegate, EaseConversationListViewControllerDataSource>

@property (nonatomic, strong) UIView *networkStateView;


@end

@implementation IMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"聊聊";
    
    self.delegate = self;
    self.dataSource = self;

    
    [self didLogin];
    
}

- (void)didLogin{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults valueForKey:@"username"] == nil) {
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController * login = [board instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self presentViewController:login animated:YES completion:^{
            
        }];
    }else{
    
        
        
    }
    
}

#pragma mark - EMDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
