//
//  TableModel.h
//  tableView无限循环
//
//  Created by 爱恨的潮汐 on 2018/4/18.
//  Copyright © 2018年 AiHenDeChaoXi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableModel : NSObject

@property(nonatomic,copy)NSString * imageUrl;//图片地址

@property(nonatomic,copy)NSString * type;//type 1是网络图片，2是本地图片

@property(nonatomic,copy)NSString * title;//标题

@end
