//
//  AppraiseViewController.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/2.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "AppraiseViewController.h"
#import "RatingBar.h"
#import "HXPhotoPicker.h"
@interface AppraiseViewController ()<RatingBarDelegate,UITextViewDelegate,HXPhotoViewDelegate>
@property (nonatomic,strong) RatingBar *ratingBar;
@property (nonatomic,strong) RatingBar *ratingBar1;
@property (nonatomic,strong) RatingBar *ratingBar2;

@property (nonatomic,strong)UILabel *state;
@property (nonatomic,strong)UILabel *placeHolderLabel;
@property (nonatomic,strong)UITextView *textView;

@property (strong, nonatomic) HXPhotoManager *manager;
@property (strong, nonatomic) HXPhotoView *photoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation AppraiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"發表評價";
    [self configUI];
}

-(void)configUI{

    UILabel *label = [[UILabel alloc] init];
    label.text = @"描述相符";
    label.font = [UIFont systemFontOfSize:kFont(15)];
    
    CGFloat width = 150;
    self.ratingBar = [[RatingBar alloc] initWithFrame:CGRectMake(kWidth(80), kHNavBar + kHeight(13), width, kHeight(44))];
    self.ratingBar.isIndicator = NO;
    [self.ratingBar setImageDeselected:@"发表评价星星未选中" halfSelected:@"发表评价星星未选中" fullSelected:@"发表评价星星选中" andDelegate:self];
    [self.ratingBar displayRating:4];
    
    UILabel *state = [[UILabel alloc] init];
    state.text = @"好";
    state.textColor = [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1.00];
    state.font = [UIFont systemFontOfSize:kFont(15)];
    state.textAlignment = NSTextAlignmentRight;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:kFont(16)];
//    textView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"說說您對我們的評價吧！非常感謝啦～";
    placeHolderLabel.textColor = [UIColor colorWithRed:0.68 green:0.68 blue:0.69 alpha:1.00];
    placeHolderLabel.font = [UIFont systemFontOfSize:kFont(16)];
    
    HXPhotoView *photoView = [HXPhotoView photoManager:self.manager];
    photoView.delegate = self;
    photoView.lineCount = 4;
    photoView.backgroundColor = [UIColor whiteColor];
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"店铺评分";
    titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
    
    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"服务态度";
    label1.font = [UIFont systemFontOfSize:kFont(15)];
    label1.textColor = [UIColor colorWithRed:0.69 green:0.69 blue:0.70 alpha:1.00];
    
    self.ratingBar1 = [[RatingBar alloc] initWithFrame:CGRectMake(kWidth(80), kHeight(400) + kHeight(13), width, kHeight(44))];
    self.ratingBar1.isIndicator = NO;
    [self.ratingBar1 setImageDeselected:@"发表评价星星未选中" halfSelected:@"发表评价星星未选中" fullSelected:@"发表评价星星选中" andDelegate:self];
    [self.ratingBar1 displayRating:4];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"物流服务";
    label2.font = [UIFont systemFontOfSize:kFont(15)];
    label2.textColor = [UIColor colorWithRed:0.69 green:0.69 blue:0.70 alpha:1.00];
    
    self.ratingBar2 = [[RatingBar alloc] initWithFrame:CGRectMake(kWidth(80), kHeight(444) , width, kHeight(44))];
    //    self.ratingBar1.centerY = label1.centerY;
    self.ratingBar2.isIndicator = NO;
    [self.ratingBar2 setImageDeselected:@"发表评价星星未选中" halfSelected:@"发表评价星星未选中" fullSelected:@"发表评价星星选中" andDelegate:self];
    [self.ratingBar2 displayRating:4];
    
    [self.view sd_addSubviews:@[label,self.ratingBar,state,lineView,textView,placeHolderLabel,photoView,lineView2,titleLabel,lineView3,label1,self.ratingBar1,label2,self.ratingBar2]];
    
    self.state = state;
    self.placeHolderLabel = placeHolderLabel;
    self.textView = textView;
    

    label.sd_layout
    .topSpaceToView(self.view, kHNavBar)
    .leftSpaceToView(self.view, kWidth(15))
    .widthIs(kWidth(80))
    .heightIs(kHeight(44));
    
    state.sd_layout
    .centerYEqualToView(label)
    .rightSpaceToView(self.view, kWidth(15))
    .widthRatioToView(self.view, 0.3)
    .heightIs(kHeight(18));
    
    lineView.sd_layout
    .topSpaceToView(label, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kHeight(1));
    
    textView.sd_layout
    .topSpaceToView(lineView, 0)
    .leftSpaceToView(self.view, kWidth(8))
    .rightSpaceToView(self.view, kWidth(5))
    .heightIs(120);
    
    placeHolderLabel.sd_layout
    .topSpaceToView(lineView, kHeight(8))
    .leftSpaceToView(self.view, kWidth(14))
    .rightSpaceToView(self.view, kWidth(15))
    .autoHeightRatio(0);
    
    photoView.sd_layout
    .topSpaceToView(textView, kHeight(10))
    .leftSpaceToView(self.view, kWidth(15))
    .rightSpaceToView(self.view, kWidth(15))
    .heightIs(kHeight((Kwidth - kWidth(30)) /4.0));
    
    lineView2.sd_layout
    .topSpaceToView(photoView, kHeight(15))
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kHeight(15));
    
    titleLabel.sd_layout
    .topSpaceToView(lineView2, 0)
    .rightSpaceToView(self.view, kWidth(5))
    .leftSpaceToView(self.view, kWidth(15))
    .heightIs(kHeight(44));
    
    lineView3.sd_layout
    .topSpaceToView(titleLabel, 0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(kHeight(1));
    
    label1.sd_layout
    .topSpaceToView(lineView3, 0)
    .leftSpaceToView(self.view, kWidth(15))
    .widthIs(kWidth(80))
    .heightIs(kHeight(44));
    
    label2.sd_layout
    .topSpaceToView(label1, kHeight(-13))
    .leftSpaceToView(self.view, kWidth(15))
    .widthIs(kWidth(80))
    .heightIs(kHeight(44));
    
}

