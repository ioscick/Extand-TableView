//
//  BaseDataModel.h
//  Extand TableView
//
//  Created by shenliping on 16/4/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataModel : NSObject

@property (strong, nonatomic) NSArray *dataArray;

@property (strong, nonatomic) NSString *name;

@property (assign, nonatomic) BOOL isOpen;

@end
