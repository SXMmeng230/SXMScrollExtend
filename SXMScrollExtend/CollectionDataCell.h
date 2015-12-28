//
//  CollectionDataCell.h
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollerDataSourceObject;

@protocol UICollectionViewCellDelegate <NSObject>

- (void)clickCollectionCell:(NSString *)desImageStr;

@end

@interface CollectionDataCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
/**
 *  数据模型对象
 */
@property (nonatomic, strong) ScrollerDataSourceObject *dataObject;
/**
 *  代理属性
 */
@property (nonatomic, weak) id<UICollectionViewCellDelegate>delegate;
@end
