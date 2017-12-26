//
//  ShippingAddressViewController.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ShippingAddressViewController.h"


#import "ShippingAddressTableViewCell.h"
#import "ShippingAddressModel.h"
#import "AddShippingAddressViewController.h"
@interface ShippingAddressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *DataSource;
@property (nonatomic,strong)UIButton *AddAddressBut;
@end

@implementation ShippingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"送貨地址";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar - kHTabBar) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = NO;
    [self initData];
    [self AddAddressBut];
}

-(void)initData{
    NSArray *array = @[@{@"name":@"謝霆鋒",
                         @"phone":@"0927458399",
                         @"address":@"臺中市烏日區環中路八段787巷61弄50號",
                         @"type":@"1"
                         },
                       @{@"name":@"謝曉秋",
                         @"phone":@"0927458399",
                         @"address":@"臺中市烏日區環中路八段787巷61弄50號",
                         @"type":@"0"
                         },
                       @{@"name":@"寶劍鋒",
                         @"phone":@"0927458399",
                         @"address":@"臺中市烏日區環中路八段787巷61弄50號",
                         @"type":@"0"
                         },
                       @{@"name":@"張惠妹",
                         @"phone":@"0927458399",
                         @"address":@"臺中市烏日區環中路八段787巷61弄50號",
                         @"type":@"0"
                         }
                       ];
    self.DataSource = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        ShippingAddressModel *model = [[ShippingAddressModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.DataSource addObject:model];
    }
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = [NSString stringWithFormat:@"%ld",indexPath.row + 100];
    ShippingAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ShippingAddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    ShippingAddressModel *model = self.DataSource[indexPath.row];
    [cell setDataWithModel:model];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}

-(UIButton *)AddAddressBut{
    if (!_AddAddressBut) {
        _AddAddressBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _AddAddressBut.frame = CGRectMake(0, Kheight - kHTabBar, Kwidth, kHeight(49));
        [_AddAddressBut setTitle:@"新增地址" forState:UIControlStateNormal];
        [_AddAddressBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _AddAddressBut.titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
        _AddAddressBut.backgroundColor = [UIColor colorWithRed:0.91 green:0.31 blue:0.24 alpha:1.00];
        [_AddAddressBut addTarget:self action:@selector(AddAddressButAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_AddAddressBut];
    }
    return _AddAddressBut;
}
#pragma mark--添加新地址
-(void)AddAddressButAction{
    NSLog(@"添加新地址");
    AddShippingAddressViewController *AddShippingAddressVC = [[AddShippingAddressViewController alloc] init];
    [self.navigationController pushViewController:AddShippingAddressVC animated:YES];
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
