//
//  OrderTableViewCell.h
//  Hamburger
//
//  Created by JND on 2017/12/1.
//  Copyright © 2017年 JND. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OrderTableViewCellDelegate <NSObject>

-(void)orderProcessing:(int )index;

-(void)orderDetails:(int )index;

@end

@interface OrderTableViewCell : BaseTableViewCell
@property(nonatomic,weak)id<OrderTableViewCellDelegate>delegate;
@end
