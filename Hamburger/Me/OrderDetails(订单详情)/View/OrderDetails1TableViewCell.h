//
//  OrderDetails1TableViewCell.h
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseTableViewCell.h"
@protocol OrderDetails1TableViewCellDelegate <NSObject>

-(void)orderProcessing;
@end
@interface OrderDetails1TableViewCell : BaseTableViewCell
@property(nonatomic,weak)id<OrderDetails1TableViewCellDelegate>delegate;
@end
