//
//  HomePageViewController.m
//  Hamburger
//
//  Created by JND on 2017/11/29.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "HomePageViewController.h"
#import "WJItemsControlView.h"
#import "HomePageModel.h"
#import "HomePageTableViewCell.h"

#import "HamburgerDetailsViewController.h"//汉堡详情
#import "BeveragesViewController.h"//饮品

@interface HomePageViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    WJItemsControlView *_itemControlView;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"首頁";
    
    
    
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom)];
    [recognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:recognizerLeft];
    
    [self initData];
    [self DeploymentView];
}
#pragma mark--配置视图文件
-(void)DeploymentView{
    NSArray *array = @[@"精致套餐",@"漢堡包",@"現烤土司",@"可頌堡"];
    
    //4页内容的scrollView
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar - kHTabBar)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    scroll.contentSize = CGSizeMake(Kwidth*array.count, 100);
    

    for (int i=0; i<array.count; i++) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(Kwidth * i, 44 , Kwidth, Kheight - kHNavBar - kHTabBar - 44) style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tag = i;
        
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom)];
//        [self.tableView addGestureRecognizer:pan];
        
        [scroll addSubview:self.tableView];
    }
    [self.view addSubview:scroll];
    
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = Kwidth/array.count;
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, kHNavBar + 44 -45, Kwidth, 45)];
    UIImageView *img = [[UIImageView alloc] init];
    img.frame = CGRectMake(0, 0, Kwidth, kHeight(45));
    img.image =[UIImage imageNamed:@"Menu-Bar"];
    
    [_itemControlView addSubview:img];
    
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    
    __weak typeof (scroll)weakScrollView = scroll;
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        
        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
        
    }];
    [self.view addSubview:_itemControlView];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
}



-(void)initData{
    self.dataSource = [[NSMutableArray alloc] init];
    NSArray *array = @[@{@"img":@"首页点餐img1",
                          @"title":@"雙喜蛋堡",
                          @"start":@1
                          },
                        @{@"img":@"首页点餐img2",
                          @"title":@"起司鷄蛋堡",
                          @"start":@0
                          },
                        @{@"img":@"首页点餐img3",
                          @"title":@"現烤吐司",
                          @"start":@1
                          },
                       @{@"img":@"首页点餐img1",
                         @"title":@"雙喜蛋堡",
                         @"start":@1
                         },
                       @{@"img":@"首页点餐img2",
                         @"title":@"起司鷄蛋堡",
                         @"start":@0
                         },
                       @{@"img":@"首页点餐img3",
                         @"title":@"現烤吐司",
                         @"start":@1
                         }
                        ];
    
    for (NSDictionary *dic in array) {
        HomePageModel *model = [[HomePageModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataSource addObject:model];
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[HomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    HomePageModel *model = self.dataSource[indexPath.row];
    [cell setDataWithModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        BeveragesViewController *BeveragesVC = [[BeveragesViewController alloc] init];
        [self.navigationController pushViewController:BeveragesVC animated:YES];
    }else{
        HamburgerDetailsViewController *HamburgerDetailsVC = [[HamburgerDetailsViewController alloc] init];
        [self.navigationController pushViewController:HamburgerDetailsVC animated:YES];
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, kHeight(30))];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"※標為超人氣點餐";
    label1.textColor = [UIColor colorWithRed:0.97 green:0.23 blue:0.28 alpha:1.00];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = [UIFont systemFontOfSize:kFont(15)];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label1.text];
    //添加一张照片
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"首页星星"];
    attach.bounds = CGRectMake(0, -2, 15, 15);
    NSAttributedString *picAttr = [NSAttributedString attributedStringWithAttachment:attach];
    [attr insertAttributedString:picAttr atIndex:2];
    label1.attributedText = attr;
    
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"※所有點餐加起司多加10元";
    label2.textColor = [UIColor colorWithRed:0.97 green:0.23 blue:0.28 alpha:1.00];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:kFont(15)];
    
    [view sd_addSubviews:@[label1,label2]];
    label1.sd_layout
    .topEqualToView(view)
    .leftEqualToView(view)
    .bottomEqualToView(view)
    .widthRatioToView(view, 0.5);
    
    label2.sd_layout
    .topEqualToView(view)
    .rightEqualToView(view)
    .bottomEqualToView(view)
    .widthRatioToView(view, 0.5);
    
    return view;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kHeight(44);
}


-(void)handleSwipeFrom{
    
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
