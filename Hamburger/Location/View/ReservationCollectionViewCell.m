//
//  ReservationCollectionViewCell.m
//  Hamburger
//
//  Created by JND on 2017/12/5.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ReservationCollectionViewCell.h"


/**
 * 这个例子是建立一个直接从MyRelativeLayout派生的子视图的例子。通过直接从布局视图派生子类来构造一些特定功能的控件子视图。
 */
@interface PLTest3View : MyRelativeLayout

-(id)initWithImage:(NSString*)image title:(NSString*)title index:(NSInteger)index;


@property(nonatomic, strong) MyPathLayout *circleView;


@end


@implementation PLTest3View

-(id)initWithImage:(NSString*)image title:(NSString*)title index:(NSInteger)index
{
    self = [super init];
    if (self != nil)
    {
        self.wrapContentHeight = YES;
        self.wrapContentWidth = YES;
        
        _circleView = [MyPathLayout new];  //这里这是为路径布局的原因是其中的numLabel是跟随园所在的位置而确定的。
        _circleView.widthSize.equalTo(@30);
        _circleView.heightSize.equalTo(@30);
        _circleView.layer.cornerRadius = 15;
//        _circleView.backgroundColor = [UIColor redColor];
        _circleView.coordinateSetting.origin = CGPointMake(0.5, 0.5);
        _circleView.polarEquation = ^(CGFloat angle)
        {
            return (CGFloat)15.0;
        };

        [self addSubview:_circleView];
        
        
//        UILabel *numLabel = [UILabel new];
//        numLabel.widthSize.equalTo(@15);
//        numLabel.heightSize.equalTo(@15);
//        numLabel.layer.cornerRadius = 7.5;
//        numLabel.backgroundColor = [UIColor whiteColor];
//        numLabel.font = [UIFont systemFontOfSize:kFont(16)];
//        numLabel.textColor = [UIColor grayColor];
//        numLabel.clipsToBounds = YES;
//        numLabel.text = [NSString stringWithFormat:@"%ld",(long)index];
//        numLabel.textAlignment = NSTextAlignmentCenter;
//        [_circleView addSubview:numLabel];
        
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        [imageView sizeToFit];
        
        imageView.centerXPos.equalTo(_circleView.centerXPos);
        imageView.centerYPos.equalTo(_circleView.centerYPos);
        [self addSubview:imageView];
        
        
//        UILabel *titleLabel = [UILabel new];
//        titleLabel.text = title;
////        titleLabel.textColor = [UIColor blueColor];
//        titleLabel.font = [UIFont systemFontOfSize:kFont(16)];
//        [titleLabel sizeToFit];
//        titleLabel.centerXPos.equalTo(_circleView.centerXPos);
//        titleLabel.topPos.equalTo(_circleView.bottomPos).offset(10);
//        [self addSubview:titleLabel];
    }
    
    return self;
}


@end


@interface ReservationCollectionViewCell ( )
@property(nonatomic,strong) MyPathLayout *pathLayout;
@end


@implementation ReservationCollectionViewCell

