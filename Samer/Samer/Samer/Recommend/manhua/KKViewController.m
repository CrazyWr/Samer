//
//  KKViewController.m
//  KuaiKan
//
//  Created by admin on 16/2/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "KKViewController.h"
#import "KKViewController7.h"
#import "KKViewController6.h"
#import "KKViewController5.h"
#import "KKViewController4.h"
#import "KKViewController3.h"
#import "KKViewController2.h"
#import "KKViewController1.h"

#import "SCNavTabBarController.h"//主效果管理者

#import "ZWIntroductionViewController.h"


@interface KKViewController ()

@property (nonatomic, strong) ZWIntroductionViewController *introductionView;

@end



@implementation KKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"漫画列表";
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    [self createControllers];
    
}

-(void)createControllers
{
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    int day=(int)[self isWhatDay];
    KKViewController1 *k1=[sb instantiateViewControllerWithIdentifier:@"KKViewController1"];
    k1.title=@"今天";
    
    
    KKViewController2 *k2=[sb instantiateViewControllerWithIdentifier:@"KKViewController2"];
    k2.title=@"昨天";
    
    
    KKViewController3 *k3=[sb instantiateViewControllerWithIdentifier:@"KKViewController3"];
    k3.title=[self panduan2:[self panduan1:day-2]];
    
    KKViewController4 *k4=[sb instantiateViewControllerWithIdentifier:@"KKViewController4"];
    k4.title=[self panduan2:[self panduan1:day-3]];
    
    KKViewController5 *k5=[sb instantiateViewControllerWithIdentifier:@"KKViewController5"];
    k5.title=[self panduan2:[self panduan1:day-4]];
    
    KKViewController6 *k6=[sb instantiateViewControllerWithIdentifier:@"KKViewController6"];
    k6.title=[self panduan2:[self panduan1:day-5]];
    
    KuaiKanViewController *kuaikan=[sb instantiateViewControllerWithIdentifier:@"KuaiKanViewController"];
    kuaikan.title=[self panduan2:[self panduan1:day-6]];
    
    
    
    //2.创建效果管理者
    SCNavTabBarController * scNav = [[SCNavTabBarController alloc]init];
    [scNav setNavTabBarColor:[UIColor colorWithRed:35/255.0 green:43/255.0 blue:60/255.0 alpha:0.5]];
    
    //底色
    self.view.backgroundColor = [UIColor colorWithRed:55/255.0 green:63/255.0 blue:80/255.0 alpha:1];
    
    
    //3.管理视图
    //将所需管理的视图控制器存入数组赋予给subViewControllers属性即可
    scNav.subViewControllers = @[k1,k2,k3,k4,k5,k6,kuaikan];
    for (UIViewController *vc in scNav.subViewControllers) {
        vc.view.bounds = CGRectMake(-12, 0, 0, 0);
        
    }
    
    //执行管理
    [scNav addParentController:self];
    
}
-(int)panduan1:(int)day
{
    int num;
    if (day==0) {
        num=7;
    }
    else if (day==-1)
    {
        num=6;
    }
    else if (day==-2)
    {
        num=5;
    }
    else if (day==-3)
    {
        num=4;
    }
    else if (day==-4)
    {
        num=3;
    }
    else if (day==-5)
    {
        num=2;
    }
    else if (day==-6)
    {
        num=1;
    }
    else
    {
        return day;
    }
    return num;
}
-(NSString *)panduan2:(int)day
{
    NSString *str;
    if (day==2) {
        str=@"星期一";
    }
    else if (day==3)
    {
        str=@"星期二";
    }
    else if (day==4)
    {
        str=@"星期三";
    }
    else if (day==5)
    {
        str=@"星期四";
    }
    else if (day==6)
    {
        str=@"星期五";
    }
    else if (day==7)
    {
        str=@"星期六";
    }
    else if (day==1)
    {
        str=@"星期日";
    }
    
    
    return str;
}


-(long)isWhatDay
{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit |NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    
    NSLog(@"-----------weekday is %ld",(long)[comps weekday]);//在这里需要注意的是：星期日是数字1，星期一时数字2，以此类推。。。
    return [comps weekday];
    
}

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = NO;
    
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
