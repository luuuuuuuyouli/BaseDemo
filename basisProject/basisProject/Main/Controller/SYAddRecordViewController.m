//
//  SYAddRecordViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYAddRecordViewController.h"
#import "SYAddRecordsTopCell.h"
#import "SYAddRecorContentCell.h"
#import "SYAddRecordTimeCell.h"
#import "SYAddMoodCell.h"
#import "SYAddCharacterCell.h"
#import "SYAddLabelCell.h"

#import "SYAddMoodViewController.h"
#import "SYAddChracterViewController.h"
#import "SYPickLabelViewController.h"
#import "SYPickChracterViewController.h"

#import "CCDatePickerView.h"
#import "ACMediaModel.h"

static NSString *oneCell = @"SYAddRecordsTopCell";
static NSString *twoCell = @"SYAddRecorContentCell";
static NSString *threeCell = @"SYAddRecordTimeCell";
static NSString *fourCell = @"SYAddMoodCell";
static NSString *fiveCell = @"SYAddCharacterCell";
static NSString *sixCell = @"SYAddLabelCell";

@interface SYAddRecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//选择标签按钮数组
@property (nonatomic,strong) NSMutableArray *tagsBtnArray;
//填写数据字典
@property (nonatomic,strong) NSMutableDictionary *pramDic;
//日期选择器
@property (nonatomic,strong) CCDatePickerView *datePickerView;
//图片资源数组
@property (nonatomic,strong) NSMutableArray *imageList;
//图片区高度
@property (nonatomic,assign) CGFloat cellHeight;

@end

@implementation SYAddRecordViewController

