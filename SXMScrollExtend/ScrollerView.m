//
//  ScrollerView.m
//  SXMScrollExtend
//
//  Created by shengxi on 14/12/25.
//  Copyright (c) 2014年 孙晓萌. All rights reserved.
//

#import "ScrollerView.h"
#import "CollectionDataCell.h"
//每一行最大数据
#define kTotalRowsInSection (500 * self.dataSourceArray.count)
#define kCenterRows (NSUInteger)(kTotalRowsInSection * 0.5)

@interface ScrollerView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewCellDelegate>


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ScrollerView

- (instancetype)initWithScrollerFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ScrollerView" owner:nil options:nil] lastObject];
        self.frame = frame;
    }
    return self;
}
- (void)awakeFromNib
{
    [self.collectionView  registerNib:[UINib nibWithNibName:@"CollectionDataCell" bundle:nil] forCellWithReuseIdentifier:@"dataCell"];
}
- (void)setDataSourceArray:(NSArray *)dataSourceArray
{
    if (_dataSourceArray != dataSourceArray) {
        _dataSourceArray = dataSourceArray;
    }
    if (_dataSourceArray.count > 1) {
        self.collectionView.scrollEnabled = YES;
        self.pageControl.hidden = NO;
        self.pageControl.numberOfPages = self.dataSourceArray.count;
        if (self.timer == nil) {
            [self addTimer];
        }
        [self.collectionView reloadData];
    }else{
        self.pageControl.hidden = YES;
        self.collectionView.scrollEnabled = NO;
    }
}
/**
 *  添加定时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/**
 *  移除定时器
 */
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
/**
 *  滚动到下一张图片
 */
- (void)nextPage
{
    NSIndexPath *visiablePath = [[self.collectionView indexPathsForVisibleItems] firstObject];
    NSUInteger visiablItem = visiablePath.item;
    if ((visiablePath.item % self.dataSourceArray.count) == 0) {
        //滚动到第0张图片
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:kCenterRows inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        visiablItem = kCenterRows;
    }
    //滚动到下一张图片
    NSUInteger nextItem = visiablItem + 1;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return kTotalRowsInSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionDataCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dataCell" forIndexPath:indexPath];
    cell.dataObject = self.dataSourceArray[indexPath.item % self.dataSourceArray.count];
    cell.delegate = self;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.collectionView.frame.size;
}
/**
 *  计算pageControll
 */
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *visiablePath = [[collectionView indexPathsForVisibleItems] firstObject];
    self.pageControl.currentPage = visiablePath.item % self.dataSourceArray.count;
}
/**
 *  移除定时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
/**
 *  添加定时器
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self addTimer];
}
/**
 *  CollectionDataCell协议的方法
 */
- (void)clickCollectionCell:(NSString *)desImageStr
{
    if ([self.delegate respondsToSelector:@selector(clickScrollerViewImage:)]) {
        [self.delegate clickScrollerViewImage:desImageStr];
    }
}
@end
