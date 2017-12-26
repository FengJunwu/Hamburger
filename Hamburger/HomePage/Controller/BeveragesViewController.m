//
//  BeveragesViewController.m
//  Hamburger
//
//  Created by JND on 2017/11/30.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BeveragesViewController.h"
#import "XRCarouselView.h"
#import "BeveragesTableViewCell.h"
#import "ShoppingCartViewController.h"//购物车
@interface BeveragesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@property (nonatomic, strong) XRCarouselView *carouselView;

@end

@implementation BeveragesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品詳情";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    
    [self configBanner];
    [self bottomView];
}

#pragma mark--banner
-(void)configBanner{
    /**
     *  通过代码创建
     */
    UIImage *image = [UIImage imageNamed:@"商品详情饮品banner"];
    self.carouselView = [[XRCarouselView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, Kwidth*image.size.height/image.size.width)];
    //设置占位图片,须在设置图片数组之前设置,不设置则为默认占位图
    //    _carouselView.placeholderImage = [UIImage imageNamed:@"商品详情banner"];
    _carouselView.imageArray = [NSMutableArray arrayWithArray:@[[UIImage imageNamed:@"商品详情饮品banner"]]];
    
    //设置每张图片的停留时间，默认值为5s，最少为2s
    _carouselView.time = 5;
    
    //设置分页控件的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomRight;
    /**
     *  修改图片描述控件的外观，不需要修改的传nil
     *
     *  参数一 字体颜色，默认为白色
     *  参数二 字体，默认为13号字体
     *  参数三 背景颜色，默认为黑色半透明
     */
    //    UIColor *bgColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //    UIFont *font = [UIFont systemFontOfSize:15];
    //    UIColor *textColor = [UIColor whiteColor];
    //    [_carouselView setDescribeTextColor:textColor font:font bgColor:bgColor];
    
    self.tableView.tableHeaderView = _carouselView;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BeveragesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[BeveragesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:Kwidth tableView:tableView];
}



-(void)bottomView{
    UIView *View = [[UIView alloc] init];
    View.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:View];
    
    View.sd_layout
    .topSpaceToView(self.view, Kheight - kHeight(44)-kHTabBar)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kHeight(93));
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = UIColorFromRGB(0x999999);
    
    UILabel *TotalNumberLabel = [[UILabel alloc] init];
    TotalNumberLabel.text = @"總數 7";
    TotalNumberLabel.textColor = UIColorFromRGB(0x333333);
    TotalNumberLabel.font = [UIFont systemFontOfSize:kFont(17)];
    
    UILabel *TotUpLabel = [[UILabel alloc] init];
    TotUpLabel.text = @"合計 NT 150";
    TotUpLabel.textColor = [UIColor redColor];
    TotUpLabel.textAlignment = NSTextAlignmentRight;
    TotUpLabel.font = [UIFont systemFontOfSize:kFont(17)];
    
    UIButton *ShoppingCartBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [ShoppingCartBut setTitle:@"加入購物車" forState:UIControlStateNormal];
    [ShoppingCartBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ShoppingCartBut setBackgroundImage:[UIImage imageNamed:@"加入购物车背景"] forState:UIControlStateNormal];
    [ShoppingCartBut addTarget:self action:@selector(ShoppingCartAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *purchasingBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [purchasingBut setTitle:@"直接購買" forState:UIControlStateNormal];
    [purchasingBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    purchasingBut.backgroundColor = [UIColor colorWithRed:1.00 green:0.30 blue:0.11 alpha:1.00];
    
    [View sd_addSubviews:@[lineView,TotalNumberLabel,TotUpLabel,ShoppingCartBut,purchasingBut]];
    
    lineView.sd_layout
    .topEqualToView(View)
    .rightSpaceToView(View, kWidth(15))
    .leftSpaceToView(View, kWidth(15))
    .heightIs(0.5);
    
    TotalNumberLabel.sd_layout
    .topSpaceToView(lineView, 0)
    .leftEqualToView(lineView)
    .widthRatioToView(View, 0.4)
    .heightIs(kHeight(44));
    
    TotUpLabel.sd_layout
    .topSpaceToView(lineView, 0)
    .rightEqualToView(lineView)
    .widthRatioToView(View, 0.4)
    .heightIs(kHeight(44));
    
    ShoppingCartBut.sd_layout
    .topSpaceToView(TotalNumberLabel, 0)
    .leftEqualToView(View)
    .widthRatioToView(View, 0.5)
    .heightIs(kHeight(50));
    
    purchasingBut.sd_layout
    .topSpaceToView(TotalNumberLabel, 0)
    .leftSpaceToView(ShoppingCartBut, 0)
    .widthRatioToView(View, 0.5)
    .heightIs(kHeight(50));
    
    
}
#pragma mark--跳转到购物车
-(void)ShoppingCartAction{
    
    ShoppingCartViewController *ShoppingCartVC = [[ShoppingCartViewController alloc] init];
    ShoppingCartVC.type = @"1";
    [self.navigationController pushViewController:ShoppingCartVC animated:YES];
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
