//
//  LeftAndRightView.m
//  CloudMall
//
//  Created by dengzhiping on 2017/2/22.
//  Copyright © 2017年 DongHui. All rights reserved.
//

#import "LeftAndRightView.h"
#import <Masonry.h>
static const CGFloat animationDuration = 0.5;

@interface LeftAndRightView ()
@property (nonatomic, strong) NSArray *btnTitles;
@end

@implementation LeftAndRightView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self addSubView];
    return self;
}

- (void)setBtnTitles:(NSArray *)titles{
    if (titles.count && titles.count == 2) {
        [_leftBtn setTitle:titles[0] forState:UIControlStateNormal];
        [_rightBtn setTitle:titles[1] forState:UIControlStateNormal];
    }
}

- (void)addSubView{
    
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    [self addSubview:self.verticalLine];
    [self addSubview:self.horizontalLineView];
    [self.horizontalLineView addSubview:self.horizontalLineImageView];
    
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.width.equalTo(@((SCREEN_WIDTH / 2) - 0.5));
        make.height.equalTo(@(self.bounds.size.height - 3));
    }];

    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.verticalLine.mas_right).with.offset(0.5);
        make.width.equalTo(@((SCREEN_WIDTH / 2) - 0.5));
        make.height.equalTo(@(self.bounds.size.height - 3));
    }];
    
    [_verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(5);
        make.left.equalTo(_leftBtn.mas_right).with.offset(0.5);
        make.width.equalTo(@(1));
        make.height.equalTo(@(self.bounds.size.height - 10));
    }];
    
    [_horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_leftBtn.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.height.equalTo(@3);
    }];

    [_horizontalLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.horizontalLineView.mas_top).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.left.equalTo(self.horizontalLineView.mas_left).with.offset(0);
        make.width.equalTo(@(SCREEN_WIDTH / 2));
    }];
    
    self.backgroundColor = [UIColor whiteColor];
    [self setBtnTitles:self.btnTitles];
    [_leftBtn setTitleColor:LeftTitleColor forState:UIControlStateNormal];
    [_rightBtn setTitleColor:RightTitleColor forState:UIControlStateNormal];

}

- (void)leftButton{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectLeftButton)]) {
        [UIView animateWithDuration:animationDuration animations:^{
            _horizontalLineImageView.frame = CGRectMake(0, 0,SCREEN_WIDTH / 2 ,3);
        }];
        [_leftBtn setTitleColor:LeftTitleColor forState:UIControlStateNormal];
        [_rightBtn setTitleColor:RightTitleColor forState:UIControlStateNormal];
        [_delegate didSelectLeftButton];
    }
}

- (void)rightButton{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectRightButton)]) {
        [UIView animateWithDuration:animationDuration animations:^{
            _horizontalLineImageView.frame = CGRectMake(SCREEN_WIDTH / 2, 0,SCREEN_WIDTH / 2 ,3);
        }];
        [_leftBtn setTitleColor:RightTitleColor forState:UIControlStateNormal];
        [_rightBtn setTitleColor:LeftTitleColor forState:UIControlStateNormal];
        [_delegate didSelectRightButton];
    }
}

#pragma mark - getter
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchDown];
           }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn addTarget:self action:@selector(rightButton) forControlEvents:UIControlEventTouchDown];
    }
    return _rightBtn;
}

- (UIView *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [[UIView alloc] init];
        _verticalLine.backgroundColor = PlaceHolderColor;
    }
    return _verticalLine;
    
}
- (UIView *)horizontalLineView{
    if (!_horizontalLineView) {
        _horizontalLineView = [[UIView alloc] init];
    }
    return _horizontalLineView;
}
- (UIImageView *)horizontalLineImageView{
    if (!_horizontalLineImageView) {
        _horizontalLineImageView = [[UIImageView alloc] init];
        _horizontalLineImageView.backgroundColor = BottomLineColor;
    }
    return _horizontalLineImageView;
}

@end