-(void)setType:(NSString *)type butTitle:(NSString *)title{
    _pathLayout = [MyPathLayout new];
    _pathLayout.frame = CGRectMake(0, 0, Kwidth/3.0, Kwidth/3.0);
    [self.contentView addSubview:_pathLayout];
    
    _pathLayout.coordinateSetting.origin = CGPointMake(0.5, 0.5);
    _pathLayout.coordinateSetting.start = -90.0 / 180 * M_PI;      //从-90度
    _pathLayout.coordinateSetting.end =  270.0 / 180 * M_PI;  //到270度。
    _pathLayout.padding = UIEdgeInsetsMake(0, 0, 0, 0);
    
    __weak UIView *weakPathLayout = _pathLayout;
    _pathLayout.polarEquation = ^(CGFloat angle)
    {
        CGFloat radius = (CGRectGetWidth(weakPathLayout.bounds) - 60)/2.0;  //半径为视图的宽度减去两边的内边距30再除2。这里需要注意block的循环引用的问题。
        return radius;
    };
    
    
    UIButton *centerButton = [UIButton new];
    [centerButton setTitle:title forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    centerButton.titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
    centerButton.layer.borderWidth = 1;
    centerButton.layer.borderColor = [UIColor grayColor].CGColor;
    centerButton.widthSize.equalTo(_pathLayout.widthSize).multiply(0.5).add(-40);  //宽度是父视图宽度的一半再减去30
    centerButton.viewLayoutCompleteBlock = ^(MyBaseLayout *layout, UIView *sbv)
    { //viewLayoutCompleteBlock是在1.2.3中添加的新功能，目的是给完成了布局的子视图一个机会进行一些特殊的处理，viewLayoutCompleteBlock只会在子视图布局完成后调用一次.其中的sbv就是子视图自己，而layout则是父布局视图。因为这个block是完成布局后执行的。所以这时候子视图的frame值已经被计算出来，因此您可以在这里设置一些和frame关联的属性。
        
        sbv.layer.cornerRadius = 3;  //这里取子视图的圆角半径为宽度的一半，也就是形成了圆形按钮。
        sbv.heightSize.equalTo(@(sbv.frame.size.width));    //这里取子视图的高度等于他的宽度。
    };
    
    //        [centerButton addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
    _pathLayout.originView = centerButton;  //把centerButton设置为布局视图的原点视图。
    
    
    NSArray *images;
    NSArray *titles = @[@"Fllow",@"WatchList",@"Add",@"Center", @"Del",@"Search",@"Other"];
    if ([type isEqualToString:@"1"]) {
        images = @[@"订位沙发未选中"];
    }else{
        images = @[@"订位沙发选中"];
    }
    
    for (NSInteger i = 0; i < 4; i ++)
    {
        
        PLTest3View *plView = [[PLTest3View alloc] initWithImage:images[arc4random_uniform((uint32_t)images.count)]
                                                           title:titles[i]
                                                           index:i];
        
        
        plView.viewLayoutCompleteBlock = ^(MyBaseLayout *layout, UIView *sbv)
        {
            PLTest3View *vplv = (PLTest3View*)sbv;
            MyPathLayout *vLayout = (MyPathLayout*)layout;
            
            CGFloat arg = [vLayout argumentFrom:sbv];  //MyPathLayout中的argumentFrom方法的作用是返回子视图在路径布局时所定位的点的自变量的值。上面因为我们用的是极坐标方程来算出每个子视图的位置，因此这里的argumentFrom方法返回的就是子视图所定位的角度。又因为我们的圆环角度是从270度开始的。而PLTest3View的圆环里面的numLabel的初始值又是从180度开始的，所以这里相差了刚好一个M_PI的值，所以我们这里把sbv所在的角度减去M_PI,就是PLTest3View里面的numLabel的开始的角度。
            vplv.circleView.coordinateSetting.start = (arg - M_PI);
            
        };
        
        [_pathLayout addSubview:plView];
        
    };
    
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(kWidth(15), Kwidth/3.0 - kHeight(10), Kwidth/3.0 - kWidth(30), kHeight(25));
    [but setTitle:@"已預訂" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor colorWithRed:0.43 green:0.43 blue:0.43 alpha:1.00] forState:UIControlStateNormal];
    [but setTitle:@"可預訂" forState:UIControlStateSelected];
    [but setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    but.layer.borderWidth = 1;
    but.layer.cornerRadius = kHeight(12.5);
    but.layer.masksToBounds = YES;
    [self.contentView addSubview:but];
    
    if ([type isEqualToString:@"1"]) {
        but.selected = YES;
        but.layer.borderWidth = 0;
        but.backgroundColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.12 alpha:1.00];
    }
    
}



//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
////        self.contentView.edgesForExtendedLayout = UIRectEdgeNone;  //设置视图控制器中的视图尺寸不延伸到导航条或者工具条下面。您可以注释这句代码看看效果。
//
//
//    return self;
//}


@end
















