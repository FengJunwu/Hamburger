//
//  registrationViewController.m
//  Hamburger
//
//  Created by JND on 2017/12/4.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "registrationViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
@interface registrationViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *phoneField;
@property (nonatomic,strong)UITextField *pswField;
@property (nonatomic,strong)UITextField *ConfirmPswField;
@property (nonatomic,strong)UITextField *VerificationCodeField;
@end

@implementation registrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
    
    UIButton *leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.frame = CGRectMake(0, kHeight(20), kWidth(60), kHeight(44));
    [leftBut setImage:[UIImage imageNamed:@"Back-icon"] forState:UIControlStateNormal];
    [leftBut addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBut];
}

-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)configUI{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgView.image = [UIImage imageNamed:@"登录背景"];
    [self.view addSubview:imgView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"弘爺漢堡（臺中店）";
    titleLabel.textColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.13 alpha:1.00];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImageView *logoImg = [[UIImageView alloc] init];
    logoImg.image = [UIImage imageNamed:@"LOGO"];
    
    UIImageView *phoneBgImg = [[UIImageView alloc] init];
    phoneBgImg.image = [UIImage imageNamed:@"帐号密码背景"];
    
    UIImageView *pswBgImg = [[UIImageView alloc] init];
    pswBgImg.image = [UIImage imageNamed:@"帐号密码背景"];
    
    UIImageView *pswBgImg1 = [[UIImageView alloc] init];
    pswBgImg1.image = [UIImage imageNamed:@"帐号密码背景"];
    
    UIImageView *pswBgImg2 = [[UIImageView alloc] init];
    pswBgImg2.image = [UIImage imageNamed:@"帐号密码背景小"];
//    pswBgImg2.contentMode = UIViewContentModeScaleAspectFill;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.13 alpha:1.00];
    [button setTitle:@"註冊" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(loginBut:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *phoneImg = [[UIImageView alloc] init];
    phoneImg.image = [UIImage imageNamed:@"登录帐号图标"];
    phoneImg.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *pswImg = [[UIImageView alloc] init];
    pswImg.image = [UIImage imageNamed:@"登录密码图标"];
    pswImg.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *pswImg1 = [[UIImageView alloc] init];
    pswImg1.image = [UIImage imageNamed:@"登录密码图标"];
    pswImg1.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *pswImg2 = [[UIImageView alloc] init];
    pswImg2.image = [UIImage imageNamed:@"登录密码图标"];
    pswImg2.contentMode = UIViewContentModeScaleAspectFit;
    
    self.phoneField = [[UITextField alloc] init];
    self.phoneField.delegate = self;
    self.phoneField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneField.placeholder = @"帳號";
    
    self.pswField = [[UITextField alloc] init];
    self.pswField.secureTextEntry = YES;
    self.pswField.placeholder = @"密碼";
    
    self.ConfirmPswField = [[UITextField alloc] init];
    self.ConfirmPswField.delegate = self;
    self.ConfirmPswField.placeholder = @"確認密碼";
    
    self.VerificationCodeField = [[UITextField alloc] init];
    self.VerificationCodeField.delegate = self;
    self.VerificationCodeField.placeholder = @"輸入驗證碼";
    
    UIButton *VCodeBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [VCodeBut setTitle:@"發送驗證碼" forState:UIControlStateNormal];
    VCodeBut.backgroundColor = [UIColor colorWithRed:0.18 green:0.43 blue:0.16 alpha:1.00];
    VCodeBut.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
    [VCodeBut addTarget:self action:@selector(getVCodeBut:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *bottomLabel = [[UILabel alloc] init];
    bottomLabel.text = @"———— 註冊成功，立即登入 ————";
    bottomLabel.textColor = [UIColor whiteColor];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self.view sd_addSubviews:@[logoImg,phoneBgImg,pswBgImg,button,phoneImg,pswImg,self.phoneField,self.pswField,pswBgImg1,pswBgImg2,pswImg1,pswImg2,self.ConfirmPswField,self.VerificationCodeField,VCodeBut,titleLabel,bottomLabel]];
    
    logoImg.sd_layout
    .topSpaceToView(self.view, kHeight(100))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(90))
    .heightEqualToWidth();
    
    titleLabel.sd_layout
    .topSpaceToView(logoImg, kHeight(20))
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .autoHeightRatio(0);
    
    
    phoneBgImg.sd_layout
    .topSpaceToView(logoImg, kHeight(80))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(51));
    
    pswBgImg.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(10))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(51));
    
    pswBgImg1.sd_layout
    .topSpaceToView(pswBgImg, kHeight(10))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(51));
    
    pswBgImg2.sd_layout
    .topSpaceToView(pswBgImg1, kHeight(10))
    .leftEqualToView(pswBgImg1)
    .widthIs(kWidth(200))
    .heightIs(kHeight(51));
    
    button.sd_layout
    .topSpaceToView(pswBgImg2, kHeight(30))
    .centerXEqualToView(self.view)
    .widthIs(kWidth(300))
    .heightIs(kHeight(50));
    
    phoneImg.sd_layout
    .topSpaceToView(logoImg, kHeight(92))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    pswImg.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(22))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    pswImg1.sd_layout
    .topSpaceToView(pswBgImg, kHeight(22))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    pswImg2.sd_layout
    .topSpaceToView(pswBgImg1, kHeight(22))
    .leftEqualToView(phoneBgImg)
    .widthIs(kWidth(60))
    .heightIs(kHeight(26));
    
    self.phoneField.sd_layout
    .topSpaceToView(logoImg, kHeight(80))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(230))
    .heightIs(kHeight(51));
    
    self.pswField.sd_layout
    .topSpaceToView(phoneBgImg, kHeight(10))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(230))
    .heightIs(kHeight(51));
    
    self.ConfirmPswField.sd_layout
    .topSpaceToView(pswBgImg, kHeight(10))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(230))
    .heightIs(kHeight(51));
    
    self.VerificationCodeField.sd_layout
    .topSpaceToView(pswBgImg1, kHeight(10))
    .leftSpaceToView(phoneImg, kWidth(10))
    .widthIs(kWidth(130))
    .heightIs(kHeight(51));
    
    VCodeBut.sd_layout
    .topEqualToView(pswBgImg2)
    .leftSpaceToView(pswBgImg2, kWidth(10))
    .widthIs(kWidth(90))
    .heightIs(kHeight(51));
    
    bottomLabel.sd_layout
    .topSpaceToView(button, kHeight(10))
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .autoHeightRatio(0);
    
    button.sd_cornerRadiusFromHeightRatio = @(0.05);
    VCodeBut.sd_cornerRadiusFromHeightRatio = @(0.05);
}


-(void)loginBut:(UIButton *)sender{
    NSLog(@"登录成功");
    MainViewController *mainVC = [[MainViewController alloc] init];
    AppDelegate* appDelagete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelagete.window.rootViewController = mainVC;
}


-(void)getVCodeBut:(UIButton *)sender{
    __block NSInteger time = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    //    __weak typeof(self) weakself = self;
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){
            //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:@"重新发送" forState:UIControlStateNormal];
                sender.enabled = YES;
                
            });
        }else{
            int seconds = time % 61; dispatch_async(dispatch_get_main_queue(), ^{ //设置按钮显示读秒效果
                [sender setTitle:[NSString stringWithFormat:@"%ds", seconds] forState:UIControlStateNormal];
                sender.enabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
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
