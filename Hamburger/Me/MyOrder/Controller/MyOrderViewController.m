//
//  MyOrderViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/1.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "MyOrderViewController.h"
#import "AllOrdersViewController.h"//全部订单
#import "ToBePaidViewController.h"//待支付
#import "DropShippingViewController.h"//待发货
#import "ForTheGoodsViewController.h"//待收货
#import "PendingEvaluationViewController.h"//待评价
@interface MyOrderViewController ()
@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic,strong) AllOrdersViewController *AllOrdersVC;
@property (nonatomic,strong) ToBePaidViewController *ToBePaidVC;
@property (nonatomic,strong) DropShippingViewController *DropShippingVC;
@property (nonatomic,strong) ForTheGoodsViewController *ForTheGoodsVC;
@property (nonatomic,strong) PendingEvaluationViewController *PendingEvaluationVC;

@property (nonatomic, strong) UIScrollView *headScrollView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation MyOrderViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的订单";
    
    
    [self loadBaseUI:0];
}


-(void)loadBaseUI:(int)index{
    
    
    NSArray *array = @[@"全部",@"待支付",@"待發貨",@"待收貨",@"待評價"];
    for (int i = 0; i< array.count; i++) {
        
        UIButton *itemButton = [[UIButton alloc]initWithFrame:CGRectMake(i*(Kwidth/array.count), kHNavBar, Kwidth/array.count, kHeight(42))];
        itemButton.tag = 100+i;
        itemButton.backgroundColor = [UIColor whiteColor];
        
        [itemButton setTitle:array[i] forState:UIControlStateNormal];
        [itemButton setTitleColor:UIColorFromRGB(0x666666) forState:UIControlStateNormal];
        [itemButton setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [itemButton setBackgroundImage:[UIImage imageNamed:@"订单指示条"] forState:UIControlStateSelected];
        itemButton.titleLabel.font = [UIFont boldSystemFontOfSize:kFont(16)];
        
        if (index == i) {
            itemButton.selected = YES;
        }else{
            itemButton.selected = NO;
        }
        
        [itemButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:itemButton];
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kHNavBar + kHeight(42), Kwidth, kHeight(2))];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:view];
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kHNavBar + kHeight(44), Kwidth, Kheight - kHNavBar - kHeight(44))];
    _contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_contentView];
    
    
    [self addSubControllers];
}

#pragma mark - privatemethods
- (void)addSubControllers{
    _AllOrdersVC = [[AllOrdersViewController alloc] init];
    [self addChildViewController:_AllOrdersVC];
    
    _ToBePaidVC = [[ToBePaidViewController alloc] init];
    [self addChildViewController:_ToBePaidVC];
    
    _DropShippingVC = [[DropShippingViewController alloc] init];
    [self addChildViewController:_DropShippingVC];
    
    _ForTheGoodsVC = [[ForTheGoodsViewController alloc] init];
    [self addChildViewController:_ForTheGoodsVC];
    
    _PendingEvaluationVC = [[PendingEvaluationViewController alloc] init];
    [self addChildViewController:_PendingEvaluationVC];
    
    
    //调整子视图控制器的Frame已适应容器View
    [self fitFrameForChildViewController:_AllOrdersVC];
    //设置默认显示在容器View的内容
    [self.contentView addSubview:_AllOrdersVC.view];
    
    _currentVC = _AllOrdersVC;
}

- (void)buttonClick:(UIButton *)sender{
    if ((sender.tag == 100 && _currentVC == _AllOrdersVC) || (sender.tag == 101 && _currentVC == _ToBePaidVC) || (sender.tag == 102 && _currentVC == _DropShippingVC) || (sender.tag == 103 && _currentVC == _ForTheGoodsVC) || (sender.tag == 104 && _currentVC == _PendingEvaluationVC)) {
        return;
    }
    switch (sender.tag) {
        case 100:{
            [self fitFrameForChildViewController:_AllOrdersVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_AllOrdersVC];
            sender.selected = YES;
        
            UIButton *but = (UIButton *)[self.view viewWithTag:101];
            but.selected = NO;
            UIButton *but1 = (UIButton *)[self.view viewWithTag:102];
            but1.selected = NO;
            UIButton *but2 = (UIButton *)[self.view viewWithTag:103];
            but2.selected = NO;
            UIButton *but3 = (UIButton *)[self.view viewWithTag:104];
            but3.selected = NO;
            
        }
            break;
        case 101:{
            [self fitFrameForChildViewController:_ToBePaidVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_ToBePaidVC];
            sender.selected = YES;
            UIButton *but = (UIButton *)[self.view viewWithTag:100];
            but.selected = NO;
            UIButton *but1 = (UIButton *)[self.view viewWithTag:102];
            but1.selected = NO;
            UIButton *but2 = (UIButton *)[self.view viewWithTag:103];
            but2.selected = NO;
            UIButton *but3 = (UIButton *)[self.view viewWithTag:104];
            but3.selected = NO;
    
        }
            break;
        case 102:{
            [self fitFrameForChildViewController:_DropShippingVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_DropShippingVC];
            sender.selected = YES;
            
            UIButton *but = (UIButton *)[self.view viewWithTag:100];
            but.selected = NO;
            UIButton *but1 = (UIButton *)[self.view viewWithTag:101];
            but1.selected = NO;
            UIButton *but2 = (UIButton *)[self.view viewWithTag:103];
            but2.selected = NO;
            UIButton *but3 = (UIButton *)[self.view viewWithTag:104];
            but3.selected = NO;
            
            
        }
            break;
        case 103:{
            [self fitFrameForChildViewController:_ForTheGoodsVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_ForTheGoodsVC];
            sender.selected = YES;
            
            UIButton *but = (UIButton *)[self.view viewWithTag:100];
            but.selected = NO;
            UIButton *but1 = (UIButton *)[self.view viewWithTag:102];
            but1.selected = NO;
            UIButton *but2 = (UIButton *)[self.view viewWithTag:101];
            but2.selected = NO;
            UIButton *but3 = (UIButton *)[self.view viewWithTag:104];
            but3.selected = NO;
            
        }
            break;
        case 104:{
            [self fitFrameForChildViewController:_PendingEvaluationVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_PendingEvaluationVC];
            sender.selected = YES;
            
            UIButton *but = (UIButton *)[self.view viewWithTag:100];
            but.selected = NO;
            UIButton *but1 = (UIButton *)[self.view viewWithTag:102];
            but1.selected = NO;
            UIButton *but2 = (UIButton *)[self.view viewWithTag:103];
            but2.selected = NO;
            UIButton *but3 = (UIButton *)[self.view viewWithTag:101];
            but3.selected = NO;
            
            
        }
            break;
            
    }
}

- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = self.contentView.frame;
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
}

//转换子视图控制器
- (void)transitionFromOldViewController:(UIViewController *)oldViewController toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            _currentVC = newViewController;
        }else{
            _currentVC = oldViewController;
        }
    }];
}

//移除所有子视图控制器
- (void)removeAllChildViewControllers{
    for (UIViewController *vc in self.childViewControllers) {
        [vc willMoveToParentViewController:nil];
        [vc removeFromParentViewController];
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
