//
//  CollectionDataCell.m
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import "CollectionDataCell.h"
#import "ScrollerDataSourceObject.h"
@implementation CollectionDataCell

- (void)awakeFromNib {
    // Initialization code
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    [self.iconImageView addGestureRecognizer:tapGesture];
}
/**
 *  手势方法
 */
- (void)clickImage:(UITapGestureRecognizer *)clickImage
{
    if ([self.delegate respondsToSelector:@selector(clickCollectionCell:)]) {
        [self.delegate clickCollectionCell:self.dataObject.url];
    }
}
- (void)setDataObject:(ScrollerDataSourceObject *)dataObject
{
    if (_dataObject != dataObject) {
        _dataObject = dataObject;
    }
    self.titleLabel.text = dataObject.title;
#warning 需要在这里修改图片url,若是网络图片,请修改对应的网络请求
    self.iconImageView.image = [UIImage imageNamed:dataObject.icon];
}
@end
