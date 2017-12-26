//
//  BaseModel.m
//  LO_Moment_JW
//
//  Created by xalo on 16/5/23.
//  Copyright © 2016年 奋斗的小老鼠. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"不匹配的键为--%@",key);
}
- (CGRect)radioDescHeight:(BaseModel *)model{
    return CGRectZero;
}
//- (CGRect)captureTextTitleHeight:(BaseModel *)model{
//    return CGRectZero;
//}
//- (void)setAutoLayout{
//    
//}
@end
