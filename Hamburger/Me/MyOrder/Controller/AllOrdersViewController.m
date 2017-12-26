//
//  AllOrdersViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/1.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "AllOrdersViewController.h"
#import "OrderTableViewCell.h"
#import "OrderModel.h"

#import "AppraiseViewController.h"//评价
#import "OrderDetailsViewController.h"//订单详情
@interface AllOrdersViewController ()<UITableViewDelegate,UITableViewDataSource,OrderTableViewCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation AllOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, Kheight - kHNavBar - kHeight(44)) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = NO;
    
    [self initData];
    
}

-(void)initData{
    NSArray *array = @[
                       @{@"title":@"張爺漢堡（臺中店）",
                         @"state":@"賣家已發貨",
                         @"name1":@"雙喜蛋堡",
                         @"name2":@"百香果茶",
                         @"tag1":@"小杯",
                         @"tag2":@"內用",
                         @"butTitle":@"確認收貨"
                         },
                       @{@"title":@"張爺漢堡（臺中店）",
                         @"state":@"交易成功",
                         @"name1":@"雙喜蛋堡",
                         @"name2":@"百香果茶",
                         @"tag1":@"小杯",
                         @"tag2":@"外帶",
                         @"butTitle":@"評價"
                         
                         },
                       @{@"title":@"張爺漢堡（臺中店）",
                         @"state":@"等待買家發貨",
                         @"name1":@"雙喜蛋堡",
                         @"name2":@"百香果茶",
                         @"tag1":@"小杯",
                         @"tag2":@"外帶",
                         @"butTitle":@"確認收貨"
                         
                         }];
    
    self.dataSource = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        OrderModel *model = [[OrderModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"%ld",indexPath.row + 100];
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[OrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    OrderModel *model = self.dataSource[indexPath.row];
    [cell setDataWithModel:model];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}

-(void)orderProcessing:(int)index{
    
    OrderModel *model = self.dataSource[index - 100];
    if ([model.state isEqualToString:@"交易成功"]) {
        AppraiseViewController *AppraiseVC= [[AppraiseViewController alloc] init];
        [self.navigationController pushViewController:AppraiseVC animated:YES];
    }
}
#pragma mark--订单详情
-(void)orderDetails:(int)index{
    
    //根据下标跳转到对应的订单详情页面
    OrderModel *model = self.dataSource[index - 100];
    
    if ([model.state isEqualToString:@"賣家已發貨"]) {
        OrderDetailsViewController *OrderDetailsViewVC= [[OrderDetailsViewController alloc] init];
        OrderDetailsViewVC.model = model;
        [self.navigationController pushViewController:OrderDetailsViewVC animated:YES];
    }
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
