//
//  MeCollectionViewCell.m
//  Hamburger
//
//  Created by JND on 2017/12/1.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "MeCollectionViewCell.h"

@implementation MeCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _imgView  = [[UIImageView alloc] init];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imgView];
        _imgView.sd_layout
        .centerXEqualToView(self.contentView)
        .topSpaceToView(self.contentView, kHeight(20))
        .widthIs(20)
        .heightIs(20);
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor colorWithRed:0.04 green:0.04 blue:0.04 alpha:1.00];
        _nameLabel.font = [UIFont systemFontOfSize:kHeight(15)];
        [self.contentView addSubview:_nameLabel];
        _nameLabel.sd_layout
        .topSpaceToView(_imgView, kHeight(5))
        .leftEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .autoHeightRatio(0);
        
    }
    
    return self;
}



@end
