//
//  HomePageTableViewCell.m
//  Hamburger
//
//  Created by JND on 2017/11/29.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "HomePageTableViewCell.h"
#import "HomePageModel.h"
@interface HomePageTableViewCell ()
@property (nonatomic,strong) UIImageView *imageview;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation HomePageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setDataWithModel:(HomePageModel *)model{
    self.imageview.image = [UIImage imageNamed:model.img];
    self.titleLabel.text = model.title;
    [self.titleLabel sizeToFit];
    
    if ([model.start intValue] == 1) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:model.title];
        //添加一张照片
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"首页星星"];
        attach.bounds = CGRectMake(15, -2, 15, 15);
        NSAttributedString *picAttr = [NSAttributedString attributedStringWithAttachment:attach];
        [attr appendAttributedString:picAttr];
        
        self.titleLabel.attributedText = attr;
    }else{
        self.titleLabel.text = model.title;
    }
    
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        UILabel *titleLabel  = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:kFont(17)];
        
        UILabel *label1 = [[UILabel alloc] init];
        label1.text = @"促銷活動";
        label1.textColor = [UIColor whiteColor];
        label1.font = [UIFont systemFontOfSize:kFont(13)];
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"促销活动背景"]];
        label1.layer.cornerRadius = kWidth(5);
        label1.layer.masksToBounds = YES;

        UILabel *label2 = [[UILabel alloc] init];
        label2.text = @"積分:  25";
        label2.textColor = [UIColor whiteColor];
        label2.font = [UIFont systemFontOfSize:kFont(13)];
        label2.textAlignment = NSTextAlignmentCenter;
        label2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"积分背景"]];
        label2.layer.cornerRadius = kWidth(5);
        label2.layer.masksToBounds = YES;
        
        
        UILabel *label3 = [[UILabel alloc] init];
        label3.text = @"原價NT20";
        label3.textColor = UIColorFromRGB(0x999999);
        label3.font = [UIFont systemFontOfSize:kFont(15)];
        
        NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",label3.text]];

        [newPrice addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, newPrice.length)];
        label3.attributedText = newPrice;
        
        
        UILabel *label4 = [[UILabel alloc] init];
        label4.text = @"優惠價 NT50";
        label4.textColor = UIColorFromRGB(0x333333);
        label4.font = [UIFont systemFontOfSize:kFont(17)];
        label4.textAlignment = NSTextAlignmentRight;
        
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:label4.text];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(4, 4)];
        label4.attributedText = attr;
        
        UILabel *label5 = [[UILabel alloc] init];
        label5.text = @"活動期限：2017.09.01-2017.09.30";
        label5.textColor = [UIColor colorWithRed:0.21 green:0.35 blue:0.25 alpha:1.00];
        label5.font = [UIFont systemFontOfSize:kFont(13)];
        
        [self.contentView sd_addSubviews:@[imageView,titleLabel,label1,label2,label3,label4,label5]];
        self.imageview = imageView;
        self.titleLabel = titleLabel;
        
        imageView.sd_layout
        .topSpaceToView(self.contentView, kHeight(15))
        .leftSpaceToView(self.contentView, kWidth(15))
        .widthRatioToView(self.contentView, 0.3)
        .heightEqualToWidth();
        
        titleLabel.sd_layout
        .topEqualToView(imageView)
        .leftSpaceToView(imageView, kWidth(15))
        .rightSpaceToView(self.contentView, kWidth(5))
        .autoHeightRatio(0);
        
        label1.sd_layout
        .topSpaceToView(titleLabel, kHeight(10))
        .leftSpaceToView(imageView, kWidth(15))
        .widthIs(kWidth(65))
        .heightIs(kHeight(25));
        
        label2.sd_layout
        .topSpaceToView(titleLabel, kHeight(10))
        .leftSpaceToView(label1, kWidth(15))
        .widthIs(kWidth(65))
        .heightIs(kHeight(25));
        
        label3.sd_layout
        .topSpaceToView(label1, kHeight(10))
        .leftSpaceToView(imageView, kWidth(15))
        .widthIs(kWidth(100))
        .autoHeightRatio(0);
        
        label4.sd_layout
        .topSpaceToView(label1, kHeight(10))
        .rightSpaceToView(self.contentView, kWidth(15))
        .widthIs(kWidth(100))
        .autoHeightRatio(0);
        
        label5.sd_layout
        .bottomEqualToView(imageView)
        .rightSpaceToView(self.contentView, kWidth(5))
        .leftSpaceToView(imageView, kWidth(15))
        .autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:imageView bottomMargin:kHeight(15)];
        
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
