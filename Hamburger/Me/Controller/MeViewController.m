//
//  MeViewController.m
//  Hamburger
//
//  Created by JND on 2017/11/29.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "MeViewController.h"
#import "MeCollectionViewCell.h"
#import "MyOrderViewController.h"//我的订单
#import "ShippingAddressViewController.h"//送货地址

#import "ToBePaidViewController.h"//地支付


static NSString *const cellId = @"cellId";
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *collectionArr;
@end

@implementation MeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self headView];
    self.dataSource = @[@[@{@"img":@"我全部订单",
                            @"title":@"我的訂單",
                            @"subTitle":@"查看全部訂單"
                            },
                          @{@"img":@"",
                            @"title":@"",
                            @"subTitle":@""}
                          ],
                        @[@{@"img":@"我我的帐号",
                            @"title":@"我的帳號",
                            @"subTitle":@""
                            },
                          @{@"img":@"我我的积分",
                            @"title":@"我的積分",
                            @"subTitle":@"5000"
                            },
                          @{@"img":@"我送货地址",
                            @"title":@"送貨地址",
                            @"subTitle":@"北大街5號"
                            }
                          ]
                        ];
    self.collectionArr = @[@{@"img":@"我待支付",
                             @"title":@"待支付"},
                           @{@"img":@"我待发货",
                             @"title":@"待發貨"},
                           @{@"img":@"我待收货",
                             @"title":@"待收貨"},
                           @{@"img":@"我待评价",
                             @"title":@"待評價"},
                           @{@"img":@"我退款",
                             @"title":@"退款"}];
    
    [self loadCollectionView];
    
    [self wr_setNavBarBackgroundAlpha:0];
}

-(void)headView{
    UIView *header = [[UIView alloc] init];
    header.width = Kwidth;
    
    UIImage *img = [UIImage imageNamed:@"我banner"];
    
    UIImageView *headImg = [[UIImageView alloc] initWithImage:img];
    
    UIImage *userImg = [UIImage imageNamed:@"我头像"];
    UIImageView *userImgView = [[UIImageView alloc] initWithImage:userImg];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"謝霆鋒";
    nameLabel.font = [UIFont systemFontOfSize:kFont(25)];
    nameLabel.textColor = UIColorFromRGB(0x333333);
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    [header sd_addSubviews:@[headImg,userImgView,nameLabel]];
    
    headImg.sd_layout
    .topEqualToView(header)
    .leftEqualToView(header)
    .rightEqualToView(header)
    .heightIs(img.size.height/ img.size.width * Kwidth);
    
    userImgView.sd_layout
    .topSpaceToView(headImg, kHeight(kHeight(-55)))
    .centerXEqualToView(header)
    .widthIs(kWidth(100))
    .heightEqualToWidth();
    
    nameLabel.sd_layout
    .topSpaceToView(userImgView, kHeight(15))
    .leftSpaceToView(header, kWidth(30))
    .rightSpaceToView(header, kWidth(30))
    .autoHeightRatio(0);
    
    [header setupAutoHeightWithBottomView:nameLabel bottomMargin:kHeight(20)];
    [header layoutSubviews];
    
    self.tableView.tableHeaderView = header;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 3;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row][@"title"];
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.section][indexPath.row][@"img"]];
    cell.detailTextLabel.text = self.dataSource[indexPath.section][indexPath.row][@"subTitle"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, kHeight(80))];
    [view addSubview:self.collectionView];
    [self.collectionView reloadData];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section== 0) {
        return 0;
    }else{
        return kHeight(80);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row ==1) {
        return 0.0001;
    }else{
        return kHeight(44);
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //我的订单
            MyOrderViewController *MyOrderVC = [[MyOrderViewController alloc] init];
            [self.navigationController pushViewController:MyOrderVC animated:YES];
        }
    }else{
        if (indexPath.row == 2) {
            ShippingAddressViewController *ShippingAddressVC = [[ShippingAddressViewController alloc] init];
            [self.navigationController pushViewController:ShippingAddressVC animated:YES];
        }
    }
    
}



- (void)loadCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Kwidth, kHeight(80)) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[MeCollectionViewCell class] forCellWithReuseIdentifier:cellId];
}

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.collectionArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imgView.image = [UIImage imageNamed:self.collectionArr[indexPath.item][@"img"]];
    cell.nameLabel.text = self.collectionArr[indexPath.item][@"title"];
    return cell;
}



#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){(Kwidth - 16)/5.0,kHeight(80)};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 8, 0, 8);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma mark ---- UICollectionViewDelegate


// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
