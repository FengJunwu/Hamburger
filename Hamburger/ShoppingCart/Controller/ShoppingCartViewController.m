//
//  ShoppingCartViewController.m
//  Hamburger
//
//  Created by JND on 2017/11/29.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartModel.h"
#import "ShoppingCartTableViewCell.h"
@interface ShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"購物車";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    
    [self initData];
    [self bottomView];
    
}

-(void)initData{
    NSArray *array = @[@{@"img":@"购物车商品1",
                          @"title":@"火腿漢堡",
                          @"oldMoney":@"NT 30",
                          @"NewMoney":@"NT 20",
                          @"number":@"X3"
                          },
                        @{@"img":@"购物车商品2",
                          @"title":@"蔬果蛋堡",
                          @"oldMoney":@"NT 50",
                          @"NewMoney":@"NT 40",
                          @"number":@"X5"
                          
                          },
                        @{@"img":@"购物车商品3",
                          @"title":@"泰國進口新鮮菠蘿",
                          @"oldMoney":@"NT 30.5",
                          @"NewMoney":@"NT 10.5",
                          @"number":@"X2"
                          
                          }];
    for (NSDictionary *dic in array) {
        ShoppingCartModel *model = [[ShoppingCartModel alloc] init];
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
    ShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ShoppingCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    ShoppingCartModel *model = self.dataSource[indexPath.row];
    
    [cell setDataWithModel:model];
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}


-(void)bottomView{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
    [self.view addSubview:view];
    
    if ([self.type isEqualToString:@"1"]) {
        view.sd_layout
        .bottomSpaceToView(self.view, 0)
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .heightIs(kHeight(49));
    }else{
        view.sd_layout
        .bottomSpaceToView(self.view, kHTabBar)
        .leftEqualToView(self.view)
        .rightEqualToView(self.view)
        .heightIs(kHeight(49));
    }
    
    UILabel *TotalNumber = [[UILabel alloc] init];
    TotalNumber.text = @"合計：5件";
    TotalNumber.font = [UIFont systemFontOfSize:kFont(15)];
    TotalNumber.textColor = [UIColor colorWithRed:0.44 green:0.44 blue:0.44 alpha:1.00];
    
    UIButton *downBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [downBut setTitle:@"選好了" forState:UIControlStateNormal];
    [downBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downBut setBackgroundImage:[UIImage imageNamed:@"购物车付款背景"] forState:UIControlStateNormal];
    downBut.titleLabel.font = [UIFont systemFontOfSize:kFont(16)];
    
    UILabel *TotalPrice = [[UILabel alloc] init];
    TotalPrice.text = @"總價：NT 96";
    TotalPrice.font = [UIFont systemFontOfSize:kFont(15)];
    TotalPrice.textColor = [UIColor colorWithRed:1.00 green:0.56 blue:0.31 alpha:1.00];
    TotalPrice.textAlignment = NSTextAlignmentRight;
    
    [view sd_addSubviews:@[TotalNumber,downBut,TotalPrice]];
    
    TotalNumber.sd_layout
    .topEqualToView(view)
    .leftSpaceToView(view, kWidth(15))
    .bottomEqualToView(view)
    .widthRatioToView(view, 0.3);
    
    downBut.sd_layout
    .topEqualToView(view)
    .rightEqualToView(view)
    .widthIs(kWidth(125))
    .bottomEqualToView(view);
    
    TotalPrice.sd_layout
    .topEqualToView(view)
    .rightSpaceToView(downBut, kWidth(10))
    .widthRatioToView(view, 0.3)
    .bottomEqualToView(view);
    
}



-(NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
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
