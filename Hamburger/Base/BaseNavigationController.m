//
//  BaseNavigationController.m
//  LoveToComeHome
//
//  Created by JND on 2017/10/23.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController (){
    UIScreenEdgePanGestureRecognizer *_screenEdgePan;
    UIView                           *_vipView;
    UIBarButtonItem                  *_leftItem;
    
}

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17.0]};
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];

    if (@available(iOS 11, *)) {
        [self initLiftBarButtonItem];
    }

    
}




- (void)initLiftBarButtonItem{
    
    _leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navBackImg"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = _leftItem;
    
}

-(void)backAction{
    
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        // target 传空也会有一个默认的点击 方法可以用来返回到上一个界面
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    }
    return [super pushViewController:viewController animated:animated];
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
