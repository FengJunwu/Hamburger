//
//  OrderTableViewCell.m
//  Hamburger
//
//  Created by JND on 2017/12/1.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "OrderModel.h"
@interface OrderTableViewCell ()
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *stateLabel;
@property (nonatomic,strong)UILabel *nameLabel1;
@property (nonatomic,strong)UILabel *nameLabel2;
@property (nonatomic,strong)UILabel *tag1;
@property (nonatomic,strong)UILabel *tag2;
@property (nonatomic,strong)UIButton  *button1;

@end

@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDataWithModel:(OrderModel *)model{
    self.titleLabel.text = model.title;
    self.stateLabel.text = model.state;
    self.nameLabel1.text = model.name1;
    self.nameLabel2.text = model.name2;
    self.tag1.text = model.tag1;
    self.tag2.text = model.tag2;
    [self.button1 setTitle:model.butTitle forState:UIControlStateNormal];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"张掖汉堡";
        titleLabel.textColor = UIColorFromRGB(0x333333);
        titleLabel.font = [UIFont systemFontOfSize:kFont(16)];
        
        UILabel *stateLabel = [[UILabel alloc] init];
        stateLabel.text = @"卖家已发货";
        stateLabel.textColor = [UIColor colorWithRed:0.96 green:0.56 blue:0.30 alpha:1.00];
        stateLabel.font = [UIFont systemFontOfSize:kFont(14)];
        stateLabel.textAlignment = NSTextAlignmentRight;
        
        UIView *bgView1 = [[UIView alloc] init];
        bgView1.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
        
        UIImageView *img1 = [[UIImageView alloc] init];
        img1.image = [UIImage imageNamed:@"我的订单img01"];
        
        UILabel *nameLabel1 = [[UILabel alloc] init];
        nameLabel1.text = @"双喜蛋堡";
        nameLabel1.font = [UIFont systemFontOfSize:kFont(17)];
        
        UILabel *priceLabel1 = [[UILabel alloc] init];
        priceLabel1.text = @"NT 50";
        priceLabel1.textColor = [UIColor colorWithRed:0.96 green:0.56 blue:0.30 alpha:1.00];
        priceLabel1.font = [UIFont systemFontOfSize:kFont(15)];
        
        UILabel *numLabel1 = [[UILabel alloc] init];
        numLabel1.text = @"X5";
        numLabel1.textColor = UIColorFromRGB(0X999999);
        numLabel1.font = [UIFont systemFontOfSize:kFont(15)];
        numLabel1.textAlignment = NSTextAlignmentRight;
        
        UILabel *integralLabel = [[UILabel alloc] init];
        integralLabel.text = @"积分：25";
        integralLabel.textColor = UIColorFromRGB(0x999999);
        integralLabel.font = [UIFont systemFontOfSize:kFont(17)];
        
        UILabel *qisiLabel = [[UILabel alloc] init];
        qisiLabel.text = @"起司";
        qisiLabel.font = [UIFont systemFontOfSize:kFont(16)];
        
        UILabel *addLabel = [[UILabel alloc] init];
        addLabel.text = @"加";
        addLabel.textColor = [UIColor whiteColor];
        addLabel.backgroundColor = [UIColor colorWithRed:0.43 green:0.73 blue:0.21 alpha:1.00];
        addLabel.font = [UIFont systemFontOfSize:kFont(16)];
        addLabel.textAlignment = NSTextAlignmentCenter;
        addLabel.sd_cornerRadius = @2;
        
        UIView *bgView2 = [[UIView alloc] init];
        bgView2.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
        
        UIImageView *img2 = [[UIImageView alloc] init];
        img2.image = [UIImage imageNamed:@"我的订单img02"];
        
        UILabel *nameLabel2 = [[UILabel alloc] init];
        nameLabel2.text = @"百香果茶";
        nameLabel2.font = [UIFont systemFontOfSize:kFont(17)];
        [nameLabel2 sizeToFit];
        
        UILabel *tag1 = [[UILabel alloc] init];
        tag1.text = @"小杯";
        tag1.textColor = [UIColor whiteColor];
        tag1.backgroundColor = [UIColor colorWithRed:0.99 green:0.31 blue:0.13 alpha:1.00];
        tag1.font= [UIFont systemFontOfSize:kFont(14)];
        tag1.sd_cornerRadius = @3;
        tag1.textAlignment = NSTextAlignmentCenter;
        
        UILabel *tag2 = [[UILabel alloc] init];
        tag2.text = @"内用";
        tag2.textColor = [UIColor whiteColor];
        tag2.backgroundColor = [UIColor colorWithRed:0.40 green:0.60 blue:0.22 alpha:1.00];
        tag2.font= [UIFont systemFontOfSize:kFont(14)];
        tag2.sd_cornerRadius = @3;
        tag2.textAlignment = NSTextAlignmentCenter;
        
        
        UILabel *priceLabel2 = [[UILabel alloc] init];
        priceLabel2.text = @"NT 50";
        priceLabel2.textColor = [UIColor colorWithRed:0.96 green:0.56 blue:0.30 alpha:1.00];
        priceLabel2.font = [UIFont systemFontOfSize:kFont(15)];
        
        UILabel *numLabel2 = [[UILabel alloc] init];
        numLabel2.text = @"X5";
        numLabel2.textColor = UIColorFromRGB(0X999999);
        numLabel2.font = [UIFont systemFontOfSize:kFont(15)];
        numLabel2.textAlignment = NSTextAlignmentRight;
        
        
        UILabel *integralLabel2 = [[UILabel alloc] init];
        integralLabel2.text = @"积分：25";
        integralLabel2.textColor = UIColorFromRGB(0x999999);
        integralLabel2.font = [UIFont systemFontOfSize:kFont(17)];
        
        UILabel *bottomLabel = [[UILabel alloc] init];
        bottomLabel.text = @"共10件商品 合计：NT 200.00";
        bottomLabel.textAlignment = NSTextAlignmentRight;
        bottomLabel.textColor = UIColorFromRGB(0x666666);
        bottomLabel.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setTitle:@"确认收货" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor colorWithRed:0.78 green:0.42 blue:0.21 alpha:1.00] forState:UIControlStateNormal];
        button1.layer.borderColor = [UIColor colorWithRed:0.96 green:0.82 blue:0.80 alpha:1.00].CGColor;
        button1.layer.borderWidth = 2;
        button1.tag = [reuseIdentifier intValue];
        [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setTitle:@"查看详情" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor colorWithRed:0.49 green:0.49 blue:0.50 alpha:1.00] forState:UIControlStateNormal];
        button2.layer.borderColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1.00].CGColor;
        button2.layer.borderWidth = 2;
        button2.tag = [reuseIdentifier intValue];
        [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *bottonView = [[UIView alloc] init];
        bottonView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.00];
        
        
        [self.contentView sd_addSubviews:@[titleLabel,stateLabel,bgView1,img1,priceLabel1,nameLabel1,numLabel1,integralLabel,qisiLabel,addLabel,bgView2,img2,nameLabel2,priceLabel2,numLabel2,integralLabel2,tag1,tag2,bottomLabel,lineView,button1,button2,bottonView]];
        
        self.titleLabel = titleLabel;
        self.stateLabel = stateLabel;
        self.nameLabel1 = nameLabel1;
        self.nameLabel2 = nameLabel2;
        self.tag1 = tag1;
        self.tag2 = tag2;
        self.button1 = button1;
        
        titleLabel.sd_layout
        .topSpaceToView(self.contentView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        stateLabel.sd_layout
        .centerYEqualToView(titleLabel)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.3)
        .autoHeightRatio(0);
        
        
        
        img1.sd_layout
        .topSpaceToView(titleLabel, kHeight(20))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.2)
        .heightEqualToWidth();
        
        nameLabel1.sd_layout
        .topSpaceToView(titleLabel, kHeight(20))
        .leftSpaceToView(img1, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        priceLabel1.sd_layout
        .centerYEqualToView(img1)
        .leftSpaceToView(img1, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        numLabel1.sd_layout
        .centerYEqualToView(priceLabel1)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.2)
        .autoHeightRatio(0);
        
        integralLabel.sd_layout
        .topSpaceToView(priceLabel1, kHeight(5))
        .leftSpaceToView(img1, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        qisiLabel.sd_layout
        .topSpaceToView(img1, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        bgView1.sd_layout
        .topSpaceToView(titleLabel, kHeight(15))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .bottomSpaceToView(qisiLabel, kHeight(-30));
        
        addLabel.sd_layout
        .centerYEqualToView(qisiLabel)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(25))
        .heightEqualToWidth();
        
        
        img2.sd_layout
        .topSpaceToView(bgView1, kHeight(10))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.2)
        .heightEqualToWidth();
        
        nameLabel2.sd_layout
        .topSpaceToView(bgView1, kHeight(10))
        .leftSpaceToView(img2, kWidth(15))
        .widthIs(kWidth([self sizeWithText:nameLabel2.text font:kFont(17)]))
        .autoHeightRatio(0);
        
        tag1.sd_layout
        .centerYEqualToView(nameLabel2)
        .leftSpaceToView(nameLabel2, kWidth(5))
        .widthIs(kWidth(40))
        .heightIs(kHeight(18));
        
        tag2.sd_layout
        .centerYEqualToView(nameLabel2)
        .leftSpaceToView(tag1, kWidth(5))
        .widthIs(kWidth(40))
        .heightIs(kHeight(18));
        
        
        priceLabel2.sd_layout
        .centerYEqualToView(img2)
        .leftSpaceToView(img2, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        numLabel2.sd_layout
        .centerYEqualToView(priceLabel2)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.2)
        .autoHeightRatio(0);
        
        integralLabel2.sd_layout
        .topSpaceToView(priceLabel2, kHeight(5))
        .leftSpaceToView(img2, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        bgView2.sd_layout
        .topSpaceToView(bgView1, kHeight(5))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(kHeight(Kwidth * 0.2 + 10));
        
        bottomLabel.sd_layout
        .topSpaceToView(bgView2, 0)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.8)
        .heightIs(kHeight(44));
        
        lineView.sd_layout
        .topSpaceToView(bottomLabel, 0)
        .leftSpaceToView(self.contentView, 0)
        .rightSpaceToView(self.contentView, 0)
        .heightIs(kHeight(1));
        
        button1.sd_layout
        .topSpaceToView(lineView, kHeight(10))
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(100))
        .heightIs(kHeight(35));
        
        button2.sd_layout
        .topSpaceToView(lineView, kHeight(10))
        .rightSpaceToView(button1, kWidth(15))
        .widthIs(kWidth(100))
        .heightIs(kHeight(35));
        
        bottonView.sd_layout
        .topSpaceToView(button1, kHeight(10))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(kHeight(10));
        
        [self setupAutoHeightWithBottomView:bottonView bottomMargin:0];
        
        button1.sd_cornerRadiusFromHeightRatio = @(0.5);
        button2.sd_cornerRadiusFromHeightRatio = @(0.5);
    }
    return self;
}

- (CGFloat)sizeWithText:(NSString *)text font:(CGFloat )font
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
}

-(void)button1Action:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(orderProcessing:)]) {
        [self.delegate orderProcessing:(int)sender.tag];
    }
}

-(void)button2Action:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(orderDetails:)]) {
        [self.delegate orderDetails:(int)sender.tag];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
