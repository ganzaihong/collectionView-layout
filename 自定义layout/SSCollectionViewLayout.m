//
//  SSCollectionViewLayout.m
//  自定义layout
//
//  Created by ganzaihong on 2018/11/26.
//  Copyright © 2018年 YD. All rights reserved.
//

#import "SSCollectionViewLayout.h"

@interface SSCollectionViewLayout()

/** cell height arrays */
@property(nonatomic,strong)NSArray *cellHeightArrays;

/** attributes arrays */
@property(nonatomic,strong)NSMutableArray *attributesArrays;

/** cell array */
@property(nonatomic,strong)NSMutableArray *tempAttributesArrays;

@end

@implementation SSCollectionViewLayout

-(instancetype)initWithArrays:(NSArray *)cellHeightArrays
{
    if (self = [super init]) {
    
        self.cellHeightArrays = cellHeightArrays;
    }

    return self;
}

//自定义layout需要重写这些方法
-(void)prepareLayout
{
    [super prepareLayout];
    
    [self.attributesArrays  removeAllObjects];
    [self.tempAttributesArrays removeAllObjects];
    //获取当前collectionView对应区的item
    //获取senction全部个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i < count; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow: i inSection:0]];
   
        [self.attributesArrays addObject:attributes];
    }
    
    
    
    
    
}

//返回collectionView的内容的尺寸
-(CGSize)collectionViewContentSize
{
    CGFloat maxContentHeight = CGRectGetMaxY([[self.tempAttributesArrays firstObject] frame]);
    for (UICollectionViewLayoutAttributes *attributes in self.tempAttributesArrays) {
        if (maxContentHeight  < attributes.frame.size.height) {
            maxContentHeight = CGRectGetMaxY(attributes.frame);
        }
    }
    return CGSizeMake(self.collectionView.bounds.size.width, maxContentHeight);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributesArrays;
}
///返回对应于indexPath的位置的cell的布局属性,返回指定indexPath的item的布局信息。子类必须重载该方法,该方法只能为cell提供布局信息，不能为补充视图和装饰视图提供。
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat itemWidth = (self.collectionView.bounds.size.width  - (10 + 10 + 10 * 2))/3;
    CGFloat itemHeight = [self.cellHeightArrays[indexPath.row] floatValue];
    //在这里用上cellArrays了,横排最多显示3个
    if (self.tempAttributesArrays.count < 3) {//设置第一排rect
        [self.tempAttributesArrays addObject:attributes];
        NSLog(@"%ld",self.tempAttributesArrays.count);
        CGRect rect  = CGRectMake(10 +( itemWidth + 10) * (self.tempAttributesArrays.count - 1), 10, itemWidth, itemHeight);
        attributes.frame = rect;
    }else{
        
        UICollectionViewLayoutAttributes *fristAttributes = [self.tempAttributesArrays firstObject];
        CGFloat minY = CGRectGetMaxY(fristAttributes.frame);
        CGFloat Y = minY;
        NSInteger index = 0;
        CGRect itemFrame = CGRectMake(fristAttributes.frame.origin.x, CGRectGetMaxY(fristAttributes.frame) + 10, itemWidth, itemHeight);
        for (UICollectionViewLayoutAttributes *attri in self.tempAttributesArrays) {
            if (minY > CGRectGetMaxY(attri.frame)) {
                minY = CGRectGetMaxY(attri.frame);
                Y = minY;
                itemFrame = CGRectMake(attri.frame.origin.x, Y + 10, itemWidth, itemHeight);
                NSInteger currentIndex = [self.tempAttributesArrays indexOfObject:attri];
                index = currentIndex;
            }
        }
        
        attributes.frame = itemFrame;
        [self.tempAttributesArrays replaceObjectAtIndex:index withObject:attributes];
        
        
    }
    
    
    
    
    
    
    return attributes;
}



#pragma mark - # getter
-(NSMutableArray *)attributesArrays
{
    if (_attributesArrays == nil) {
        _attributesArrays = [NSMutableArray array];
    }
    return _attributesArrays;
}

-(NSArray *)cellHeightArrays
{
    if (_cellHeightArrays == nil) {
        _cellHeightArrays = [NSArray array];
    }
    return _cellHeightArrays;
}


-(NSMutableArray *)tempAttributesArrays
{
    if (_tempAttributesArrays == nil) {
        _tempAttributesArrays = [NSMutableArray array];
    }
    return _tempAttributesArrays;
}

@end
