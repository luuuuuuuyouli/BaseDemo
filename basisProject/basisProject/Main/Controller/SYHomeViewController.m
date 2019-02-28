//
//  SYHomeViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYHomeViewController.h"
#import "SYRecordListCell.h"

@interface SYHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Home";
    self.tabBarItem.title = @"record";
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
    SYRecordListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYRecordListCellId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}



@end
