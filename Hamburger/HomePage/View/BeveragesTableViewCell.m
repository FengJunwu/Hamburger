//
//  BeveragesTableViewCell.m
//  Hamburger
//
//  Created by JND on 2017/11/30.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BeveragesTableViewCell.h"

@interface BeveragesTableViewCell ()

@property (nonatomic,strong)UILabel *numLabel;
@end
@implementation BeveragesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:kFont(18)];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"百香果茶"];
        //添加一张照片
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"首页星星"];
        attach.bounds = CGRectMake(15, -2, 15, 15);
        NSAttributedString *picAttr = [NSAttributedString attributedStringWithAttachment:attach];
        [attr appendAttributedString:picAttr];
        titleLabel.attributedText = attr;
        
        UILabel *integralLabel = [[UILabel alloc] init];
        integralLabel.textColor = [UIColor redColor];
        integralLabel.text = @"積分：25";
        integralLabel.font = [UIFont systemFontOfSize:kFont(16)];
        integralLabel.textAlignment = NSTextAlignmentRight;
        
        
        UILabel *label1 = [[UILabel alloc] init];
        label1.text = @"原價NT20";
        label1.textColor = UIColorFromRGB(0x999999);
        label1.font = [UIFont systemFontOfSize:kFont(15)];
        
        NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",label1.text]];
        
        [newPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, newPrice.length)];
        label1.attributedText = newPrice;
        
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.text = @"優惠價 NT50";
        label2.textColor = UIColorFromRGB(0x333333);
        label2.font = [UIFont systemFontOfSize:kFont(17)];
        
        NSMutableAttributedString *attr2 = [[NSMutableAttributedString alloc] initWithString:label2.text];
        [attr2 addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(4, 4)];
        label2.attributedText = attr2;
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setTitle:@"小杯" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button1 setBackgroundImage:[UIImage imageNamed:@"内用背景"] forState:UIControlStateNormal];
        button1.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setTitle:@"中杯" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button2 setBackgroundImage:[UIImage imageNamed:@"内用背景"] forState:UIControlStateNormal];
        button2.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button3 setTitle:@"大杯" forState:UIControlStateNormal];
        [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button3 setBackgroundImage:[UIImage imageNamed:@"内用背景"] forState:UIControlStateNormal];
        button3.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        
        UIButton *insideBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [insideBut setTitle:@"内用" forState:UIControlStateNormal];
        [insideBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [insideBut setBackgroundImage:[UIImage imageNamed:@"内用背景"] forState:UIControlStateNormal];
        insideBut.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIButton *outerBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [outerBut setTitle:@"外带" forState:UIControlStateNormal];
        [outerBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [outerBut setBackgroundImage:[UIImage imageNamed:@"外带背景"] forState:UIControlStateNormal];
        outerBut.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        
        UIButton *addBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBut setImage:[UIImage imageNamed:@"首页+号"] forState:UIControlStateNormal];
        [addBut addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.text = @"5";
        numLabel.textAlignment = NSTextAlignmentCenter;
        
        
        UIButton *jiaBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [jiaBut setImage:[UIImage imageNamed:@"首页-号"] forState:UIControlStateNormal];
        [jiaBut addTarget:self action:@selector(jianAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView sd_addSubviews:@[titleLabel,integralLabel,label1,label2,insideBut,outerBut,addBut,numLabel,jiaBut,button1,button2,button3]];
        self.numLabel = numLabel;
        
        
        titleLabel.sd_layout
        .topSpaceToView(self.contentView, kHeight(20))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        integralLabel.sd_layout
        .centerYEqualToView(titleLabel)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.4)
        .autoHeightRatio(0);
        
        label1.sd_layout
        .topSpaceToView(titleLabel, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        label2.sd_layout
        .topSpaceToView(label1, kHeight(5))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        button1.sd_layout
        .topSpaceToView(label2, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(50))
        .heightIs(kHeight(25));
        
        button2.sd_layout
        .topSpaceToView(label2, kHeight(15))
        .leftSpaceToView(button1, kWidth(15))
        .widthIs(kWidth(50))
        .heightIs(kHeight(25));
        
        button3.sd_layout
        .topSpaceToView(label2, kHeight(15))
        .leftSpaceToView(button2, kWidth(15))
        .widthIs(kWidth(50))
        .heightIs(kHeight(25));
        
        insideBut.sd_layout
        .topSpaceToView(button1, kHeight(25))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(50))
        .heightIs(kHeight(25));
        
        
        outerBut.sd_layout
        .topSpaceToView(button1, kHeight(25))
        .leftSpaceToView(insideBut, kWidth(15))
        .widthIs(kWidth(50))
        .heightIs(kHeight(25));
        
        addBut.sd_layout
        .centerYEqualToView(outerBut)
        .rightSpaceToView(self.contentView, kWidth(5))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        numLabel.sd_layout
        .centerYEqualToView(outerBut)
        .rightSpaceToView(addBut, kWidth(-5))
        .widthIs(kWidth(30))
        .autoHeightRatio(0);
        
        jiaBut.sd_layout
        .centerYEqualToView(outerBut)
        .rightSpaceToView(numLabel, kWidth(-5))
        .widthIs(kWidth(44))
        .heightEqualToWidth();
        
        
        
        //给label 设置tag值 就可以拿到label 上的数据源
        
        
        [self setupAutoHeightWithBottomView:insideBut bottomMargin:kHeight(15)];
    }
    return self;
}


-(void)jianAction{
    if ([self.numLabel.text intValue] > 0) {
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
