//
//  KKViewController5.m
//  KuaiKan
//
//  Created by admin on 16/2/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "KKViewController5.h"

@interface KKViewController5 ()

@end

@implementation KKViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setMyUrl
{
    self.url=@"http://api.kuaikanmanhua.com/v1/comic_lists/1?offset=89&limit=22";
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
