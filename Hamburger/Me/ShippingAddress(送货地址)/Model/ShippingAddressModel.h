//
//  ShippingAddressModel.h
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseModel.h"

@interface ShippingAddressModel : BaseModel
/*
 @"name":@"",
 @"phone":@"0927458399",
 @"address":@"臺中市烏日區環中路八段787巷61弄50號",
 @"type":@"0"
 */
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *address;
@property (nonatomic,strong)NSString *type;
@end
