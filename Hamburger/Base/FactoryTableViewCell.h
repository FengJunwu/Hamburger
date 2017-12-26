//
//  FactoryTableViewCell.h
//  LO_Moment_JW
//
//  Created by xalo on 16/5/24.
//  Copyright © 2016年 奋斗的小老鼠. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseTableViewCell.h"
@interface FactoryTableViewCell : NSObject

/**
 *  根据不同的model创建不同的样式cell
 */
+(BaseTableViewCell *)createCellWithModel:(BaseModel*)model tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end
