//
//  ShoppingCartTableViewCell.m
//  Hamburger
//
//  Created by JND on 2017/11/30.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ShoppingCartTableViewCell.h"
#import "ShoppingCartModel.h"
@interface ShoppingCartTableViewCell ()
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *oldMoneyLabel;
@property (nonatomic,strong) UILabel *NewMoneyLabel;
@property (nonatomic,strong) UILabel *numberLabel;
@property (nonatomic,strong) UIButton *DownBut;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UIButton *addBut;
@property (nonatomic,strong) UIButton *jianBut;
@end
@implementation ShoppingCartTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDataWithModel:(ShoppingCartModel *)model{
    self.imgView.image = [UIImage imageNamed:model.img];
    self.titleLabel.text = model.title;
    self.NewMoneyLabel.text = model.NewMoney;
    self.numberLabel.text = model.number;
    
    NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",model.oldMoney]];
    
    [newPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, newPrice.length)];
    self.oldMoneyLabel.attributedText = newPrice;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imgView = [[UIImageView alloc] init];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"购物车编辑"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(editBut) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *NewMoneyLabel = [[UILabel alloc] init];
        NewMoneyLabel.textColor = [UIColor colorWithRed:1.00 green:0.56 blue:0.31 alpha:1.00];
        NewMoneyLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UILabel *numberLabel = [[UILabel alloc] init];
        numberLabel.textColor = UIColorFromRGB(0x333333);
        numberLabel.textAlignment = NSTextAlignmentRight;
        numberLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UILabel *oldMoneyLabel = [[UILabel alloc] init];
        oldMoneyLabel.textColor = UIColorFromRGB(0x999999);
        oldMoneyLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIButton *DownBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [DownBut setTitle:@"完成" forState:UIControlStateNormal];
        DownBut.backgroundColor = [UIColor colorWithRed:0.22 green:0.43 blue:0.13 alpha:1.00];
        [DownBut addTarget:self action:@selector(DownAction:) forControlEvents:UIControlEventTouchUpInside];
        DownBut.hidden = YES;
        
        UIButton *addBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBut setImage:[UIImage imageNamed:@"商品详情加号"] forState:UIControlStateNormal];
        [addBut addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
        addBut.hidden = YES;
        
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.text = @"5";
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.hidden = YES;
        
        
        UIButton *jianBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [jianBut setImage:[UIImage imageNamed:@"商品详情加号"] forState:UIControlStateNormal];
        [jianBut addTarget:self action:@selector(jianAction) forControlEvents:UIControlEventTouchUpInside];
        jianBut.hidden = YES;
        
        
        [self.contentView sd_addSubviews:@[imgView,titleLabel,button,NewMoneyLabel,numberLabel,oldMoneyLabel,DownBut,jianBut,addBut,numLabel]];
        self.DownBut = DownBut;
        self.imgView = imgView;
        self.titleLabel = titleLabel;
        self.NewMoneyLabel = NewMoneyLabel;
        self.numberLabel = numberLabel;
        self.oldMoneyLabel = oldMoneyLabel;
        self.numLabel = numLabel;
        self.addBut = addBut;
        self.jianBut = jianBut;
        
        imgView.sd_layout
        .topSpaceToView(self.contentView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.3)
        .heightEqualToWidth();
        
        button.sd_layout
        .topSpaceToView(self.contentView, kHeight(8))
        .rightSpaceToView(self.contentView, kWidth(5))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        titleLabel.sd_layout
        .topEqualToView(imgView)
        .leftSpaceToView(imgView, kWidth(15))
        .rightSpaceToView(button, kWidth(5))
        .autoHeightRatio(0);
        
        NewMoneyLabel.sd_layout
        .bottomEqualToView(imgView)
        .leftSpaceToView(imgView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        numberLabel.sd_layout
        .bottomEqualToView(imgView)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        oldMoneyLabel.sd_layout
        .bottomSpaceToView(NewMoneyLabel, kHeight(10))
        .leftSpaceToView(imgView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        DownBut.sd_layout
        .topEqualToView(self.contentView)
        .bottomEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .widthRatioToView(self.contentView, 0.2);
        
        jianBut.sd_layout
        .bottomSpaceToView(self.contentView, kHeight(6))
        .leftSpaceToView(imgView, kWidth(5))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        numLabel.sd_layout
        .centerYEqualToView(jianBut)
        .leftSpaceToView(jianBut, kWidth(-5))
        .widthIs(kWidth(30))
        .autoHeightRatio(0);
        
        addBut.sd_layout
        .centerYEqualToView(jianBut)
        .leftSpaceToView(numLabel, kWidth(-5))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        
        [self setupAutoHeightWithBottomView:imgView bottomMargin:kHeight(15)];
    }
    return self;
}

-(void)editBut{
    
    self.oldMoneyLabel.hidden = YES;
    self.NewMoneyLabel.hidden = YES;
    self.DownBut.hidden = NO;
    self.jianBut.hidden = NO;
    self.addBut.hidden = NO;
    self.numLabel.hidden = NO;
}

-(void)DownAction:(UIButton *)sender{
    self.oldMoneyLabel.hidden = NO;
    self.NewMoneyLabel.hidden = NO;
    self.DownBut.hidden = YES;
    self.jianBut.hidden = YES;
    self.addBut.hidden = YES;
    self.numLabel.hidden = YES;
    
    self.numberLabel.text = [NSString stringWithFormat:@"X%@",self.numLabel.text];
    
}

-(void)jianAction{
    if ([self.numLabel.text intValue] > 1) {
        self.numLabel.text = [NSString stringWithFormat:@"%d",[self.numLabel.text intValue] - 1];
    }
}
-(void)addAction{
    self.numLabel.text = [NSString stringWithFormat:@"%d",[self.numLabel.text intValue] + 1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
