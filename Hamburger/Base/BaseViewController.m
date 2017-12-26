//
//  BaseViewController.m
//  LoveToComeHome
//
//  Created by JND on 2017/10/23.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController (){
    UIScreenEdgePanGestureRecognizer *_screenEdgePan;
    UIView                           *_vipView;
    UIBarButtonItem                  *_leftItem;
    
}


@end

@implementation BaseViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    

    if (@available(iOS 11, *)) {
        [self initLiftBarButtonItem];
    }
    [self setupNavBar];
}


- (void)initLiftBarButtonItem{
    
    _leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Back-icon"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = _leftItem;
    
}

-(void)backAction{
    
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];

    // 设置自定义导航栏背景图片
    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"Menu-Bar"];

    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];


}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
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
