//
//  SYAddRecordViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddRecordViewController.h"
#import "SYAddRecordsTopCell.h"

@interface SYAddRecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SYAddRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    [self.tableView registerNib:[UINib nibWithNibName:@"SYRecordListCell" bundle:nil] forCellReuseIdentifier:@"SYRecordListCellId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYAddRecordsTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYAddRecordsTopCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}



@end
