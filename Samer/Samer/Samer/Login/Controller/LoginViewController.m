//
//  LoginViewController.m
//  Samer
//
//  Created by wei on 16/6/4.
//
//

#import "LoginViewController.h"
#import "SignInStore.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username_textField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *regist;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登陆";

    self.username_textField.delegate = self;
    self.passwordTextField.delegate = self;
    
}


- (IBAction)btn_login:(UIButton *)sender {
    
    SignInStore *store = [[SignInStore alloc] initWithUsername:self.username_textField.text Password:self.passwordTextField.text];
    
    [store requestWithSuccess:^(id data) {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    } failure:^(NSError *error) {
        [SVProgressHUD setMinimumDismissTimeInterval:1.0];
        [SVProgressHUD showErrorWithStatus:error.description];
    }];
    
}


- (IBAction)btn_regist:(UIButton *)sender {
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

    if ([textField.text isEqualToString:@""] || textField.text == nil) {
        [SVProgressHUD setMinimumDismissTimeInterval:1.0];
        [SVProgressHUD showErrorWithStatus:@"用户名或密码不能为空!!"];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.username_textField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
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
