//
//  SYHomeViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYHomeViewController.h"
#import "SYRecordListCell.h"
#import "SYAddRecordViewController.h"
#import "SYRecordDetailViewController.h"

@interface SYHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UIImageView *noRecordView;

@end

@implementation SYHomeViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getRecordsList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Home";
    self.tabBarItem.title = @"record";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    [self.tableView registerNib:[UINib nibWithNibName:@"SYRecordListCell" bundle:nil] forCellReuseIdentifier:@"SYRecordListCellId"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tianjia"] style:UIBarButtonItemStyleDone target:self action:@selector(action_upload)];
    _noRecordView = [[UIImageView alloc]init];
    _noRecordView.image = [UIImage imageNamed:@"no record"];
    _noRecordView.hidden = YES;
    [self.view addSubview:_noRecordView];
    [_noRecordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(200);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(109);
        
    }];
}

- (void)getRecordsList{
    NSUserDefaults *deafults = [[NSUserDefaults alloc]init];
    NSArray *list = [deafults valueForKey:@"record_list"];
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:list];
    NSLog(@"数据源====%@",self.dataSource);
    if (_dataSource.count > 0) {
        self.noRecordView.hidden = YES;
        self.tableView.hidden = NO;
    }else{
        self.noRecordView.hidden = NO;
        self.tableView.hidden = YES;
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYRecordListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYRecordListCellId"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataDic = self.dataSource[indexPath.row];
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SYRecordDetailViewController *vc = [[SYRecordDetailViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    vc.dataList = self.dataSource;
    vc.dataDic = self.dataSource[indexPath.row];
    vc.delIndex = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- func

- (void)action_upload{
    
    SYAddRecordViewController *vc = [[SYAddRecordViewController alloc]init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}







@end
