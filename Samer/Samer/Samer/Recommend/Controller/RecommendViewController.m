//
//  RecommendViewController.m
//  Samer
//
//  Created by Uthealth0122 on 16/5/27.
//
//

#import <UIImageView+WebCache.h>
#import "RecommendViewController.h"
#import "YFLBCell.h"
#import "MusicCell.h"
#import "MusicListViewController.h"
#import "RootViewController.h"
#import "MusicBarViewController.h"
#import "Music.h"
#import "ZFVideoListViewController.h"
#import "ZFTableViewController.h"
#import "ZFPlayerModel.h"
#import "VideoCell.h"
#import "ZFPlayerView.h"
#import "ZFPlayerCell.h"

#import "KKViewController.h"
#import "CartoonCell.h"
#import "AllViewController.h"

@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) ZFPlayerView  *playerView;

@property (strong, nonatomic) NSArray *sectionTitles;

@property (strong, nonatomic) NSArray *musicData;
@property (strong, nonatomic) NSMutableArray *videoData;
@property (strong, nonatomic) NSMutableArray *cartoonData;
@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = @"推荐";
    [self initArrays];
    [self loadCartoonData];
    [self initTableView];
    
}

- (void)initArrays{

    self.cartoonData = [[NSMutableArray alloc] init];
    
    self.sectionTitles = @[@"热点音乐",
                           @"最新漫画",
                           @"热点视频",
                           @"热点活动"];
    
    Music *music1 = [[Music alloc] initWithName:@"演员" ImageUrl:@"http://p4.music.126.net/qpvBqYIqkRhO9Ry2qOCdJQ==/2942293117852634.jpg" Singer:@"薛之谦"];
    music1.mid = 32507038;
    music1.blurPicUrl = @"http://music.163.com/api/img/blur/2942293117852634";
    music1.mp3Url = @"http://m2.music.126.net/zaGgmMZiqLCzJTv2GYKkaA==/1365593465215365.mp3";
    music1.lyric = @"[00:00.00] 作曲 : 薛之谦\n[00:01.00] 作词 : 薛之谦\n[00:04.200]\n[00:21.120]简单点说话的方式简单点\n[00:28.560]\n[00:30.200]递进的情绪请省略\n[00:33.640]你又不是个演员\n[00:36.380]别设计那些情节\n[00:39.360]\n[00:41.930]没意见我只想看看你怎么圆\n[00:50.410]\n[00:51.540]你难过的太表面 像没天赋的演员\n[00:57.150]观众一眼能看见\n[01:00.190]\n[01:02.220]该配合你演出的我演视而不见\n[01:07.680]在逼一个最爱你的人即兴表演\n[01:12.900]什么时候我们开始收起了底线\n[01:18.020]顺应时代的改变看那些拙劣的表演\n[01:23.420]可你曾经那么爱我干嘛演出细节\n[01:28.630]我该变成什么样子才能延缓厌倦\n[01:33.870]原来当爱放下防备后的这些那些\n[01:39.370]才是考验\n[01:41.970]\n[01:44.600]没意见你想怎样我都随便\n[01:52.890]\n[01:54.530]你演技也有限\n[01:57.580]又不用说感言\n[02:00.150]分开就平淡些\n[02:02.990]\n[02:05.000]该配合你演出的我演视而不见\n[02:10.530]别逼一个最爱你的人即兴表演\n[02:15.810]什么时候我们开始没有了底线\n[02:21.010]顺着别人的谎言被动就不显得可怜\n[02:26.430]可你曾经那么爱我干嘛演出细节\n[02:31.520]我该变成什么样子才能配合出演\n[02:36.720]原来当爱放下防备后的这些那些\n[02:41.860]都有个期限\n[02:44.600]\n[02:47.560]其实台下的观众就我一个\n[02:53.040]其实我也看出你有点不舍\n[02:58.340]场景也习惯我们来回拉扯\n[03:02.930]还计较着什么\n[03:07.390]\n[03:08.710]其实说分不开的也不见得\n[03:14.040]其实感情最怕的就是拖着\n[03:19.210]越演到重场戏越哭不出了\n[03:24.070]是否还值得\n[03:28.120]\n[03:29.070]该配合你演出的我尽力在表演\n[03:34.390]像情感节目里的嘉宾任人挑选\n[03:39.680]如果还能看出我有爱你的那面\n[03:44.820]请剪掉那些情节让我看上去体面\n[03:50.040]可你曾经那么爱我干嘛演出细节\n[03:55.310]不在意的样子是我最后的表演\n[04:01.050]是因为爱你我才选择表演 这种成全";
    Music *music2 = [[Music alloc] initWithName:@"晴天" ImageUrl:@"http://p4.music.126.net/RBNa1MGuuwhLWWC8J_Pyhg==/3242459793609734.jpg" Singer:@"周杰伦"];
    music2.mid = 186016;
    music2.blurPicUrl = @"http://music.163.com/api/img/blur/3242459793609734";
    music2.mp3Url = @"http://m2.music.126.net/U2CxR3MGaqD-DHlsCYgksg==/3291937813618641.mp3";
    music2.lyric =@"[00:29.25]故事的小黄花\n[00:32.68]从出生那年就飘着\n[00:36.17]童年的荡秋千\n[00:39.67]随记忆一直晃到现在\n[00:42.74]rui sou sou xi dou xi la\n[00:45.83]sou la xi xi xi xi la xi la sou\n[00:49.87]吹着前奏望着天空\n[00:53.17]我想起花瓣试着掉落\n[00:56.71]为你翘课的那一天\n[00:58.85]花落的那一天\n[01:00.49]教室的那一间\n[01:02.29]我怎么看不见\n[01:04.18]消失的下雨天\n[01:05.71]我好想再淋一遍\n[01:10.05]没想到失去的勇气我还留着\n[01:15.83]好想再问一遍\n[01:17.82]你会等待还是离开\n[01:24.80]刮风这天我试过握着你手\n[01:30.38]但偏偏雨渐渐大到我看你不见\n[01:38.75]还要多久我才能在你身边\n[01:45.17]等到放晴的那天也许我会比较好一点\n[01:52.63]从前从前有个人爱你很久\n[01:58.26]但偏偏风渐渐把距离吹得好远\n[02:06.54]好不容易又能再多爱一天\n[02:13.21]但故事的最后你好像还是说了拜拜\n[02:22.29]\n[02:34.96]为你翘课的那一天\n[02:36.80]花落的那一天\n[02:38.60]教室的那一间\n[02:40.34]我怎么看不见\n[02:42.08]消失的下雨天\n[02:43.98]我好想再淋一遍\n[02:47.91]没想到失去的勇气我还留着\n[02:54.39]好想再问一遍\n[02:55.95]你会等待还是离开\n[03:02.77]刮风这天我试过握着你手\n[03:08.20]但偏偏雨渐渐大到我看你不见\n[03:16.72]还要多久我才能在你身边\n[03:23.20]等到放晴的那天也许我会比较好一点\n[03:30.61]从前从前有个人爱你很久\n[03:36.74]偏偏风渐渐把距离吹得好远\n[03:44.59]好不容易又能再多爱一天\n[03:51.07]但故事的最后你好像还是说了拜拜\n[03:58.31]刮风这天我试过握着你手\n[04:02.06]但偏偏雨渐渐大到我看你不见\n[04:05.35]还要多久我才能够在你身边\n[04:08.93]等到放晴那天也许我会比较好一点\n[04:12.87]从前从前有个人爱你很久\n[04:15.81]但偏偏雨渐渐把距离吹得好远\n[04:19.25]好不容易又能再多爱一天\n[04:22.73]但故事的最后你好像还是说了\n";
    Music *music3 = [[Music alloc] initWithName:@"Faded" ImageUrl:@"http://p4.music.126.net/YGkMrDa6gmK8NHwxF5ILPw==/2540971374738594.jpg" Singer:@"Alan Walker"];
    music3.mid = 36990266;
    music3.blurPicUrl = @"http://music.163.com/api/img/blur/18277181788626198";
    music3.mp3Url = @"http://m2.music.126.net/OjgrxW7zsP6QzPE9baQULA==/1415071473003094.mp3";
    music3.lyric =@"[00:00.00] 作曲 : Jesper Borgen/Gunnar Greve Pettersen/Alan Walker/Anders Froen\n[00:01.00] 作词 : Jesper Borgen/Gunnar Greve Pettersen/Alan Walker/Anders Froen\n[00:10.720]You were the shadow to my light\n[00:14.010]Did you feel us\n[00:17.750]Another Star\n[00:19.720]You fade away\n[00:21.680]Afraid our aim is out of sight\n[00:24.560]Wanna see us\n[00:28.000]Alive\n[00:30.890]Where are you now\n[00:36.200]Where are you now\n[00:41.500]Where are you now\n[00:44.340]Was it all in my fantasy\n[00:46.820]Where are you now\n[00:49.560]Were you only imaginary\n[00:53.510]Where are you now\n[00:56.860]Atlantis\n[00:58.820]Under the sea\n[01:01.490]Under the sea\n[01:04.340]Where are you now\n[01:06.740]Another dream\n[01:10.020]The monster's running wild inside of me\n[01:14.220]I'm faded\n[01:19.660]I'm faded\n[01:23.440]So lost, I'm faded\n[01:30.220]I'm faded ~~~\n[01:34.200]So lost, I'm faded\n[01:37.530]These shallow waters never met\n[01:40.470]What i needed\n[01:44.250]I'm letting go\n[01:46.120]A deeper dive\n[01:48.120]Eternal silence of the sea\n[01:51.070]I'm breathing\n[01:54.900]Alive.\n[01:57.570]Where are you now\n[02:02.890]Where are you now\n[02:08.400]Under the bright but faded lights\n[02:10.870]You set my heart on fire\n[02:13.440]Where are you now\n[02:16.130]Where are you now\n[02:18.850]...\n[02:30.930]Where are you now\n[02:34.220]Atlantis\n[02:36.250]Under the sea\n[02:38.830]Under the sea\n[02:41.560]Where are you now\n[02:44.170]Another dream\n[02:47.460]The monster's running wild inside of me\n[02:51.450]I'm faded\n[02:56.920]I'm faded\n[03:00.900]So lost, I'm faded\n[03:07.500]I'm faded ~~~\n[03:11.360]So lost, I'm faded\n[03:14.400]...\n";
    Music *music4 = [[Music alloc] initWithName:@"小幸运（Cover 田馥甄)" ImageUrl:@"http://p4.music.126.net/P5FoiZaSZEUYcDVq-81PEg==/765260102995246.jpg" Singer:@"田馥甄"];
    music4.mid = 41665696;
    music4.blurPicUrl = @"http://music.163.com/api/img/blur/765260102995246";
    music4.mp3Url = @"http://m2.music.126.net/8FfXCiyrdMiZLVoiCohbzQ==/1395280264943170.mp3";
    music4.lyric =@"[by:深海少女_]\n[ti:]\n[ar:]\n[al:]\n[by:九九Lrc歌词网～www.99Lrc.net]\n[00:00.00] 作曲 : JerryC\n[00:01.00] 作词 : 徐世珍，吴辉福\n[00:06.57]原唱：田馥甄\n[00:08.07]翻唱：金玟岐\n[00:09.61]（该作品仅限于网络免费试听，不能用于商业用途）\n[00:10.21]\n[00:14.36]我听见雨滴落在青青草地\n[00:20.73]我听见远方下课钟声响起\n[00:27.13]可是我没有听见你的声音\n[00:32.25]认真 呼唤我姓名\n[00:40.15]爱上你的时候还不懂感情\n[00:46.28]离别了才觉得刻骨 铭心\n[00:52.79]为什么没有发现遇见了你\n[00:57.67]是生命最好的事情\n[01:03.69]也许当时忙着微笑和哭泣\n[01:10.06]忙着追逐天空中的流星\n[01:15.96]人理所当然的忘记\n[01:20.95]是谁风里雨里一直默默守护在原地\n[01:28.87]原来你是我最想留住的幸运\n[01:34.54]原来我们和爱情曾经靠得那么近\n[01:40.81]那为我对抗世界的决定\n[01:45.73]那陪我淋的雨\n[01:48.92]一幕幕都是你 一尘不染的真心\n[01:56.56]与你相遇 好幸运\n[01:59.99]可我已失去为你泪流满面的权利\n[02:06.34]但愿在我看不到的天际\n[02:11.21]你张开了双翼\n[02:14.47]遇见你的注定\n[02:19.34]她会有多幸运\n[02:26.92]多幸运\n[02:34.84]最想留住的幸运\n[02:38.49]原来我们和爱情曾经靠得那么近\n[02:44.82]那为我对抗世界的决定\n[02:49.70]那陪我淋的雨\n[02:52.76]一幕幕都是你 一尘不染的真心\n[03:00.50]与你相遇 好幸运\n[03:03.97]可我已失去为你泪流满面的权利\n[03:10.55]但愿在我看不到的天际\n[03:15.30]你张开了双翼\n[03:18.58]遇见你的注定\n[03:23.31]她会有多幸运\n";
    Music *music5 = [[Music alloc] initWithName:@"See You Again" ImageUrl:@"http://p3.music.126.net/JIc9X91OSH-7fUZqVfQXAQ==/7731765766799133.jpg" Singer:@"Wiz Khalifa"];
    music5.mid = 30953009;
    music5.blurPicUrl = @"http://music.163.com/api/img/blur/7731765766799133";
    music5.mp3Url = @"http://m2.music.126.net/gpi8Adr_-pfCuP7ZXk_F2w==/2926899953898363.mp3";
    music5.lyric =@"[00:00.00] 作曲 : Wiz Khalifa\n[00:01.00] 作词 : Wiz Khalifa\n[00:10.140]It's been a long day without you my friend\n[00:17.100]And I'll tell you all about it when I see you again\n[00:22.900]We've come a long way from where we began\n[00:28.780]Oh I'll tell you all about it when I see you again\n[00:34.800]When I see you again\n[00:39.620]Damn who knew all the planes we flew\n[00:42.600]Good things we've been through\n[00:44.310]That I'll be standing right here\n[00:46.030]Talking to you about another path\n[00:48.450]I know we loved to hit the road and laugh\n[00:50.720]But something told me that it wouldn't last\n[00:53.090]Had to switch up look at things different see the bigger picture\n[00:56.800]Those were the days hard work forever pays\n[00:59.990]Now I see you in a better place\n[01:04.720]How could we not talk about family when family's all that we got?\n[01:08.360]Everything I went through you were standing there by my side\n[01:11.260]And now you gonna be with me for the last ride\n[01:13.460]It's been a long day without you my friend\n[01:20.030]And I'll tell you all about it when I see you again\n[01:25.900]We've come a long way from where we began\n[01:31.850]Oh I'll tell you all about it when I see you again\n[01:37.870]When I see you again\n[01:55.930]First you both go out your way\n[01:57.450]And the vibe is feeling strong and what's small turn to a friendship\n[02:01.240]a friendship turn into a bond and\n[02:03.090]that bond will never be broke and the love will never get lost\n[02:07.930]And when brotherhood come first then the line\n[02:10.010]Will never be crossed established it on our own\n[02:12.430]When that line had to be drawn and that line is what we reach\n[02:15.030]So remember me when I'm gone\n[02:19.660]How could we not talk about family when family's all that we got?\n[02:23.300]Everything I went through you were standing there by my side\n[02:26.250]And now you gonna be with me for the last ride\n[02:28.780]Let the light guide your way\n[02:31.780]Hold every memory as you go\n[02:37.840]And every road you take will always lead you home\n[02:48.890]Hoo\n[02:52.350]It's been a long day without you my friend\n[02:59.020]And I'll tell you all about it when I see you again\n[03:04.920]We've come a long way from where we began\n[03:10.830]Oh I'll tell you all about it when I see you again\n[03:16.680]When I see you again\n[03:22.360]Again\n[03:28.750]When I see you again see you again\n[03:40.720]When I see you again\n";
    
    self.musicData = @[music1,music2,music3,music4,music5];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"videoData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.videoData = @[].mutableCopy;
    NSArray *videoList = [rootDict objectForKey:@"videoList"];
    
    for (int i = 0; i < 3; i++) {
        ZFPlayerModel *model = [[ZFPlayerModel alloc] init];
        [model setValuesForKeysWithDictionary:videoList[i]];
        [self.videoData addObject:model];
    }
}

