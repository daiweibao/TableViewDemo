//
//  TableCell.m
//  TableViewDemo
//
//  Created by 爱恨的潮汐 on 2018/4/18.
//  Copyright © 2018年 AiHenDeChaoXi. All rights reserved.
//

#import "TableCell.h"

@interface TableCell()
@property(nonatomic,weak)UIImageView * imageLogo;//图片
@property(nonatomic,weak)UILabel * labelTitle;

@end

@implementation TableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        //创建UI
        [self createUI];
    }
    return self;
}

-(void)setModel:(TableModel *)model{
    _model = model;
    
    //赋值
//    type 1是网络图片，2是本地图片
    
    if ([model.type isEqual:@"1"]) {
        //网络图片
        [self.imageLogo sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"xiumeilogo"]];
        
        self.labelTitle.text = model.title;
         self.labelTitle.backgroundColor = [UIColor greenColor];
        
    }else{
        //本地图片
        self.imageLogo.image =[UIImage imageNamed:model.imageUrl];
        
         self.labelTitle.text = model.title;
        self.labelTitle.backgroundColor = [UIColor redColor];
    }

}

//UI
-(void)createUI{
    UIImageView * imageLogo = [[UIImageView alloc]init];
    self.imageLogo = imageLogo;
    imageLogo.frame = CGRectMake(15, 10, 180*16/9, 180);
    imageLogo.contentMode = UIViewContentModeScaleAspectFill;
    imageLogo.clipsToBounds = YES;
    //在这里赋值缺省图
    imageLogo.image =[UIImage imageNamed:@"xiumeilogo"];
    [self.contentView addSubview:imageLogo];
    
    
    //创建标题
    UILabel * labelTitle = [[UILabel alloc]init];
    self.labelTitle = labelTitle;
    labelTitle.frame = CGRectMake(0, 0, 100, 44);
    labelTitle.text = @"标题";
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.textAlignment = NSTextAlignmentCenter;
    [imageLogo addSubview:labelTitle];
    
}

@end
