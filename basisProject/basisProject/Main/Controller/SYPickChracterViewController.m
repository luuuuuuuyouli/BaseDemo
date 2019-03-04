//
//  SYPickChracterViewController.m
//  basisProject
//
//  Created by syong on 2019/3/1.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYPickChracterViewController.h"
#import "SYEleFigureCell.h"
#import "SYAddChracterViewController.h"


@interface SYPickChracterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

@implementation SYPickChracterViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    NSArray *list = [defaults valueForKey:@"figure"];
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    [_dataSource removeAllObjects];
    [_dataSource addObjectsFromArray:list];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
      [self.tableView registerNib:[UINib nibWithNibName:@"SYEleFigureCell" bundle:nil] forCellReuseIdentifier:@"SYEleFigureId"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYEleFigureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYEleFigureId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.personArray = _dataSource;
    [cell.addNewBtn addTarget:self action:@selector(add_new) forControlEvents:UIControlEventTouchUpInside];
    WeakSelf
    cell.pickFigure = ^(NSInteger index) {
        
        if (self.pickPerosonBlock) {
            self.pickPerosonBlock(index);
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    return cell;
}
- (void)add_new{
    
    SYAddChracterViewController *vc = [[SYAddChracterViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


@end
