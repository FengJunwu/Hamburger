//
//  FactoryTableViewCell.m
//  LO_Moment_JW
//
//  Created by xalo on 16/5/24.
//  Copyright © 2016年 奋斗的小老鼠. All rights reserved.
//

#import "FactoryTableViewCell.h"

@implementation FactoryTableViewCell
+(BaseTableViewCell *)createCellWithModel:(BaseModel *)model tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    //根据model得到重用标识符
    NSString *reUsedID = NSStringFromClass([model class]);
    //得到cell
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUsedID forIndexPath:indexPath];
    return cell;
}
@end