- (void)loadCartoonData{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:@"http://api.kuaikanmanhua.com/v1/comic_lists/1?offset=1&limit=3" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        [self.cartoonData removeAllObjects];
        
        NSDictionary *dicy=[responseObject objectForKey:@"data"];
        
        NSArray *arr=[dicy objectForKey:@"comics"];
        for (int i=0; i<3; i++) {
            NSDictionary *dic=arr[i];
            KuaiKanModel *model=[[KuaiKanModel alloc]init];
            model.comicId=dic[@"id"];
            [model setValuesForKeysWithDictionary:dic];
            model.topicTitle=dic[@"topic"][@"title"];
            model.topicId=dic[@"topic"][@"id"];
            model.topicUserNickname=dic[@"topic"][@"user"][@"nickname"];
            model.authorId=dic[@"topic"][@"user"][@"id"];
            model.avatar_url=dic[@"topic"][@"user"][@"avatar_url"];
            model.nickname=dic[@"topic"][@"user"][@"nickname"];
            [self.cartoonData addObject:model];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

- (void)initTableView{

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-40) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.sectionHeaderHeight = 45;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2Q==.jpg"]];
    [self.tableView registerClass:[YFLBCell class] forCellReuseIdentifier:@"YFLBCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MusicCell" bundle:nil] forCellReuseIdentifier:@"MusicCell"];
    //[self.tableView registerNib:[UINib nibWithNibName:@"VideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZFVideoCell" bundle:nil] forCellReuseIdentifier:@"VideoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"CartoonCell" bundle:nil] forCellReuseIdentifier:@"CartoonCell"];
    [self.view addSubview:self.tableView];
    
}

