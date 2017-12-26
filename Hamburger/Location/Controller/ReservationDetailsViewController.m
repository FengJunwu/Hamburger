//
//  ReservationDetailsViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/5.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ReservationDetailsViewController.h"

@interface ReservationDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong) UIButton *scanningBut;
@end

@implementation ReservationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"訂位";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHTabBar) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.bounces = NO;
    
    self.dataSource = @[@{@"title":@"訂單編號",
                          @"subTitle":@"2017101501"},
                        @{@"title":@"訂單時間",
                          @"subTitle":@"2017-10-15 20:00"},
                        @{@"title":@"座位號碼",
                          @"subTitle":@"05號桌4人桌"}];
    [self headView];
    [self scanningBut];
}

-(void)headView{
    
    UIView *view = [[UIView alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"订位成功详情"];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"恭喜您，預定成功！";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [view sd_addSubviews:@[imgView,titleLabel]];
    
    imgView.sd_layout
    .topSpaceToView(view, 0)
    .leftEqualToView(view)
    .rightEqualToView(view)
    .heightIs(kHeight(200));
    
    titleLabel.sd_layout
    .topSpaceToView(imgView, kHeight(-60))
    .leftEqualToView(view)
    .rightEqualToView(view)
    .autoHeightRatio(0);
    [view setupAutoHeightWithBottomView:imgView bottomMargin:0];
    [view layoutSubviews];
    
    self.tableView.tableHeaderView = view;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.dataSource[indexPath.row][@"subTitle"];
    if (indexPath.row == 0) {
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.37 green:0.37 blue:0.37 alpha:1.00];
    }else if (indexPath.row == 1){
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.80 green:0.00 blue:0.00 alpha:1.00];
    }else{
        cell.detailTextLabel.textColor = [UIColor colorWithRed:0.87 green:0.47 blue:0.14 alpha:1.00];
    }
    return cell;
}

-(UIButton *)scanningBut{
    if (!_scanningBut) {
        _scanningBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _scanningBut.frame = CGRectMake(0, Kheight - kHeight(44), Kwidth, kHeight(44));
        [_scanningBut setBackgroundImage:[UIImage imageNamed:@"订位成功保留时间背景"] forState:UIControlStateNormal];
        [_scanningBut setTitle:@"掃描" forState:UIControlStateNormal];
        [_scanningBut setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_scanningBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:_scanningBut];
    }
    return _scanningBut;
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
