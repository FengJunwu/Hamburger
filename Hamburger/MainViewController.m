//
//  MainViewController.m
//  LoveToComeHome
//
//  Created by JND on 2017/10/23.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNavigationController.h"

#import "HomePageViewController.h"
#import "ReservationViewController.h"
#import "ShoppingCartViewController.h"
#import "MeViewController.h"

#import "WRNavigationBar.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIImage *image = [UIImage imageNamed:@"Menu-Bar"];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithPatternImage:image];
}

+ (void)initialize
{
    if (@available(iOS 9.0, *)) {
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
        dictNormal[NSForegroundColorAttributeName] = [UIColor blackColor];
        dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        
        NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
        dictSelected[NSForegroundColorAttributeName] = [UIColor blackColor];
        dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        
        [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    } else {
        // Fallback on earlier versions
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpAllChildVc];
}
- (void)setUpAllChildVc{
    
    HomePageViewController *HomeVC = [[HomePageViewController alloc] init];
    BaseNavigationController *nav1 = [[BaseNavigationController alloc] initWithRootViewController:HomeVC];
    [self setUpOneChildVcWithVc:nav1 Image:@"首页未选中" selectedImage:@"首页选中" title:@"首页"];
    
    ReservationViewController *MemberVC = [[ReservationViewController alloc] init];
    BaseNavigationController *nav2 = [[BaseNavigationController alloc] initWithRootViewController:MemberVC];
    [self setUpOneChildVcWithVc:nav2 Image:@"订位未选中" selectedImage:@"订位选中" title:@"訂位"];
    
    ShoppingCartViewController *OrderVC = [[ShoppingCartViewController alloc] init];
    BaseNavigationController *nav3 = [[BaseNavigationController alloc] initWithRootViewController:OrderVC];
    [self setUpOneChildVcWithVc:nav3 Image:@"购物车未选中" selectedImage:@"购物车选中" title:@"購物車"];
    
    MeViewController *MeVC = [[MeViewController alloc] init];
    BaseNavigationController *nav4 = [[BaseNavigationController alloc] initWithRootViewController:MeVC];
    [self setUpOneChildVcWithVc:nav4 Image:@"我未选中" selectedImage:@"我选中" title:@"我"];

    self.viewControllers = @[nav1,nav2,nav3,nav4];
    [self setNavBarAppearence];
}


- (void)setNavBarAppearence
{
//    MainNavBarColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
//    MainViewColor   = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
    
    // 设置导航栏默认的背景颜色
    UIImage *image = [UIImage imageNamed:@"Menu-Bar"];
    
//    [[WRCustomNavigationBar CustomNavigationBar] backgroundImage] = image;
//    [WRNavigationBar wr_setDefaultNavBarTitleColor:<#(UIColor *)#>];
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:[UIColor colorWithPatternImage:image]];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}

/*
 // 一行代码搞定导航栏显示图片
 [self wr_setNavBarBackgroundImage:[UIImage imageNamed:@"millcolorGrad"]];
 // 一行代码搞定导航栏颜色
 [self wr_setNavBarBarTintColor:[UIColor whiteColor]];
 // 一行代码搞定导航栏透明度
 [self wr_setNavBarBackgroundAlpha:alpha];
 // 一行代码搞定导航栏两边按钮颜色
 [self wr_setNavBarTintColor:[UIColor whiteColor]];
 // 一行代码搞定导航栏上标题颜色
 [self wr_setNavBarTitleColor:[UIColor whiteColor]];
 // 一行代码搞定状态栏是 default 还是 lightContent
 [self wr_setStatusBarStyle:UIStatusBarStyleLightContent];
 // 一行代码搞定导航栏底部分割线是否隐藏
 [self wr_setNavBarShadowImageHidden:YES];
 */

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
//    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:Vc];
    
    
    //    Vc.view.backgroundColor = [self randomColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:Vc];
    
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
