//
//  SYRecordDetailViewController.m
//  basisProject
//
//  Created by syong on 2019/2/28.
//  Copyright © 2019年 shenyong. All rights reserved.
//

#import "SYRecordDetailViewController.h"
#import "SYBannerCell.h"
#import "SYDetailContentCell.h"
#import "SYDetailCharacterCell.h"
#import "SYDetailTagsCell.h"

@interface SYRecordDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SYRecordDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details pages";
   // [self.tableView az_setGradientBackgroundWithColors:@[rgba(113, 157, 248, 1),rgba(119, 114, 238, 1)] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0)];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shanchu"] style:UIBarButtonItemStyleDone target:self action:@selector(action_del)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 0;
    [_tableView registerNib:[UINib nibWithNibName:@"SYBannerCell" bundle:nil] forCellReuseIdentifier:@"SYBannerCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"SYDetailContentCell" bundle:nil] forCellReuseIdentifier:@"SYDetailContentCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"SYDetailCharacterCell" bundle:nil] forCellReuseIdentifier:@"SYDetailCharacterCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"SYDetailTagsCell" bundle:nil] forCellReuseIdentifier:@"SYDetailTagsCell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 200;
    }
    if (indexPath.row == 1) {
       
        return [self getStringHeightWithText:self.dataDic[@"content"] fontSize:14 viewWidth:(SCREEN_W-72)] + 190;
    }
    if (indexPath.row == 2) {
        return 60;
    }

    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.row == 0) {
        SYBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYBannerCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *imageArr = self.dataDic[@"img_list"];
        cell.dataSource = [imageArr mutableCopy];
        return cell;
    }
    if (indexPath.row == 1) {
        SYDetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYDetailContentCell"];
        cell.content.text = self.dataDic[@"content"];
        cell.time.text = self.dataDic[@"time"];
        cell.loaction.text = self.dataDic[@"loaction"];
        cell.moodString.text = self.dataDic[@"mood"][@"moodString"];
        NSString *mood = [NSString stringWithFormat:@"%@",self.dataDic[@"mood"][@"mood"]];
        if ([mood isEqualToString:@"1"]) {
            cell.moodImg.image = [UIImage imageNamed:@"smile"];
        }else{
            cell.moodImg.image = [UIImage imageNamed:@"cry after"];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 2) {
        SYDetailCharacterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYDetailCharacterCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.personArray = self.dataDic[@"chracters"];
        return cell;
    }

    SYDetailTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYDetailTagsCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tagsArray = self.dataDic[@"tags"];
    return cell;
    
}

- (void)action_del{
    
    [self.dataList removeObjectAtIndex:_delIndex];
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    
    [defaults setObject:self.dataList forKey:@"record_list"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (CGFloat)getStringHeightWithText:(NSString *)text fontSize:(float)fontSize viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 计算文字占据的高度
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    
    //当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
    
}



@end
