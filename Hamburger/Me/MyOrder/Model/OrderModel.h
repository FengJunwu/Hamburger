//
//  OrderModel.h
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/2.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "BaseModel.h"

@interface OrderModel : BaseModel
/*
 @"title":@"張爺漢堡（臺中店）",
 @"state":@"等待買家發貨",
 @"name1":@"雙喜蛋堡",
 @"name2":@"百香果茶",
 @"tag1":@"小杯",
 @"tag2":@"外帶",
 @"butTitle":@"確認收貨"
 */
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *state;
@property (nonatomic,strong) NSString *name1;
@property (nonatomic,strong) NSString *name2;
@property (nonatomic,strong) NSString *tag1;
@property (nonatomic,strong) NSString *tag2;
@property (nonatomic,strong) NSString *butTitle;

@end
