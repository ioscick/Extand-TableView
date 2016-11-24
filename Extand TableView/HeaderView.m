//
//  HeaderView.m
//  Extand TableView
//
//  Created by shenliping on 16/4/14.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame IsOpen:(BOOL)isOpen {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.nameLabel];
        [self addSubview:self.imageView];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOpen)]];
        self.isOpen = isOpen;
        if (self.isOpen) {
            _imageView.transform = CGAffineTransformRotate(_imageView.transform, M_PI / 2);
        }
    }
    return self;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        _imageView.image = [UIImage imageNamed:@"右边.png"];
    }
    return _imageView;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, 100, self.frame.size.height - 20)];
    }
    return _nameLabel;
}


- (void)tapOpen{
    if (_isOpen) {
        [UIView animateWithDuration:0.3 animations:^{
            _imageView.transform = CGAffineTransformRotate(_imageView.transform, -M_PI / 2);
        }];
        self.closeblock(self.section);
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            _imageView.transform = CGAffineTransformRotate(_imageView.transform, M_PI / 2);
        }];
        self.openblock(self.section);
    }
    self.isOpen = !self.isOpen;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
