//
//  HeaderView.h
//  Extand TableView
//
//  Created by shenliping on 16/4/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^openBlock)(NSInteger section);
typedef void(^closeBlock)(NSInteger section);

@interface HeaderView : UIView

@property (assign, nonatomic) BOOL isOpen;
@property (assign, nonatomic) NSInteger section;

@property (strong, nonatomic) UILabel *nameLabel;

@property (strong, nonatomic) UIImageView *imageView;

@property (copy, nonatomic) openBlock openblock;
@property (copy, nonatomic) closeBlock closeblock;

- (instancetype)initWithFrame:(CGRect)frame IsOpen:(BOOL)isOpen;

@end
