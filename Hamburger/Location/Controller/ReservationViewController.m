//
//  LocationViewController.m
//  Hamburger
//
//  Created by JND on 2017/11/29.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ReservationViewController.h"
#import "ReservationCollectionViewCell.h"
#import "ReservationSuccessViewController.h"//订位成功
@interface ReservationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSMutableArray *dataSource;

@property(nonatomic,strong) UIButton *scanningBut;
@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    self.title = @"訂位";
    [self collectionView];
    [self scanningBut];
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar - kHTabBar) collectionViewLayout:self.flowLayout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.collectionView];
        
        [self.collectionView registerClass:[ReservationCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //注册头视图(系统)
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionViewHeader"];
        //注册分区尾
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionViewFooter"];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource
// 指定Section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 指定section中的collectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 6;
}

// 配置section中的collectionViewCell的显示
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ReservationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    cell.titleLabel.text = colleactionViewData[indexPath.section][indexPath.item];
    
    if (indexPath.item == 5) {
        [cell setType:@"1" butTitle:[NSString stringWithFormat:@"%ld",(long)indexPath.row + 1]];
    }else{
        [cell setType:@"0" butTitle:[NSString stringWithFormat:@"%ld",(long)indexPath.row + 1]];
    }
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
//每个cell的大小，因为有indexPath，所以可以判断哪一组，或者哪一个item，可一个给特定的大小，等同于layout的itemSize属性
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(Kwidth / 3.0,Kwidth / 3.0 + 30);
}

// 设置整个组的缩进量是多少
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0,0, 0, 0);
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 设置section头视图的参考大小，与tableheaderview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(Kwidth, kHeight(100));
    
    
}

// 设置section尾视图的参考大小，与tablefooterview类似
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeMake(0, 0);
    
    
}

#pragma mark - UICollectionViewDelegate
// 允许选中时，高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
    return YES;
}

// 高亮完成后回调
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
}

// 由高亮转成非高亮完成时的回调
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
}

// 设置是否允许选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
    return YES;
}

// 设置是否允许取消选中
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
    return YES;
}

// 选中操作
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 5) {
        ReservationSuccessViewController *ReservationSuccessVC = [[ReservationSuccessViewController alloc] init];
        [self.navigationController pushViewController:ReservationSuccessVC animated:YES];
    }
    
    
    //    NSLog(@"%s", __FUNCTION__);
}

// 取消选中操作
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __FUNCTION__);
}

//创建头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                withReuseIdentifier:@"UICollectionViewHeader"
                                                                                       forIndexPath:indexPath];
        headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UIButton *leftbut = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftbut setImage:[UIImage imageNamed:@"订位日期左箭头"] forState:UIControlStateNormal];
        
        UIButton *rightbut = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightbut setImage:[UIImage imageNamed:@"订位日期右箭头"] forState:UIControlStateNormal];
        
        UILabel *yearLabel = [[UILabel alloc] init];
        yearLabel.text  = @"2017";
        yearLabel.font = [UIFont systemFontOfSize:kFont(16)];
        yearLabel.textAlignment = NSTextAlignmentCenter;
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.text = @"20.00";
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.font = [UIFont systemFontOfSize:kFont(16)];
        priceLabel.layer.borderWidth = 1;
        priceLabel.layer.borderColor = [UIColor colorWithRed:0.15 green:0.36 blue:0.00 alpha:1.00].CGColor;
        
        UIView *bgView = [UIView new];
        bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:bgView];
        
        [headView sd_addSubviews:@[leftbut,rightbut,yearLabel,priceLabel,bgView]];
        
        leftbut.sd_layout
        .topSpaceToView(headView, kHeight(5))
        .leftSpaceToView(headView, kWidth(0))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        yearLabel.sd_layout
        .topSpaceToView(headView, kHeight(5))
        .leftSpaceToView(leftbut, kWidth(0))
        .widthIs(kWidth(80))
        .heightIs(kHeight(44));
        
        
        rightbut.sd_layout
        .topSpaceToView(headView, kHeight(5))
        .leftSpaceToView(yearLabel, kWidth(0))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        priceLabel.sd_layout
        .centerYEqualToView(leftbut)
        .rightSpaceToView(headView, kWidth(15))
        .widthIs(80)
        .heightIs(kHeight(30));
        
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < 7; i++) {
            UIButton  *but = [UIButton buttonWithType:UIButtonTypeCustom];
            [but setTitle:[NSString stringWithFormat:@"%d",12+i] forState:UIControlStateNormal];
//            but.backgroundColor = [UIColor whiteColor];
            but.titleLabel.font = [UIFont systemFontOfSize:kFont(16)];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [but setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            but.layer.cornerRadius = 15;
            if (i == 3) {
                but.selected = YES;
                but.backgroundColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.12 alpha:1.00];
            }else{
                but.selected = NO;
                but.backgroundColor = [UIColor clearColor];
            }
            [bgView addSubview:but];
            but.sd_layout.autoHeightRatio(1); // 设置高度约束
            [temp addObject:but];
        }
        
        //此步设置之后_autoMarginViewsContainer的高度可以根据子view自适应
        [bgView setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:7 itemWidth:30 verticalMargin:5 verticalEdgeInset:10 horizontalEdgeInset:10];
        
        bgView.sd_layout
        .leftEqualToView(headView)
        .rightEqualToView(headView)
        .bottomEqualToView(headView);
        
        priceLabel.sd_cornerRadiusFromHeightRatio = @(0.5);
        
        reusableview = headView;
    }
    
    return reusableview;
}

-(UIButton *)scanningBut{
    if (!_scanningBut) {
        _scanningBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _scanningBut.frame = CGRectMake(0, Kheight - kHTabBar - kHeight(44), Kwidth, kHeight(44));
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
