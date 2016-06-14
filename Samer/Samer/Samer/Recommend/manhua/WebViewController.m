//
//  WebViewController.m
//  KuaiKan
//
//  Created by qianfeng on 16/2/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "WebViewController.h"
#import "KKModel.h"
#import <MessageUI/MessageUI.h>



@interface WebViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>
{
    JCAlertView *_alert;
    NSMutableArray *_dataArray;
    UIScrollView *_scrollView;
}

@end

#define Width self.view.frame.size.width

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=self.model.title;
    
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:nil];

    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    btn.backgroundColor=[UIColor colorWithRed:250%255/255.0 green:187%255/255.0 blue:45%255/255.0 alpha:1];
    [btn setTitle:@"全集" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goAll:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    //NSLog(@"%@",self.model);
    self.pinglunNum.clipsToBounds=YES;
    if ([self.model.comments_count intValue]/10000>=1) {
        self.pinglunNum.text=[NSString stringWithFormat:@"%d万",[self.model.comments_count intValue]/10000];
    }
    else
    {
       self.pinglunNum.text=[NSString stringWithFormat:@"%@",self.model.comments_count];
    }
    
    [self requestData];
}

-(void)requestData
{
    //http://api.kuaikanmanhua.com/v1/comics/
    
    _dataArray=[[NSMutableArray alloc]init];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //NSString *str=[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",self.model.comicId];
    [manager GET:[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",self.model.comicId] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"images"];
        
        for (NSString *str in arr) {
//            KuaiKanModel *model=[[KuaiKanModel alloc]init];
//            model.comicId=dic[@"id"];
//            [model setValuesForKeysWithDictionary:dic];
//            model.topicTitle=dic[@"topic"][@"title"];
//            model.topicId=dic[@"topic"][@"id"];
//            model.topicUserNickname=dic[@"topic"][@"user"][@"nickname"];
//            model.authorId=dic[@"topic"][@"user"][@"id"];
//            model.avatar_url=dic[@"topic"][@"user"][@"avatar_url"];
//            model.nickname=dic[@"topic"][@"user"][@"nickname"];
//            [_dataArray addObject:model];
            
            [_dataArray addObject:str];
            
        }
        NSLog(@"网页网址:%@",[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",self.model.comicId]);
        [self createScrollVeiw];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"数据请求失败");
        
    }];
    
}

-(void)createScrollVeiw
{
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width, (_dataArray.count)*(self.view.frame.size.width-105));
    
    //[self.view addSubview:_scrollView];
    
    for (int i=0; i<_dataArray.count; i++)
    {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, i*(self.view.frame.size.width-105), self.view.frame.size.width, self.view.frame.size.width-105)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:_dataArray[i]]];
        [_scrollView addSubview:imgView];
    }
}

-(void)goAll:(UIButton *)btn
{
    if (self.model.topicId==nil) {
        return;
    }
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllViewController *all=[sb instantiateViewControllerWithIdentifier:@"AllViewController"];
    all.model=self.model;
    [self.navigationController pushViewController:all animated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
    
    NSArray *dataArray=[KKModel MR_findAll];
    for (KKModel *model in dataArray) {
        if ([self.model.cover_image_url isEqualToString:model.cover_image_url]) {
            [_shoucangBtn setImage:[UIImage imageNamed:@"star2@2x"] forState:UIControlStateNormal];
        }
    }
    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithRed:242%255/255.0 green:242%255/255.0 blue:242%255/255.0 alpha:1];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBarHidden=NO;
}

- (void)showAlertWithOneButton{

    [JCAlertView showOneButtonWithTitle:@"Collection success" Message:@"收藏成功" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"YES" Click:^{
        NSArray *dataArray=[KKModel MR_findAll];
        for (KKModel *model in dataArray) {
            if ([self.model.cover_image_url isEqualToString:model.cover_image_url]) {
                [_shoucangBtn setImage:[UIImage imageNamed:@"star2@2x"] forState:UIControlStateNormal];
            }
        }
    }];
    
}


- (void)showAlertWithOneButton2{
    
    [JCAlertView showOneButtonWithTitle:@"Collection Failure" Message:@"收藏失败,您已收藏过此漫画" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"YES" Click:^{
    }];
    
}



