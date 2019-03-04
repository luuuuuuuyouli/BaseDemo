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
#import "SYEleFigureCell.h"
#import "SYAddChracterViewController.h"

@interface SYElementViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation SYElementViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    
    NSArray *list = [defaults valueForKey:@"figure"];
    [_dataSource removeAllObjects];
    [_dataSource addObjectsFromArray:list];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
     [self.tableView registerNib:[UINib nibWithNibName:@"SYEleFigureCell" bundle:nil] forCellReuseIdentifier:@"SYEleFigureCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SYLabellistCell" bundle:nil] forCellReuseIdentifier:@"SYLabellistCellId"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SYMoodCell" bundle:nil] forCellReuseIdentifier:@"SYMoodCellId"];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        if (_dataSource.count == 0) {
            return 70;
        }
        return 100;
    }
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SYEleFigureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYEleFigureCellId"];
         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.personArray = _dataSource;
        [cell.addNewBtn addTarget:self action:@selector(add_new) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    if (indexPath.row == 1) {
        SYLabellistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYLabellistCellId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    SYMoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYMoodCellId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
   
    
}

- (void)add_new{
    
    SYAddChracterViewController *vc = [[SYAddChracterViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end
