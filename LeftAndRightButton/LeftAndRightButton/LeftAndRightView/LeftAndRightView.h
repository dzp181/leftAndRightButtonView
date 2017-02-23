//
//  LeftAndRightView.h
//  CloudMall
//
//  Created by dengzhiping on 2017/2/22.
//  Copyright © 2017年 DongHui. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LeftTitleColor [UIColor colorWithRed:61/255.0  green:178/255.0  blue:222/255.0 alpha:1]
#define RightTitleColor [UIColor colorWithRed:62/255.0  green:58/255.0  blue:57/255.0 alpha:1]
#define PlaceHolderColor [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1]
#define BottomLineColor [UIColor colorWithRed:61/255.0  green:178/255.0  blue:222/255.0 alpha:1]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@protocol LeftAndRightViewDelegate <NSObject>

/**
    @warning: two methods  must be called that left button and right button 's action
 */

@required

/**
    左边按钮点击事件
 */
- (void)didSelectLeftButton;

/**
    右边按钮点击事件
 */
- (void)didSelectRightButton;

@end

@interface LeftAndRightView : UIView

/**
    delegate : 代理
 */
@property (nonatomic, assign) id<LeftAndRightViewDelegate> delegate;

/**
 leftBtn:  左边按钮
 */
@property (nonatomic, strong) UIButton *leftBtn;


/**
 rightBtn:  右边按钮
 */
@property (nonatomic, strong) UIButton *rightBtn;


/**
 verticalLine:  竖直线条
 */
@property (nonatomic, strong) UIView   *verticalLine;

/**
    horizontalLineView:  水平线条
 */
@property (nonatomic, strong) UIView   *horizontalLineView;

/**
    horizontalLineImageView :  动画线条
 */
@property (nonatomic, strong) UIImageView  *horizontalLineImageView;


/**
    initWithFrame: is based on masonry, you must install masonry
 */
- (instancetype)initWithFrame:(CGRect)frame;

/*
 * set Button title 
 * give a array that array's count  == 2 ,
 * which array[0] == left's title ,array[1] == right'title
 */

- (void)setBtnTitles:(NSArray *)titles;

@end
