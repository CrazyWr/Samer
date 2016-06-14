//
//  KKViewController2.m
//  KuaiKan
//
//  Created by admin on 16/2/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "KKViewController2.h"

@interface KKViewController2 ()

@end

@implementation KKViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMyUrl
{
    self.url=@"http://api.kuaikanmanhua.com/v1/comic_lists/1?offset=23&limit=22";
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
