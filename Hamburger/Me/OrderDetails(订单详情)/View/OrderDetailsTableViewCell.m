//
//  OrderDetailsTableViewCell.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "OrderDetailsTableViewCell.h"

@implementation OrderDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"订单详情订单编号"];
        
        UILabel *orderNumber = [[UILabel alloc] init];
        orderNumber.text = @"訂單編號:20171015120036";
        orderNumber.textColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00];
        orderNumber.font = [UIFont systemFontOfSize:kFont(15)];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"收貨人:謝霆鋒";
        nameLabel.font = [UIFont systemFontOfSize:kFont(16)];
        
        UILabel *phoneLabel = [[UILabel alloc] init];
        phoneLabel.text = @"0927458339";
        phoneLabel.textColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00];
        phoneLabel.font = [UIFont systemFontOfSize:kFont(15)];;
        phoneLabel.textAlignment = NSTextAlignmentRight;
        
        UILabel *address = [[UILabel alloc] init];
        address.text = @"收貨地址:臺中市烏日區環中路八段787巷61弄50號";
        address.textColor = [UIColor colorWithRed:0.38 green:0.38 blue:0.38 alpha:1.00];
        address.font = [UIFont systemFontOfSize:kFont(15)];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self.contentView sd_addSubviews:@[imgView,orderNumber,nameLabel,phoneLabel,address,lineView]];
        
        imgView.sd_layout
        .topSpaceToView(self.contentView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(23))
        .heightEqualToWidth();
        
        orderNumber.sd_layout
        .centerYEqualToView(imgView)
        .leftSpaceToView(imgView, kWidth(10))
        .widthRatioToView(self.contentView, 0.6)
        .autoHeightRatio(0);
        
        nameLabel.sd_layout
        .topSpaceToView(imgView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        phoneLabel.sd_layout
        .centerYEqualToView(nameLabel)
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.5)
        .autoHeightRatio(0);
        
        address.sd_layout
        .topSpaceToView(nameLabel, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        lineView.sd_layout
        .topSpaceToView(address, kHeight(15))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .heightIs(kHeight(10));
        
        [self setupAutoHeightWithBottomView:lineView bottomMargin:0];
        
    }
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