- (CCDatePickerView *)datePickerView{
    if (!_datePickerView) {
        _datePickerView = [[CCDatePickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _datePickerView;
}
- (NSMutableArray *)tagsBtnArray{
    if (!_tagsBtnArray) {
        _tagsBtnArray = [NSMutableArray array];
    }
    return _tagsBtnArray;
}

- (NSMutableArray *)imageList{
    if (!_imageList) {
        _imageList = [NSMutableArray array];
    }
    return _imageList;
}

- (NSMutableDictionary *)pramDic{
    if (!_pramDic) {
        _pramDic = [NSMutableDictionary dictionary];
    }
    return _pramDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add records";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(action_upload)];
    
    _cellHeight = 120;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 0;
    [self.tableView registerNib:[UINib nibWithNibName:oneCell bundle:nil] forCellReuseIdentifier:oneCell];
    [self.tableView registerNib:[UINib nibWithNibName:twoCell bundle:nil] forCellReuseIdentifier:twoCell];
    [self.tableView registerNib:[UINib nibWithNibName:threeCell bundle:nil] forCellReuseIdentifier:threeCell];
    [self.tableView registerNib:[UINib nibWithNibName:fourCell bundle:nil] forCellReuseIdentifier:fourCell];
    [self.tableView registerNib:[UINib nibWithNibName:fiveCell bundle:nil] forCellReuseIdentifier:fiveCell];
    [self.tableView registerNib:[UINib nibWithNibName:sixCell bundle:nil] forCellReuseIdentifier:sixCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row == 0) {
        return _cellHeight;
    }
    if (indexPath.row == 1) {
        return 230;
    }
    if (indexPath.row == 2) {
        return 60;
    }
    if (indexPath.row == 3) {
        return 85;
    }
    if (indexPath.row == 4) {
        return 120;
    }
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        SYAddRecordsTopCell *cell = [tableView dequeueReusableCellWithIdentifier:oneCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        WeakSelf
        cell.cellHeightChangeHeightBlock = ^(CGFloat height) {
             weakSelf.cellHeight = height - 10;
            [UIView performWithoutAnimation:^{
                [weakSelf.tableView beginUpdates];
                [weakSelf.tableView endUpdates];
            }];
        };
        cell.uploadMediaBlock = ^(NSArray<ACMediaModel *> * _Nonnull list) {
            weakSelf.imageList = [list mutableCopy];
        };
        return cell;
    }
    if (indexPath.row == 1) {
        SYAddRecorContentCell *cell = [tableView dequeueReusableCellWithIdentifier:twoCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //主题内容
        WeakSelf
        cell.contentChangeBlock = ^(NSString * _Nonnull string) {
            [weakSelf.pramDic setValue:string forKey:@"content"];
        };
        //位置信息
        cell.loactionChangeBlock = ^(NSString * _Nonnull string) {
            [weakSelf.pramDic setValue:string forKey:@"loaction"];
        };
        return cell;
    }
    if (indexPath.row == 2) {
        SYAddRecordTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:threeCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
        cell.timeLabel.text = self.pramDic[@"time"];
        return cell;
    }
    if (indexPath.row == 3) {
        SYAddMoodCell *cell = [tableView dequeueReusableCellWithIdentifier:fourCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.moodDic = self.pramDic[@"mood"];
        WeakSelf
        cell.addMoodBlock = ^{
            SYAddMoodViewController *vc = [[SYAddMoodViewController alloc]init];
            vc.addMoodBlock = ^(NSString * _Nonnull mood, NSString * _Nonnull mooodSting) {
                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
                dic[@"mood"] = mood;
                dic[@"moodString"] = mooodSting;
                [weakSelf.pramDic setValue:dic forKey:@"mood"];
                [weakSelf.tableView reloadData];
            };
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }
    if (indexPath.row == 4) {
        SYAddCharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:fiveCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.personArray = self.pramDic[@"chracters"];
        WeakSelf
        cell.addCharacterBlock = ^{
//            SYAddChracterViewController *vc = [[SYAddChracterViewController alloc]init];
//            vc.addCharacterBlock = ^(NSString * _Nonnull name, NSString * _Nonnull sex) {
//
//                NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//                dic[@"name"] = name;
//                dic[@"sex"] = sex;
//                //取出原人物数组
//                NSMutableArray *personArray = [NSMutableArray array];
//                NSArray *arr = [weakSelf.pramDic valueForKey:@"chracters"];
//                [personArray addObjectsFromArray:arr];;
//                //新增人物
//                [personArray addObject:dic];
//                //存回去
//                [weakSelf.pramDic setValue:personArray forKey:@"chracters"];
//                [weakSelf.tableView reloadData];
//            };
//            [weakSelf.navigationController pushViewController:vc animated:YES];
            SYPickChracterViewController *vc = [[SYPickChracterViewController  alloc]init];
            vc.pickPerosonBlock = ^(NSInteger index) {
                NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
                NSArray *list = [defaults valueForKey:@"figure"];
                if (list.count > 0) {
                    NSDictionary *dic = list[index];
                    NSMutableArray *personArray = [NSMutableArray array];
                    NSArray *arr = [weakSelf.pramDic valueForKey:@"chracters"];
                    [personArray addObjectsFromArray:arr];;
                    [personArray addObject:dic];
                    [weakSelf.pramDic setValue:personArray forKey:@"chracters"];
                    [weakSelf.tableView reloadData];
                    
                }
            };
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        };
        return cell;
    }
    
    SYAddLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:sixCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *array = self.tagsBtnArray;
    cell.tagsArray = array;
    WeakSelf
    cell.addLabelBlock = ^{
        SYPickLabelViewController *vc = [[SYPickLabelViewController alloc]init];
        vc.pickArray = self.tagsBtnArray;
        vc.pickTagsBlock = ^(NSArray * _Nonnull pickArray) {
            NSMutableArray *stringArray = [NSMutableArray array];
            for (UIButton *btn in pickArray) {
                NSString *btnString = btn.titleLabel.text;
                [stringArray addObject:btnString];
            }
            weakSelf.tagsBtnArray = [pickArray mutableCopy];
            [weakSelf.pramDic setValue:stringArray forKey:@"tags"];
            
            [weakSelf.tableView reloadData];
        };
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        //选择时间
        self.datePickerView.chooseTimeLabel.text = @"To choose time";
        [self.datePickerView fadeIn];
        WeakSelf
        self.datePickerView.blcok = ^(NSDate *dateString) {
            //实例化一个NSDateFormatter对象
            NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString *dateStr = [dateFormatter stringFromDate:dateString];
            NSLog(@"----%@---",dateStr);
            [weakSelf.pramDic setValue:dateStr forKey:@"time"];
            [weakSelf.tableView reloadData];
        };
    }
}


#pragma mark  -- func

- (void)action_upload{
    NSLog(@"上传数据 == %@",self.pramDic);
    NSLog(@"图片数组 == %@",self.imageList);
    
    if (self.imageList.count < 1) {
        showError(@"Please complete the record");
        return;
    }
    
    if (![[self.pramDic allKeys] containsObject:@"content"]) {
        showError(@"Please complete the record");
        return;
    }
    if (![[self.pramDic allKeys] containsObject:@"tags"]) {
        showError(@"Please complete the record");
        return;
    }
    if (![[self.pramDic allKeys] containsObject:@"mood"]) {
        showError(@"Please complete the record");
        return;
    }
    if (![[self.pramDic allKeys] containsObject:@"time"]) {
        showError(@"Please complete the record");
        return;
    }
    if (![[self.pramDic allKeys] containsObject:@"loaction"]) {
        showError(@"Please complete the record");
        return;
    }
    if (![[self.pramDic allKeys] containsObject:@"chracters"]) {
        showError(@"Please complete the record");
        return;
    }
    

    
    NSMutableArray *imgDataArray = [NSMutableArray array];
    
    for (ACMediaModel *model in self.imageList) {
        UIImage *image = model.image;
        NSData *data = UIImageJPEGRepresentation(image,0.1f);//第二个参数为压缩倍数
        [imgDataArray addObject:data];
    }
    
    [self.pramDic setValue:imgDataArray forKey:@"img_list"];
    
    NSUserDefaults *deafults = [[NSUserDefaults alloc]init];
    
    NSArray *dataSource = [deafults valueForKey:@"record_list"];
    
    NSMutableArray *dataList = [NSMutableArray array];
    
    [dataList addObjectsFromArray:dataSource];
    
    [dataList insertObject:self.pramDic atIndex:0];
    
    [deafults setObject:dataList forKey:@"record_list"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
