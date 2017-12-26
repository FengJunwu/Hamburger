//
//  OrderDetailsViewController.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "OrderDetailsViewController.h"
#import "OrderDetailsTableViewCell.h"
#import "OrderDetails1TableViewCell.h"
@interface OrderDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,OrderDetails1TableViewCellDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation OrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"訂單詳情";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = NO;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        OrderDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[OrderDetailsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        
        OrderDetails1TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderTableViewCell"];
        if (!cell) {
            cell = [[OrderDetails1TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OrderTableViewCell"];
        }
        [cell setDataWithModel:self.model];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, kHeight(44))];
    view.backgroundColor = [UIColor colorWithRed:0.99 green:0.50 blue:0.39 alpha:1.00];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"订单详情发货物流"];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"賣家已發貨";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:kFont(17)];
    
    [view sd_addSubviews:@[imgView,label]];
    imgView.sd_layout
    .topSpaceToView(view, kHeight(12))
    .leftSpaceToView(view, kWidth(15))
    .widthIs(kWidth(30))
    .heightIs(kHeight(20));
    
    label.sd_layout
    .centerYEqualToView(imgView)
    .leftSpaceToView(imgView, kWidth(10))
    .rightSpaceToView(view, kWidth(5))
    .heightIs(kHeight(44));
    
    return view;
}



#pragma mark--确认收货
-(void)orderProcessing{
    NSLog(@"确认收货");
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
