//
//  TableController.m
//  TableViewDemo
//
//  Created by 爱恨的潮汐 on 2018/4/18.
//  Copyright © 2018年 AiHenDeChaoXi. All rights reserved.
//

#import "TableController.h"
#import "TableCell.h"
@interface TableController ()<UITableViewDelegate,UITableViewDataSource>
//创建tableview
@property (nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSouce;

@end

@implementation TableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建
    [self networkRequest];
    
     [self tableView];
}

-(void)networkRequest{
    //模拟网络延迟加载
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //数据,type 1是网络图片，2是本地图片
        NSDictionary * dictIm1 = @{@"imageUrl":@"http://mcdn.kemeiapp.com/upload/navigation/1514270103159/1514270103159.png",@"type":@"1",@"title":@"网络图片1"};
        
        NSDictionary * dictIm2 = @{@"imageUrl":@"引导页1",@"type":@"2",@"title":@"本地图片1"};
        
        NSDictionary * dictIm3 = @{@"imageUrl":@"http://mcdn.kemeiapp.com/upload/navigation/1515392228646/1515392228646.png",@"type":@"1",@"title":@"网络图片2"};
        
        NSDictionary * dictIm4 = @{@"imageUrl":@"引导页2",@"type":@"2",@"title":@"本地图片2"};
        
        NSDictionary * dictIm5 = @{@"imageUrl":@"http://mcdn.kemeiapp.com/upload/navigation/1515393029018/1515393029018.png",@"type":@"1",@"title":@"网络图片3"};
        
        NSDictionary * dictIm6 = @{@"imageUrl":@"引导页3",@"type":@"2",@"title":@"本地图片3"};
        
        NSDictionary * dictIm7 = @{@"imageUrl":@"http://mcdn.kemeiapp.com/upload/navigation/1513923127244/1513923127244.png",@"type":@"1",@"title":@"网络图片4"};
        
        
        NSArray * array = @[dictIm1,dictIm2,dictIm3,dictIm4,dictIm5,dictIm6,dictIm7];
        for (NSDictionary * dictImage in array) {
            TableModel * model = [[TableModel alloc]init];
            //数据转模型
            [model mj_setKeyValues:dictImage];
            [self.dataSouce addObject:model];
        }
        
        [self.tableView reloadData];
        
    });
}

//tableView懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouce.count * 10000;//这个数据随便设置
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //方法---返回cell高度
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID = @"myCell";
    TableCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[TableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    //计算角标
    NSInteger index  = indexPath.row % self.dataSouce.count;
    
//    NSLog(@"%ld",(long)index);
    
    //给cell赋值
   cell.model = self.dataSouce[index];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

//数组懒加载
-(NSMutableArray *)dataSouce{
    if (!_dataSouce) {
        _dataSouce = [NSMutableArray array];
    }
    return _dataSouce;
}

-(void)dealloc{
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
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
