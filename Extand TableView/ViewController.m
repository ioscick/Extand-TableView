//
//  ViewController.m
//  Extand TableView
//
//  Created by shenliping on 16/4/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "BaseDataModel.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [self make_date];
}

- (void)make_date{
    for (int i = 0; i < 10; i++) {
        BaseDataModel *model = [[BaseDataModel alloc] init];
        model.isOpen = NO;
        NSString *name = [NSString stringWithFormat:@"Section:%d",i];
        model.name = name;
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
        for (int j = 0; j < 4; j++) {
            NSString *cellName = [NSString stringWithFormat:@"Cell:%d",j];
            [array addObject:cellName];
        }
        model.dataArray = array;
        [self.dataArray addObject:model];
    }
}

- (void)openSection:(NSInteger)section{
    BaseDataModel *model = self.dataArray[section];
    model.isOpen = !model.isOpen;
    
    
    NSMutableArray *indexArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < model.dataArray.count; i++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexArray addObject:indexpath];
    }
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
}

- (void)closeSection:(NSInteger)section{
    BaseDataModel *model = self.dataArray[section];
    model.isOpen = !model.isOpen;
    NSMutableArray *indexArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < model.dataArray.count; i++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexArray addObject:indexpath];
    }
    [self.tableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

#pragma mark - tableView delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    BaseDataModel *model = [self.dataArray objectAtIndex:section];
    NSLog(@"%d", (int)section);
    HeaderView *headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 40) IsOpen:model.isOpen];
    headerView.nameLabel.text = model.name;
    headerView.section = section;
    
    __weak typeof(self) weakself = self;
    headerView.openblock =^(NSInteger secion){
        [weakself openSection:section];
    };
    headerView.closeblock = ^(NSInteger section){
        [weakself closeSection:section];
    };
    
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    BaseDataModel *model = self.dataArray[section];
    if (model.isOpen) {
        return model.dataArray.count;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseDataModel *modle = self.dataArray[indexPath.section];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = modle.dataArray[indexPath.row];
    return cell;
}


@end
