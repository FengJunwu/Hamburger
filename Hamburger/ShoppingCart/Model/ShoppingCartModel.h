//
//  ShoppingCartModel.h
//  Hamburger
//
//  Created by JND on 2017/11/30.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseModel.h"

@interface ShoppingCartModel : BaseModel
@property(nonatomic,copy) NSString *img;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *oldMoney;
@property(nonatomic,copy) NSString *NewMoney;
@property(nonatomic,copy) NSString *number;
@end
