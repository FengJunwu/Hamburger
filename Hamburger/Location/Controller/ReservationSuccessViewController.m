//
//  ReservationSuccessViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/5.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ReservationSuccessViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "ReservationDetailsViewController.h"
@interface ReservationSuccessViewController ()
@property(nonatomic,strong) UIButton *scanningBut;
@end

@implementation ReservationSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"訂位";
    
    UIImageView *imgView= [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:@"订位成功"];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"恭喜您，預定成功！";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *backBut = [[UIButton alloc] init];
    [backBut setTitle:@"返回首页" forState:UIControlStateNormal];
    [backBut setBackgroundImage:[UIImage imageNamed:@"订位成功返回首页"] forState:UIControlStateNormal];
    [backBut addTarget:self action:@selector(backButAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *CheckDetails = [[UIButton alloc] init];
    [CheckDetails setTitle:@"查看詳情" forState:UIControlStateNormal];
    [CheckDetails setBackgroundImage:[UIImage imageNamed:@"订位成功查看详情"] forState:UIControlStateNormal];
    [CheckDetails addTarget:self action:@selector(CheckDetailsButAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view sd_addSubviews:@[imgView,titleLabel,backBut,CheckDetails]];
    
    imgView.sd_layout
    .topSpaceToView(self.view, kHNavBar-1)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kHeight(200));
    
    titleLabel.sd_layout
    .topSpaceToView(imgView, kHeight(-60))
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .autoHeightRatio(0);
    
    backBut.sd_layout
    .topSpaceToView(imgView, kHeight(30))
    .leftSpaceToView(self.view, kWidth(20))
    .widthIs(kWidth(150))
    .heightIs(kHeight(40));
    
    CheckDetails.sd_layout
    .topSpaceToView(imgView, kHeight(30))
    .rightSpaceToView(self.view, kWidth(20))
    .widthIs(kWidth(150))
    .heightIs(kHeight(40));
    
    [self scanningBut];
}

-(void)backButAction{
    //跳转到指定tabbar
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MainViewController *tab = (MainViewController *)delegate.window.rootViewController;
    tab.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)CheckDetailsButAction{
    ReservationDetailsViewController *ReservationDetailsV = [[ReservationDetailsViewController alloc] init];
    [self.navigationController pushViewController:ReservationDetailsV animated:YES];
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
