//
//  RegistViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/6/15.
//
//

#import "RegistViewController.h"
#import "SignUpStore.h"

@interface RegistViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UITextField *mailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *btnRegist;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
    
}

- (IBAction)regist:(UIButton *)sender {
    
    SignUpStore *store = [[SignUpStore alloc] init];
    store.username = self.usernameTextField.text;
    store.password = self.passwordTextField.text;
    store.tel = self.telTextField.text;
    store.mail = self.mailTextField.text;
    
    [store requestWithSuccess:^(id data) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.telTextField resignFirstResponder];
    [self.mailTextField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
