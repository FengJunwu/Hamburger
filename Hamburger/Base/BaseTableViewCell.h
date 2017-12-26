//
//  BaseTableViewCell.h
//  LO_Moment_JW
//
//  Created by xalo on 16/5/23.
//  Copyright © 2016年 奋斗的小老鼠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"
@interface BaseTableViewCell : UITableViewCell
/**
 *  cell的赋值方法
 */
-(void)setDataWithModel:(BaseModel *)model;

/*- (void)setButtonBoeder;//设置button的边框*/

@end
