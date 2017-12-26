//
//  AddShippingAddressViewController.m
//  Hamburger
//
//  Created by 冯俊武 on 2017/12/3.
//  Copyright © 2017年 JND. All rights reserved.
//

#import "AddShippingAddressViewController.h"

@interface AddShippingAddressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataSource;

@property (nonatomic,strong)UITextField *nameTextF;
@property (nonatomic,strong)UITextField *phoneTextF;
@property (nonatomic,strong)UITextField *provincesTextF;
@property (nonatomic,strong)UITextField *streetTextF;
@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)UILabel *placeholderLabel;

@property (nonatomic,strong)UIButton *addBut;

@property (nonatomic,strong)UIButton *selectBut;

@end

@implementation AddShippingAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"新增地址";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kHNavBar, Kwidth, Kheight - kHNavBar) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.sectionHeaderHeight = kHeight(15);
    
    self.dataSource =@[@[
                       @{@"title":@"收貨人",
                         @"subTitle":@"謝霆鋒"
                         },
                       @{@"title":@"聯繫電話",
                         @"subTitle":@"0927458339"
                         },
                       @{@"title":@"所在地區",
                         @"subTitle":@"臺灣臺中市烏日區"
                         },
                       @{@"title":@"街道",
                         @"subTitle":@"請選擇"
                         },
                       @{@"title":@"",
                         @"subTitle":@""
                         }],
                       @[
                        @{@"title":@"设为默认",
                         @"subTitle":@""
                         }]
                       ];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataSource[section] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = self.dataSource[indexPath.section][indexPath.row][@"title"];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cell.contentView addSubview:self.nameTextF];
        }else if (indexPath.row == 1){
            [cell.contentView addSubview:self.phoneTextF];
            [cell.contentView addSubview:self.addBut];
        }else if (indexPath.row == 2){
            [cell.contentView addSubview:self.provincesTextF];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 3){
            [cell.contentView addSubview:self.streetTextF];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 4){
            [cell.contentView addSubview:self.textView];
        }
    }else{
        [cell.contentView addSubview:self.selectBut];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 4) {
        return kHeight(60);
    }else{
        return kHeight(44);
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return kHeight(15);
    }else{
        return 0;
    }
}




-(UITextField *)nameTextF{
    if (!_nameTextF) {
        _nameTextF = [[UITextField alloc] initWithFrame:CGRectMake(kWidth(100), 0, Kwidth - kWidth(115), kHeight(44))];
        _nameTextF.text = @"謝霆鋒";
        _nameTextF.textAlignment = NSTextAlignmentRight;
    }
    return _nameTextF;
}


-(UITextField *)phoneTextF{
    if (!_phoneTextF) {
        _phoneTextF = [[UITextField alloc] initWithFrame:CGRectMake(kWidth(100), 0, Kwidth - kWidth(140), kHeight(44))];
        _phoneTextF.text = @"0927458339";
        _phoneTextF.textAlignment = NSTextAlignmentRight;
    }
    return _phoneTextF;
}

-(UITextField *)provincesTextF{
    if (!_provincesTextF) {
        _provincesTextF = [[UITextField alloc] initWithFrame:CGRectMake(kWidth(100), 0, Kwidth - kWidth(140), kHeight(44))];
        _provincesTextF.text = @"臺灣臺中市烏日區";
        _provincesTextF.textAlignment = NSTextAlignmentRight;
    }
    return _provincesTextF;
}

-(UITextField *)streetTextF{
    if (!_streetTextF) {
        _streetTextF = [[UITextField alloc] initWithFrame:CGRectMake(kWidth(100), 0, Kwidth - kWidth(140), kHeight(44))];
        _streetTextF.text = @"請選擇";
        _streetTextF.textAlignment = NSTextAlignmentRight;
    }
    return _streetTextF;
}

-(UIButton *)addBut{
    if (!_addBut) {
        _addBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBut.frame = CGRectMake(Kwidth - kWidth(40), 0, kWidth(40), kHeight(44));
        [_addBut setImage:[UIImage imageNamed:@"新增地址联系电话添加"] forState:UIControlStateNormal];
        
    }
    return _addBut;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(kWidth(15), 0, Kwidth - kWidth(20), kHeight(60))];
        _textView.delegate = self;
        _textView.font = [UIFont systemFontOfSize:kFont(16)];
        [_textView addSubview:self.placeholderLabel];
    }
    return _textView;
}

-(UILabel *)placeholderLabel{
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth(300), kHeight(30))];
        _placeholderLabel.text = @"請填寫詳細信息，不少於10個字";
        _placeholderLabel.textColor = [UIColor colorWithRed:0.63 green:0.63 blue:0.63 alpha:1.00];
        _placeholderLabel.font = [UIFont systemFontOfSize:kFont(16)];
        
    }
    return _placeholderLabel;
}


#pragma mark - UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.placeholderLabel.hidden = YES;
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if (_textView.text.length > 0 ) {
        self.placeholderLabel.hidden = YES;
    } else {
        self.placeholderLabel.hidden = NO;
    }
    
    return YES;
}

-(UIButton *)selectBut{
    if (!_selectBut) {
        _selectBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBut.frame = CGRectMake(Kwidth - kWidth(61), 0, kWidth(46), kHeight(44));
        [_selectBut setImage:[UIImage imageNamed:@"新增地址设置默认"] forState:UIControlStateNormal];
        [_selectBut setImage:[UIImage imageNamed:@"新增地址未设置默认"] forState:UIControlStateSelected];
        [_selectBut addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        _selectBut.selected = NO;
        
    }
    return _selectBut;
}

-(void)selectAction:(UIButton *)sender{
    if (sender.selected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
