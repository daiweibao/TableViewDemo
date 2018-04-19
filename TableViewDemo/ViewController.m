//
//  ViewController.m
//  TableViewDemo
//
//  Created by 爱恨的潮汐 on 2018/4/18.
//  Copyright © 2018年 AiHenDeChaoXi. All rights reserved.
//

#import "ViewController.h"
#import "TableController.h"
#import "UIView+Extension.h"//布局
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.centerX-100, 100, 200, 40);
    [button setTitle:@"点击打开tableView" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.layer.borderWidth = 1;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.cornerRadius = 5;
    [button addTarget:self action:@selector(ActionButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //名字
    UILabel * labelName = [[UILabel alloc]init];
    labelName.frame = CGRectMake(self.view.centerX-100, button.bottomY+50, 200, 44);
    labelName.text = @"姓名：戴维保";
    labelName.textColor = [UIColor blackColor];
    labelName.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelName];
}


-(void)ActionButton{
    TableController * tableVC = [[TableController alloc]init];
    [self presentViewController:tableVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
