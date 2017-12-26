//
//  LoginViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/4.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
#import "registrationViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *phoneField;
@property (nonatomic,strong)UITextField *pswField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
}

-(void)configUI{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgView.image = [UIImage imageNamed:@"登录背景"];
    [self.view addSubview:imgView];
    
    UIImageView *logoImg = [[UIImageView alloc] init];
    logoImg.image = [UIImage imageNamed:@"LOGO"];
    
    UIImageView *phoneBgImg = [[UIImageView alloc] init];
    phoneBgImg.image = [UIImage imageNamed:@"帐号密码背景"];
    
    UIImageView *pswBgImg = [[UIImageView alloc] init];
    pswBgImg.image = [UIImage imageNamed:@"帐号密码背景"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"登入按钮"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loginBut:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.13 alpha:1.00];
    [button1 setTitle:@"加入會員" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(registrationAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *phoneImg = [[UIImageView alloc] init];
    phoneImg.image = [UIImage imageNamed:@"登录帐号图标"];
    phoneImg.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *pswImg = [[UIImageView alloc] init];
    pswImg.image = [UIImage imageNamed:@"登录密码图标"];
    pswImg.contentMode = UIViewContentModeScaleAspectFit;
    
    self.phoneField = [[UITextField alloc] init];
    self.phoneField.delegate = self;
    self.phoneField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneField.placeholder = @"帳號";
    
    
    self.pswField = [[UITextField alloc] init];
    self.pswField.secureTextEntry = YES;
    self.pswField.placeholder = @"密碼";
    
    [self.view sd_addSubviews:@[logoImg,phoneBgImg,pswBgImg,button,phoneImg,pswImg,self.phoneField,self.pswField,button1]];
    
    logoImg.sd_layout
    .topSpaceToView(self.view, kHeight(100))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(90))
    .heightEqualToWidth();
    
    phoneBgImg.sd_layout
    .topSpaceToView(logoImg, kHeight(100))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(51));
    
    pswBgImg.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(10))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(51));
    
    button.sd_layout
    .topSpaceToView(pswBgImg, kHeight(30))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(50));
    
    button1.sd_layout
    .topSpaceToView(button, kHeight(10))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(50));

    
    phoneImg.sd_layout
    .topSpaceToView(logoImg, kHeight(112))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    pswImg.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(22))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    self.phoneField.sd_layout
    .topSpaceToView(logoImg, kHeight(100))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(230))
    .heightIs(kHeight(51));
    
    self.pswField.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(10))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(230))
    .heightIs(kHeight(51));
    
    button1.sd_cornerRadiusFromHeightRatio = @(0.05);
}

-(void)loginBut:(UIButton *)sender{
    NSLog(@"登录成功");
    MainViewController *mainVC = [[MainViewController alloc] init];
    AppDelegate* appDelagete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelagete.window.rootViewController = mainVC;
    
}


-(void)registrationAction:(UIButton *)sender{
    
    registrationViewController *registrationVC = [[registrationViewController alloc] init];
    [self presentViewController:registrationVC animated:YES completion:^{
        
    }];
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