- (IBAction)pinglun:(UIButton *)sender {
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CommentViewController *cc=[sb instantiateViewControllerWithIdentifier:@"CommentViewController"];
    
    cc.model=self.model;
    
    [self.navigationController pushViewController:cc animated:YES];
    
    
}

- (IBAction)shareBtn:(UIButton *)sender {
    if (self.model.cover_image_url.length==0) {
        return;
    }
    //1、创建分享参数
    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.cover_image_url]] ];
    NSArray* imageArray = @[image];
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
//    [shareParams SSDKSetupShareParamsByText:self.model.title
//                                     images:imageArray
//                                        url:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",self.model.comicId]]
//                                      title:@"华丽丽的标题"
//                                       type:SSDKContentTypeAuto];
//    //2、分享（可以弹出我们的分享菜单和编辑界面）
//    [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
//                             items:nil
//                       shareParams:shareParams
//               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
//                   switch (state) {
//                       case SSDKResponseStateSuccess:
//                       {
//                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
//                                                                               message:nil
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"确定"
//                                                                     otherButtonTitles:nil];
//                           [alertView show];
//                           break;
//                       }
//                       case SSDKResponseStateFail:
//                       {
//                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
//                                                                           message:[NSString stringWithFormat:@"%@",error]
//                                                                          delegate:nil
//                                                                 cancelButtonTitle:@"OK"
//                                                                 otherButtonTitles:nil, nil];
//                           [alert show];
//                           break;
//                       }
//                       default:
//                           break;
//                   }}];
    NSLog(@"shared");
}



- (void)shareToSinaWeibo:(id)sender {
//    SLComposeViewController *socialVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
//    [socialVC setInitialText:self.model.title];
//    UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.cover_image_url]] ];
//    [socialVC addImage:image];
//    //@"http://mobiletrain.org"
//    [socialVC addURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",self.model.comicId]]];
//    [socialVC setCompletionHandler:^(SLComposeViewControllerResult result) {
//        switch (result) {
//            case SLComposeViewControllerResultCancelled:
//                NSLog(@"Cancelled");
//                break;
//            case SLComposeViewControllerResultDone:
//                NSLog(@"Done");
//                break;
//            default:
//                NSLog(@"?!?!?!?!");
//                break;
//        }
//    }];
//    
//    [self presentViewController:socialVC animated:YES completion:^{
//    }];
}

- (void)signInWithWeibo:(id)sender {
    //例如微博的登录
//    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
//           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
//     {
//         if (state == SSDKResponseStateSuccess)
//         {
//             NSLog(@"uid=%@",user.uid);
//             NSLog(@"%@",user.credential);
//             NSLog(@"token=%@",user.credential.token);
//             NSLog(@"nickname=%@",user.nickname);
//         }
//         else
//         {
//             NSLog(@"%@",error);
//         }
//     }];
}

#pragma mark - MFMessageComposeViewControllerDelegate
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Failed");
            break;
        default:
            NSLog(@"?!?!?!");
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Sent");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Saved");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed");
            break;
        default:
            NSLog(@"?!?!?!");
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:^{
    }];
}

//收藏点击事件
- (IBAction)shoucangBtn:(UIButton *)sender {
    BOOL i=NO;
    
    NSArray *dataArray=[KKModel MR_findAll];
    for (KKModel *model in dataArray) {
        if ([self.model.cover_image_url isEqualToString:model.cover_image_url]) {
            i=YES;
        }
    }
    
    if (i==NO) {
        KKModel *model=[KKModel MR_createEntity];
        
        model.authorId=[NSString stringWithFormat:@"%@",self.model.authorId];
        model.avatar_url=self.model.avatar_url;
        model.cover_image_url=self.model.cover_image_url;
        model.nickname=self.model.nickname;
        model.topicId=self.model.topicId;
        model.topicUserNickname=self.model.topicUserNickname;
        model.topicTitle=self.model.topicTitle;
        model.title=self.model.title;
        model.url=self.model.url;
        model.comments_count=self.model.comments_count;
        //    model.comicId=[NSString stringWithFormat:@"%@",self.model.comicId];
        model.comicId=self.model.comicId;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [self showAlertWithOneButton];
    }
    else
    {
        [self showAlertWithOneButton2];
    }

}

@end










