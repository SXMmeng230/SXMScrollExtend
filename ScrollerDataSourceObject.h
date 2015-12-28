//
//  ScrollerDataSourceObject.h
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollerDataSourceObject : NSObject
/**
 *  图片上的标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  图片链接
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  点击图片地址
 */
@property (nonatomic, copy) NSString *url;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