- (void)buttonSelected:(UIButton *)button{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    switch (button.tag) {
        case 1:{
            
            MusicListViewController *MLVC = [[MusicListViewController alloc]init];
            //音乐栏控制器
            MusicBarViewController *musicBarController = [[MusicBarViewController alloc]init];
            musicBarController.viewControllers = @[MLVC];
            
            //获取tabBar中的UITaBarButton视图  并将其删除
            
            UIView *UITabBarButton = musicBarController.tabBar.subviews[1];
            
            [UITabBarButton removeFromSuperview];
            
            [self.navigationController pushViewController:musicBarController animated:YES];
            

            break;
        }
        case 2:{
            
            KKViewController *kk = [story instantiateViewControllerWithIdentifier:@"KKViewController"];
            [self.navigationController pushViewController:kk animated:YES];
            
            break;
        }
        case 3:{
//            ZFVideoListViewController *video = [story instantiateViewControllerWithIdentifier:@"ZFVideoListViewController"];
            ZFTableViewController *table = [story instantiateViewControllerWithIdentifier:@"ZFTableViewController"];
            [self.navigationController pushViewController:table animated:YES];
            
            break;
        }
        case 4:{
            
            break;
        }
        default:
            break;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionTitles.count+1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.musicData.count;
    }else if (section == 2){
        return self.cartoonData.count;
    }else if (section == 3){
        return self.videoData.count;
    }else if (section == 4){
        return 5;
    }
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        YFLBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YFLBCell" forIndexPath:indexPath];
        return cell;
        
    }else if (indexPath.section == 1){
        MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicCell" forIndexPath:indexPath];
        [cell loadDataFromModel:self.musicData[indexPath.row]];
        return cell;
        
    }else if (indexPath.section == 2){
        
        CartoonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CartoonCell" forIndexPath:indexPath];
        [cell fillData:self.cartoonData[indexPath.row]];
        return cell;
        
    }else if (indexPath.section == 3){
        
        ZFPlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
        // 取到对应cell的model
        __block ZFPlayerModel *model       = self.videoData[indexPath.row];
        // 赋值model
        cell.model                         = model;
        
        __block NSIndexPath *weakIndexPath = indexPath;
        __block ZFPlayerCell *weakCell     = cell;
        __weak typeof(self) weakSelf       = self;
        // 点击播放的回调
        cell.playBlock = ^(UIButton *btn){
            weakSelf.playerView = [ZFPlayerView sharedPlayerView];
            // 分辨率字典（key:分辨率名称，value：分辨率url)
            NSMutableDictionary *dic = @{}.mutableCopy;
            for (ZFPlyerResolution * resolution in model.playInfo) {
                [dic setValue:resolution.url forKey:resolution.name];
            }
            // 取出字典中的第一视频URL
            NSURL *videoURL = [NSURL URLWithString:dic.allValues.firstObject];
            
            // 设置player相关参数(需要设置imageView的tag值，此处设置的为101)
            [weakSelf.playerView setVideoURL:videoURL
                               withTableView:weakSelf.tableView
                                 AtIndexPath:weakIndexPath
                            withImageViewTag:101];
            [weakSelf.playerView addPlayerToCellImageView:weakCell.picView];
            
            // 下载功能
            weakSelf.playerView.hasDownload   = YES;
            // 赋值分辨率字典
            weakSelf.playerView.resolutionDic = dic;
            //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
            weakSelf.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
            // 自动播放
            [weakSelf.playerView autoPlayTheVideo];
        };

        return cell;

        
    }else if (indexPath.section == 4){
        MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MusicCell" forIndexPath:indexPath];
        return cell;
        
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
    
    }else if(indexPath.section == 1){
        NSLog(@"11111111111------%@",self.musicData);
        MusicListViewController *MLVC = [[MusicListViewController alloc]init];
        [MLVC.musicPLManage addMusicToPlayerList:self.musicData[indexPath.row]];
        //音乐栏控制器
        MusicBarViewController *musicBarController = [[MusicBarViewController alloc]init];
        
        musicBarController.viewControllers = @[MLVC];
        [musicBarController.avPlayer playMusic];
        //获取tabBar中的UITaBarButton视图  并将其删除
        
        UIView *UITabBarButton = musicBarController.tabBar.subviews[1];
        
        [UITabBarButton removeFromSuperview];
        
        [self.navigationController pushViewController:musicBarController animated:YES];

    }else if (indexPath.section == 2){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AllViewController *all = [sb instantiateViewControllerWithIdentifier:@"AllViewController"];
        
        all.model = self.cartoonData[indexPath.row];
        
        [self.navigationController pushViewController:all animated:YES];
        
    }else if (indexPath.section == 3){
        
    }else{
       
    }
   
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return nil;
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    button.tag = section;
    [button setTitle:self.sectionTitles[section-1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.3 green:0.5 blue:0.5 alpha:1] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0.871 green:0.941 blue:0.965 alpha:1.000]];
    [button addTarget:self  action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 300;
    }else if(indexPath.section == 1){
        return 60;
    }else if (indexPath.section == 2){
        return 100;
    }else if (indexPath.section == 3){
        return 340;
    }else{
        return 120;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else {
        return 45;
    }
}

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = NO;
    
}

// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
