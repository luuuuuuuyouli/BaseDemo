//
//  SYElementViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYElementViewController.h"
#import "SYLabellistCell.h"
#import "SYMoodCell.h"

@interface SYElementViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SYElementViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    [self.tableView registerNib:[UINib nibWithNibName:@"SYLabellistCell" bundle:nil] forCellReuseIdentifier:@"SYLabellistCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SYMoodCell" bundle:nil] forCellReuseIdentifier:@"SYMoodCellId"];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SYLabellistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYLabellistCellId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    SYMoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYMoodCellId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
   
    
}


@end
