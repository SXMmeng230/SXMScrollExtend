//
//  ScrollerView.h
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollerViewDelegate <NSObject>

- (void)clickScrollerViewImage:(NSString *)deImageStr;

@end

@interface ScrollerView : UIView
/**
 *  创建scrollerView
 *
 *  @return ScrollerView 对象
 */
- (instancetype)initWithScrollerFrame:(CGRect)frame;
/**
 *  数据源数组,让外界传入数据
 */
@property (nonatomic, strong) NSArray *dataSourceArray;
/**
 *  代理属性
 */
@property (nonatomic, weak) id<ScrollerViewDelegate>delegate;
@end