#pragma mark - RatingBar delegate
-(void)ratingBar:(RatingBar *)ratingBar ratingChanged:(float)newRating{
    
    if (self.ratingBar == ratingBar) {
        int start = 0;
        if (newRating > (int)newRating) {
            start = (int)newRating + 1;
            NSLog(@"描述相符%d",(int)newRating + 1);
        }else{
            NSLog(@"描述相符%d",(int)newRating);
            start = (int)newRating;
        }
        
        [self updateState:start];
    }else if (self.ratingBar1 == ratingBar){

        if (newRating > (int)newRating) {
            
            NSLog(@"服务态度%d",(int)newRating + 1);
        }else{
            NSLog(@"服务态度%d",(int)newRating);
        }
    }else if(self.ratingBar2 == ratingBar){

        if (newRating > (int)newRating) {
            NSLog(@"物流服务%d",(int)newRating + 1);
        }else{
            NSLog(@"物流服务%d",(int)newRating);
        }
    }
}

-(void)updateState:(int)start{
    switch (start) {
        case 1:
            self.state.text = @"非常差";
            break;
        case 2:
            self.state.text = @"差";
            break;
        case 3:
            self.state.text = @"一般";
            break;
        case 4:
            self.state.text = @"好";
            break;
        case 5:
            self.state.text = @"非常好";
            break;
            
        default:
            
            break;
    }
}


#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _placeHolderLabel.hidden = YES;
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    if (_textView.text.length > 0 ) {
        _placeHolderLabel.hidden = YES;
    } else {
        _placeHolderLabel.hidden = NO;
    }
    
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (_textView.text.length > 0 ) {
        _placeHolderLabel.hidden = YES;
    } else {
        _placeHolderLabel.hidden = NO;
    }

}


- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.openCamera = YES;
        _manager.configuration.lookLivePhoto = YES;
        _manager.configuration.photoMaxNum = 4;
        _manager.configuration.maxNum = 4;
        _manager.configuration.saveSystemAblum = NO;
        _manager.configuration.showDateSectionHeader = NO;
        
        _manager.configuration.navigationBar = ^(UINavigationBar *navigationBar) {
            
            navigationBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Back-icon"]];
            
        };
    }
    return _manager;
}

- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    NSSLog(@"所有:%ld - 照片:%ld - 视频:%ld",allList.count,photos.count,videos.count);
    NSSLog(@"所有:%@ - 照片:%@ - 视频:%@",allList,photos,videos);
    
//    [HXPhotoTools selectListWriteToTempPath:allList requestList:^(NSArray *imageRequestIds, NSArray *videoSessions) {
//        NSSLog(@"requestIds - image : %@ \nsessions - video : %@",imageRequestIds,videoSessions);
//    } completion:^(NSArray<NSURL *> *allUrl, NSArray<NSURL *> *imageUrls, NSArray<NSURL *> *videoUrls) {
//        NSSLog(@"allUrl - %@\nimageUrls - %@\nvideoUrls - %@",allUrl,imageUrls,videoUrls);
//    } error:^{
//        NSSLog(@"失败");
//    }];
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
