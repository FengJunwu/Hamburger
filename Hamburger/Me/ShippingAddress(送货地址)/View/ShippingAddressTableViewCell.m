//
//  ShippingAddressTableViewCell.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "ShippingAddressTableViewCell.h"
#import "ShippingAddressModel.h"
@interface ShippingAddressTableViewCell ()
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UILabel *address;
@property (nonatomic,strong)UIButton *button;
@end

@implementation ShippingAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDataWithModel:(ShippingAddressModel *)model{
    self.nameLabel.text = model.name;
    self.phoneLabel.text = model.phone;
    self.address.text = model.address;
    if ([model.type isEqualToString:@"1"]) {
        self.button.selected = YES;
    }else{
        self.button.selected = NO;
    }
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"谢霆锋";
        nameLabel.font = [UIFont systemFontOfSize:kFont(16)];
        nameLabel.textColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.17 alpha:1.00];
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        phoneLabel.text = @"0927458339";
        phoneLabel.font = [UIFont systemFontOfSize:kFont(16)];
        phoneLabel.textAlignment = NSTextAlignmentRight;
        phoneLabel.textColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.17 alpha:1.00];
        
        UILabel *address = [[UILabel alloc] init];
        address.textColor = [UIColor colorWithRed:0.54 green:0.54 blue:0.54 alpha:1.00];
        address.font = [UIFont systemFontOfSize:kFont(14)];
        address.text = @"臺中市烏日區環中路八段787巷61弄50號";
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"送货地址未选中设为默认"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"送货地址选中默认地址"] forState:UIControlStateSelected];
        [button setTitle:@"設為默認" forState:UIControlStateNormal];
        [button setTitle:@"默認地址" forState:UIControlStateSelected];
        [button setTitleColor:[UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:1.00] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.96 green:0.30 blue:0.23 alpha:1.00] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setImage:[UIImage imageNamed:@"送货地址删除"] forState:UIControlStateNormal];
        [button1 setTitle:@"删除" forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:1.00] forState:UIControlStateNormal];
        button1.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        [button1 addTarget:self action:@selector(button1Action) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button2 setImage:[UIImage imageNamed:@"送货地址编辑"] forState:UIControlStateNormal];
        [button2 setTitle:@"编辑" forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor colorWithRed:0.53 green:0.53 blue:0.53 alpha:1.00] forState:UIControlStateNormal];
        button2.titleLabel.font = [UIFont systemFontOfSize:kFont(15)];
        [button2 addTarget:self action:@selector(button2Action) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *lineView1 = [[UIView alloc] init];
        lineView1.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self.contentView sd_addSubviews:@[nameLabel,phoneLabel,address,lineView,button,button1,button2,lineView1]];
        self.nameLabel = nameLabel;
        self.phoneLabel = phoneLabel;
        self.address = address;
        self.button = button;
        
        nameLabel.sd_layout
        .topSpaceToView(self.contentView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        phoneLabel.sd_layout
        .centerYEqualToView(nameLabel)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        address.sd_layout
        .topSpaceToView(nameLabel, kHeight(10))
        .leftSpaceToView(self.contentView, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(15))
        .autoHeightRatio(0);
        
        lineView.sd_layout
        .topSpaceToView(address, kHeight(15))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(kHeight(1));
        
        button.sd_layout
        .topSpaceToView(lineView, kHeight(7))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(120))
        .heightIs(kHeight(30));
        
        // 设置button的图片的约束
        button.imageView.sd_layout
        .widthIs(kWidth(20))
        .centerYEqualToView(button)
        .leftSpaceToView(button, kWidth(0))
        .heightIs(kWidth(20));
        
        // 设置button的label的约束
        button.titleLabel.sd_layout
        .leftSpaceToView(button.imageView, kWidth(5))
        .rightSpaceToView(button, kWidth(0))
        .centerYEqualToView(button)
        .autoHeightRatio(0);
        
        button1.sd_layout
        .centerYEqualToView(button)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(60))
        .heightIs(kHeight(30));
        
        // 设置button的图片的约束
        button1.imageView.sd_layout
        .widthIs(kWidth(20))
        .centerYEqualToView(button1)
        .leftSpaceToView(button1, kWidth(0))
        .heightIs(kWidth(20));
        
        // 设置button的label的约束
        button1.titleLabel.sd_layout
        .leftSpaceToView(button1.imageView, kWidth(5))
        .rightSpaceToView(button1, kWidth(0))
        .centerYEqualToView(button1)
        .autoHeightRatio(0);
        
        button2.sd_layout
        .centerYEqualToView(button)
        .rightSpaceToView(button1, kWidth(15))
        .widthIs(kWidth(60))
        .heightIs(kHeight(30));
        
        // 设置button的图片的约束
        button2.imageView.sd_layout
        .widthIs(kWidth(20))
        .centerYEqualToView(button2)
        .leftSpaceToView(button2, kWidth(0))
        .heightIs(kWidth(20));
        
        // 设置button的label的约束
        button2.titleLabel.sd_layout
        .leftSpaceToView(button2.imageView, kWidth(5))
        .rightSpaceToView(button2, kWidth(0))
        .centerYEqualToView(button2)
        .autoHeightRatio(0);
        
        lineView1.sd_layout
        .topSpaceToView(button, kHeight(7))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(kHeight(10));
        
        
        [self setupAutoHeightWithBottomView:lineView1   bottomMargin:0];
    }
    return self;
}

-(void)buttonAction{
    NSLog(@"设置为默认");
}

-(void)button1Action{
    NSLog(@"删除");
}

-(void)button2Action{
    NSLog(@"编辑");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
